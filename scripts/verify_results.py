from pathlib import Path
import csv
import re

ROOT = Path(__file__).resolve().parents[1]
RAW = ROOT / "results/raw"
PROCESSED = ROOT / "results/processed"

with (PROCESSED / "roi_results_verified.csv").open() as f:
    rows = list(csv.DictReader(f))

benchmarks = ["matmult-int", "crc32", "wikisort"]
opts = ["-O0", "-O2", "-O3", "-Os"]
caches = ["C1", "C2", "C3"]

expected = {
    (b, o, c)
    for b in benchmarks for o in opts for c in caches
}

actual = {
    (r["Benchmark"], r["Optimization"], r["Cache"])
    for r in rows
}

assert len(rows) == 36 and actual == expected, \
    "Main experiment combinations are incomplete"

for row in rows:
    name = (
        f'{row["Benchmark"]}_'
        f'{row["Optimization"][1:]}_'
        f'{row["Cache"]}'
    )
    path = RAW / "main" / name / "stats.txt"
    text = path.read_text()

    blocks = re.findall(
        r"---------- Begin Simulation Statistics ----------(.*?)"
        r"---------- End Simulation Statistics",
        text, re.S
    )
    assert len(blocks) == 2, f"{name}: unexpected statistics blocks"

    stats = {}
    for line in blocks[0].splitlines():
        parts = line.split("#", 1)[0].split()
        if len(parts) >= 2:
            stats[parts[0]] = parts[1]

    metrics = {
        "ROI_Cycles": "system.cpu.numCycles",
        "ROI_Instructions": "system.cpu.commitStats0.numInsts",
        "ROI_CPI": "system.cpu.cpi",
        "ROI_IPC": "system.cpu.ipc",
    }

    for column, key in metrics.items():
        difference = abs(float(row[column]) - float(stats[key]))
        assert difference < 1e-5, f"{name}: {column} mismatch"

for opt in ["O0", "O2"]:
    for cache in ["C4", "C8"]:
        path = RAW / "cache_sensitivity" / \
            f"matmult-int_{opt}_{cache}" / "stats.txt"
        assert path.is_file(), f"Missing: {path.name}"

figures = ROOT / "results/figures"
assert len(list(figures.glob("*.png"))) == 8
assert len(list(figures.glob("*.pdf"))) == 8

print("PASS: 36 main experiments match the verified CSV")
print("PASS: 4 cache sensitivity statistics files exist")
print("PASS: 8 PNG and 8 PDF figures exist")
