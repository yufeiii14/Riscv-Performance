from pathlib import Path
import csv
import numpy as np
import matplotlib.pyplot as plt

ROOT = Path.home() / "riscv-gem5-project"
ORIGINAL = ROOT / "results/ROI_final/roi_results_verified.csv"
EXTENDED = ROOT / "results/cache_sensitivity/cache_sensitivity_results.csv"
OUT = ROOT / "results/ROI_final/final_analysis"
FIG = OUT / "figures"
FIG.mkdir(parents=True, exist_ok=True)

OPTS = ["-O0", "-O2"]
SIZES = [4, 8, 16, 32, 64]
COLORS = {"-O0": "#D9DEE5", "-O2": "#31537E"}

data = {}

def read_rows(path):
    with path.open(newline="", encoding="utf-8-sig") as f:
        return list(csv.DictReader(f))

def add(opt, size, cycles, misses, source):
    key = (opt, size)
    assert key not in data, f"Duplicate: {key}"
    assert cycles > 0 and 0 <= misses <= 100
    data[key] = {"cycles": cycles, "miss": misses}
    print(f"Loaded {opt}, {size} KB from {source}")

# Original experiments: 16, 32, 64 KB
for r in read_rows(ORIGINAL):
    if r["Benchmark"] != "matmult-int":
        continue

    opt = r["Optimization"]
    if opt not in OPTS:
        continue

    size = {"C1": 16, "C2": 32, "C3": 64}[r["Cache"]]
    accesses = float(r["L1D_Accesses"])
    misses = float(r["L1D_Misses"])
    assert accesses > 0 and 0 <= misses <= accesses

    add(opt, size, float(r["ROI_Cycles"]),
        100 * misses / accesses, "verified ROI CSV")

# Additional experiments: 4, 8 KB
for r in read_rows(EXTENDED):
    opt = r["Optimization"]
    size = int(str(r["L1D_KB"]).replace("kB", "").replace("KB", "").strip())

    if opt not in OPTS or size not in (4, 8):
        continue

    add(opt, size, float(r["ROI_Cycles"]),
        float(r["L1D_Miss_Rate_Percent"]), "sensitivity CSV")

assert len(data) == 10, "Expected exactly 10 configurations"
assert all((o, s) in data for o in OPTS for s in SIZES)

# Calculate overhead against the 64 KB baseline
for opt in OPTS:
    baseline = data[(opt, 64)]["cycles"]
    for size in SIZES:
        row = data[(opt, size)]
        row["overhead"] = 100 * (row["cycles"] / baseline - 1)

# Generate Table 3 with all five cache sizes
TABLE = OUT / "table3_cache_sensitivity.csv"

with TABLE.open("w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow([
        "L1D Cache (KB)",
        "-O0 Cycle Overhead (%)",
        "-O2 Cycle Overhead (%)",
        "-O0 L1D Miss Rate (%)",
        "-O2 L1D Miss Rate (%)"
    ])

    for size in SIZES:
        writer.writerow([
            size,
            f'{data[("-O0", size)]["overhead"]:.6f}',
            f'{data[("-O2", size)]["overhead"]:.6f}',
            f'{data[("-O0", size)]["miss"]:.6f}',
            f'{data[("-O2", size)]["miss"]:.6f}'
        ])

# Draw Figure 8: clearly visible 4 KB and 8 KB results
plt.rcParams.update({
    "font.family": "Times New Roman",
    "font.size": 12,
    "pdf.fonttype": 42
})

fig, axes = plt.subplots(1, 2, figsize=(11.5, 5.8))
fig.patch.set_facecolor("white")

fig.text(
    0.065, 0.96, "Small-Cache Sensitivity of matmult-int",
    fontsize=18, weight="bold", color="#20324A"
)
fig.text(
    0.065, 0.905,
    "4-8 KB L1D configurations | Complete 4-64 KB results in Table 3",
    fontsize=12, color="#52657A"
)

x = np.arange(2)
width = 0.25
positions = {"-O0": -0.16, "-O2": 0.16}

panels = [
    ("overhead", "(a) Execution Cycle Overhead",
     "Overhead vs. 64 KB (%)", 15, "{:.2f}%"),
    ("miss", "(b) L1D Cache Miss Rate",
     "L1D miss rate (%)", 2.05, "{:.2f}%")
]

for ax, (metric, heading, ylabel, ymax, fmt) in zip(axes, panels):
    for opt in OPTS:
        values = [data[(opt, s)][metric] for s in (4, 8)]

        bars = ax.bar(
            x + positions[opt],
            values,
            width=width,
            color=COLORS[opt],
            edgecolor="#52657A",
            linewidth=0.7,
            label=opt,
            zorder=3
        )

        for bar, value in zip(bars, values):
            ax.annotate(
                fmt.format(value),
                (bar.get_x() + bar.get_width() / 2,
                 bar.get_height()),
                xytext=(0, 6),
                textcoords="offset points",
                ha="center",
                va="bottom",
                fontsize=11,
                fontweight="bold",
                color="#20324A"
            )

    ax.set_title(
        heading, fontsize=14, weight="bold",
        color="#20324A", pad=16
    )
    ax.set_xticks(x)
    ax.set_xticklabels(["4 KB", "8 KB"], fontsize=12)
    ax.set_ylabel(ylabel, fontsize=12)
    ax.set_ylim(0, ymax)
    ax.set_xlim(-0.65, 1.65)
    ax.grid(axis="y", color="#E2E7ED", linewidth=0.7)
    ax.set_axisbelow(True)

    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_color("#AAB7C8")
    ax.spines["bottom"].set_color("#AAB7C8")

handles, labels = axes[0].get_legend_handles_labels()

fig.legend(
    handles, labels,
    loc="lower center",
    ncol=2,
    bbox_to_anchor=(0.5, 0.045),
    frameon=True,
    fontsize=12
)

fig.subplots_adjust(
    left=0.09, right=0.98,
    top=0.77, bottom=0.24,
    wspace=0.27
)

base = FIG / "figure8_cache_sensitivity"

fig.savefig(
    str(base) + ".png",
    dpi=350,
    bbox_inches="tight",
    pad_inches=0.15
)
fig.savefig(
    str(base) + ".pdf",
    bbox_inches="tight",
    pad_inches=0.15
)
plt.close(fig)

print("\nSUCCESS")
print("Figure 8:", str(base) + ".png")
print("Vector PDF:", str(base) + ".pdf")
print("Table 3:", TABLE)
print("Verified configurations:", len(data))
