from pathlib import Path
import csv
import numpy as np
import matplotlib.pyplot as plt

ROOT = Path.home() / "riscv-gem5-project"
OLD = ROOT / "results/ROI_final/roi_results_verified.csv"
NEW = ROOT / "results/cache_sensitivity/cache_sensitivity_results.csv"
OUT = ROOT / "results/ROI_final/final_analysis/figures"

sizes = [4, 8, 16, 32, 64]
opts = ["-O0", "-O2"]
colors = {"-O0": "#D9DEE5", "-O2": "#31537E"}
data = {}

with OLD.open(newline="") as f:
    for r in csv.DictReader(f):
        if r["Benchmark"] == "matmult-int" and r["Optimization"] in opts:
            size = {"C1": 16, "C2": 32, "C3": 64}[r["Cache"]]
            data[(r["Optimization"], size)] = (
                float(r["ROI_Cycles"]),
                100 * float(r["L1D_Misses"]) / float(r["L1D_Accesses"])
            )

with NEW.open(newline="") as f:
    for r in csv.DictReader(f):
        data[(r["Optimization"], int(r["L1D_KB"]))] = (
            float(r["ROI_Cycles"]),
            float(r["L1D_Miss_Rate_Percent"])
        )

assert len(data) == 10, "Expected 10 unique configurations"
assert all((o, s) in data for o in opts for s in sizes)

plt.rcParams.update({
    "font.family": "Times New Roman",
    "font.size": 12,
    "pdf.fonttype": 42
})

fig, axes = plt.subplots(1, 2, figsize=(11.5, 5.7))
fig.patch.set_facecolor("white")

fig.text(0.055, 0.96, "Cache Sensitivity of matmult-int",
         fontsize=18, weight="bold", color="#20324A")
fig.text(0.055, 0.905,
         "ROI performance and L1D miss rate | 4-64 KB L1D cache",
         fontsize=12.5, color="#4A5568")

x = np.arange(len(sizes))
width = 0.31

for ax, metric in zip(axes, ["cycles", "miss"]):
    for i, opt in enumerate(opts):
        values = []
        for size in sizes:
            cycles, miss = data[(opt, size)]
            if metric == "cycles":
                baseline = data[(opt, 64)][0]
                value = 100 * (cycles / baseline - 1)
            else:
                value = miss
            values.append(value)

        bars = ax.bar(
            x + (-0.18 if i == 0 else 0.18),
            values,
            width=width,
            color=colors[opt],
            edgecolor="#53657B",
            linewidth=0.7,
            label=opt,
            zorder=3
        )

        for bar, value in zip(bars, values):
            if value >= 0.3:
                ax.text(
                    bar.get_x() + bar.get_width() / 2,
                    value + (0.25 if metric == "cycles" else 0.035),
                    f"{value:.2f}%",
                    ha="center", va="bottom",
                    fontsize=11, weight="bold",
                    color="#20324A"
                )

    ax.set_xticks(x)
    ax.set_xticklabels([f"{s} KB" for s in sizes], fontsize=11)
    ax.grid(axis="y", color="#E2E7ED", linewidth=0.7)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_color("#AAB7C8")
    ax.spines["bottom"].set_color("#AAB7C8")
    ax.tick_params(axis="y", labelsize=11)

axes[0].set_title("(a) Execution Cycle Overhead",
                  fontsize=14, weight="bold", color="#20324A")
axes[0].set_ylabel("Overhead vs. 64 KB (%)", fontsize=12)
axes[0].set_ylim(0, 15)

axes[1].set_title("(b) L1D Cache Miss Rate",
                  fontsize=14, weight="bold", color="#20324A")
axes[1].set_ylabel("L1D Miss Rate (%)", fontsize=12)
axes[1].set_ylim(0, 2.0)

handles, labels = axes[0].get_legend_handles_labels()
fig.legend(handles, labels, loc="lower center",
           ncol=2, fontsize=12, frameon=True,
           bbox_to_anchor=(0.5, 0.035))

fig.subplots_adjust(left=0.08, right=0.98,
                    top=0.77, bottom=0.22, wspace=0.25)

OUT.mkdir(parents=True, exist_ok=True)
for ext in ("png", "pdf"):
    fig.savefig(OUT / f"figure8_cache_sensitivity.{ext}",
                dpi=350, bbox_inches="tight", pad_inches=0.15)

plt.close(fig)

print("Figure 8 generated successfully.")
print("PNG and PDF saved.")
print("All 10 configurations verified.")
