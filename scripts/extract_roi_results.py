from pathlib import Path
import csv
import re
import subprocess
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--build-dir", type=Path, required=True)
args = parser.parse_args()

root = Path(__file__).resolve().parents[1]
base = root / "results/raw/main"

benchmarks = ["matmult-int", "crc32", "wikisort"]
opts = ["O0", "O2", "O3", "Os"]
caches = ["C1", "C2", "C3"]

def parse_first_block(path):
    text = path.read_text()
    blocks = re.findall(
        r"---------- Begin Simulation Statistics ----------(.*?)"
        r"---------- End Simulation Statistics",
        text, re.S
    )
    if len(blocks) != 2:
        raise ValueError(f"{path}: expected 2 blocks, got {len(blocks)}")

    data = {}
    for line in blocks[0].splitlines():
        parts = line.split("#", 1)[0].split()
        if len(parts) >= 2:
            data[parts[0]] = parts[1]
    return data

def get_stat(data, key):
    return data.get(key, "")

rows = []

for benchmark in benchmarks:
    for opt in opts:
        binary = args.build_dir / f"embench_ROI_{opt}/src/{benchmark}/{benchmark}"

        size_result = subprocess.run(
            ["riscv64-linux-gnu-size", "-A", str(binary)],
            capture_output=True, text=True, check=True
        )
        text_size = ""
        for line in size_result.stdout.splitlines():
            if line.strip().startswith(".text "):
                text_size = line.split()[1]
                break

        for cache in caches:
            name = f"{benchmark}_{opt}_{cache}"
            folder = base / name
            data = parse_first_block(folder / "stats.txt")

            dcache_miss = next(
                (v for k, v in data.items()
                 if "dcache" in k.lower() and "overallmissrate" in k.lower()
                 and "total" in k.lower()), ""
            )
            icache_miss = next(
                (v for k, v in data.items()
                 if "icache" in k.lower() and "overallmissrate" in k.lower()
                 and "total" in k.lower()), ""
            )

            rows.append({
                "Benchmark": benchmark,
                "Optimization": f"-{opt}",
                "Cache": cache,
                "ROI_Cycles": get_stat(data, "system.cpu.numCycles"),
                "ROI_Instructions": get_stat(data, "system.cpu.commitStats0.numInsts"),
                "ROI_CPI": get_stat(data, "system.cpu.cpi"),
                "ROI_IPC": get_stat(data, "system.cpu.ipc"),
                "L1D_Miss_Rate": dcache_miss,
                "L1I_Miss_Rate": icache_miss,
                "Text_Size_Bytes": text_size,
                "ELF_Size_Bytes": binary.stat().st_size,
                "ROI_SimTicks": get_stat(data, "simTicks"),
                "ROI_End_Tick": get_stat(data, "finalTick")
            })

output = root / "results/regenerated/roi_results_extracted.csv"
output.parent.mkdir(parents=True, exist_ok=True)
with output.open("w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=rows[0].keys())
    writer.writeheader()
    writer.writerows(rows)

print(f"Extracted {len(rows)} experiments")
print(f"Saved: {output}")

for field in ["ROI_Cycles", "ROI_Instructions", "ROI_CPI",
              "ROI_IPC", "L1D_Miss_Rate", "L1I_Miss_Rate",
              "Text_Size_Bytes"]:
    missing = sum(not row[field] for row in rows)
    print(f"{field}: {missing} missing")
