from pathlib import Path
import csv
import math

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / "results" / "processed"
OUT = ROOT / "results" / "regenerated"
FIG = OUT / "figures"
FIG.mkdir(parents=True, exist_ok=True)

BENCHMARKS = ["matmult-int", "crc32", "wikisort"]
OPTS = ["-O0", "-O2", "-O3", "-Os"]
CACHES = ["C1", "C2", "C3"]
SIZES = [16, 32, 64]

with (BASE / "roi_results_verified.csv").open() as f:
    rows = list(csv.DictReader(f))

data = {
    (r["Benchmark"], r["Optimization"], r["Cache"]): r
    for r in rows
}

expected = {
    (b, o, c)
    for b in BENCHMARKS
    for o in OPTS
    for c in CACHES
}

assert len(rows) == 36
assert set(data) == expected

def val(b, o, c, field):
    value = float(data[(b, o, c)][field])
    assert math.isfinite(value)
    return value

def save(name):
    plt.tight_layout()
    plt.savefig(FIG / name, dpi=300, bbox_inches="tight")
    plt.close()

def compiler_bars(field, ylabel, filename, scale=1):
    fig, axes = plt.subplots(1, 3, figsize=(15, 4))

    for ax, b in zip(axes, BENCHMARKS):
        y = [val(b, o, "C2", field) / scale for o in OPTS]
        ax.bar(OPTS, y)
        ax.set_title(b)
        ax.set_ylabel(ylabel)
        ax.grid(axis="y", alpha=0.25)

    save(filename)

# Figure 1: Compiler vs Cycles
compiler_bars(
    "ROI_Cycles",
    "ROI Cycles (millions)",
    "figure1_compiler_cycles.png",
    1e6
)

# Figure 2: Compiler vs IPC
compiler_bars(
    "ROI_IPC",
    "ROI IPC",
    "figure2_compiler_ipc.png"
)

# Figure 3: Compiler vs Instruction Count
compiler_bars(
    "ROI_Instructions",
    "Committed Instructions (millions)",
    "figure3_compiler_instructions.png",
    1e6
)

# Figure 4: Compiler vs Code Size
compiler_bars(
    "Text_Size_Bytes",
    ".text Size (bytes)",
    "figure4_compiler_code_size.png"
)

# Figure 5: Cache vs Cycles
fig, axes = plt.subplots(1, 3, figsize=(15, 4))

for ax, b in zip(axes, BENCHMARKS):
    for o in OPTS:
        y = [
            val(b, o, c, "ROI_Cycles") / 1e6
            for c in CACHES
        ]
        ax.plot(SIZES, y, marker="o", label=o)

    ax.set_title(b)
    ax.set_xlabel("L1D Cache Size (KB)")
    ax.set_ylabel("ROI Cycles (millions)")
    ax.grid(alpha=0.25)
    ax.legend()

save("figure5_cache_cycles.png")

# Figure 6: Cache vs Miss Rate
fig, axes = plt.subplots(1, 3, figsize=(15, 4))

for ax, b in zip(axes, BENCHMARKS):
    for o in OPTS:
        y = [
            val(b, o, c, "L1D_Miss_Rate_Calculated") * 100
            for c in CACHES
        ]
        ax.plot(SIZES, y, marker="o", label=o)

    ax.set_title(b)
    ax.set_xlabel("L1D Cache Size (KB)")
    ax.set_ylabel("L1D Miss Rate (%)")
    ax.grid(alpha=0.25)
    ax.legend()

save("figure6_cache_miss_rate.png")

# Figure 7: Compiler x Cache heatmap
# Each cell shows cycle reduction relative to C1 at the same optimization.
fig, axes = plt.subplots(1, 3, figsize=(15, 4))

for ax, b in zip(axes, BENCHMARKS):
    matrix = np.array([
        [
            100 * (
                val(b, o, "C1", "ROI_Cycles")
                - val(b, o, c, "ROI_Cycles")
            ) / val(b, o, "C1", "ROI_Cycles")
            for c in CACHES
        ]
        for o in OPTS
    ])

    im = ax.imshow(matrix, aspect="auto", cmap="Blues")
    ax.set_xticks(range(3), ["16 KB", "32 KB", "64 KB"])
    ax.set_yticks(range(4), OPTS)
    ax.set_title(b)

    for i in range(4):
        for j in range(3):
            ax.text(
                j, i, f"{matrix[i,j]:.4f}%",
                ha="center", va="center",
                fontsize=8,
                color="black"
            )

fig.suptitle("Cycle Reduction Relative to 16 KB L1D Cache")
save("figure7_compiler_cache_heatmap.png")

# Table 1: Experimental Configuration
configuration = [
    ["Parameter", "Setting"],
    ["ISA", "RISC-V RV64GC"],
    ["Simulation", "gem5 SE mode"],
    ["CPU", "TimingSimpleCPU"],
    ["Clock", "1 GHz"],
    ["L1 Instruction Cache", "32 KB"],
    ["L1 Data Cache", "16 / 32 / 64 KB"],
    ["L2 Cache", "None"],
    ["Compiler Optimization", "-O0 / -O2 / -O3 / -Os"],
    ["Benchmarks", "matmult-int / crc32 / wikisort"],
    ["Measurement", "ROI after cache warm-up"],
    ["Experiments", "36"]
]

with (OUT / "table1_experimental_configuration.csv").open(
    "w", newline=""
) as f:
    csv.writer(f).writerows(configuration)

# Table 2: Performance Summary (all 36 experiments)
summary = []

for b in BENCHMARKS:
    for c in CACHES:
        baseline = val(b, "-O0", c, "ROI_Cycles")

        for o in OPTS:
            cycles = val(b, o, c, "ROI_Cycles")
            summary.append({
                "Benchmark": b,
                "Optimization": o,
                "Cache": c,
                "ROI_Cycles": int(cycles),
                "ROI_Instructions": int(
                    val(b, o, c, "ROI_Instructions")
                ),
                "ROI_IPC": val(b, o, c, "ROI_IPC"),
                "ROI_CPI": val(b, o, c, "ROI_CPI"),
                "Cycle_Reduction_vs_O0_Percent": round(
                    100 * (baseline - cycles) / baseline, 4
                ),
                "L1D_Miss_Rate_Percent": round(
                    val(b, o, c, "L1D_Miss_Rate_Calculated") * 100,
                    6
                ),
                "L1I_Miss_Rate_Percent": round(
                    val(b, o, c, "L1I_Miss_Rate_Calculated") * 100,
                    6
                ),
                "Text_Size_Bytes": int(
                    val(b, o, c, "Text_Size_Bytes")
                )
            })

with (OUT / "table2_performance_summary.csv").open(
    "w", newline=""
) as f:
    writer = csv.DictWriter(f, fieldnames=summary[0].keys())
    writer.writeheader()
    writer.writerows(summary)

# Automated results summary
lines = [
    "FINAL EXPERIMENT RESULTS SUMMARY",
    "================================",
    "",
    "Total experiments: 36",
    "Compiler optimization levels: 4",
    "L1D cache configurations: 3",
    "Benchmarks: 3",
    "",
    "COMPILER OPTIMIZATION RESULTS (32 KB L1D)",
    ""
]

for b in BENCHMARKS:
    baseline = val(b, "-O0", "C2", "ROI_Cycles")
    best = min(
        OPTS,
        key=lambda o: val(b, o, "C2", "ROI_Cycles")
    )
    best_cycles = val(b, best, "C2", "ROI_Cycles")
    improvement = 100 * (baseline - best_cycles) / baseline

    lines.append(
        f"{b}: best={best}, cycles={best_cycles:.0f}, "
        f"reduction_vs_O0={improvement:.3f}%"
    )

lines += [
    "",
    "CACHE SIZE EFFECT",
    ""
]

for b in BENCHMARKS:
    for o in OPTS:
        c1 = val(b, o, "C1", "ROI_Cycles")
        c3 = val(b, o, "C3", "ROI_Cycles")
        reduction = 100 * (c1 - c3) / c1

        lines.append(
            f"{b} {o}: C1_to_C3_cycle_reduction={reduction:.5f}%"
        )

lines += [
    "",
    "INTERPRETATION NOTES",
    "1. Cache results apply to the tested warmed-up ROI.",
    "2. Small miss counts do not prove small working-set size.",
    "3. The heatmap uses C1 as the baseline for each optimization.",
    "4. Results describe this simulator configuration, not all RISC-V CPUs.",
]

(OUT / "results_summary.txt").write_text(
    "\n".join(lines) + "\n"
)

print("\n========== FINAL ANALYSIS GENERATED ==========")
print("Experiments:", len(rows))
print("Figures:", len(list(FIG.glob("figure*.png"))))
print("Tables: 2")
print("Results summary: 1")
print("Output directory:", OUT)
print("\n".join(lines))
