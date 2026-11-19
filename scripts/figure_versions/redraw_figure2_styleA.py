from pathlib import Path
import csv
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Rectangle

# ---------- paths ----------
ROOT = Path("/home/yufei/riscv-gem5-project")
CSV = ROOT / "results/ROI_final/final_analysis/table2_performance_summary.csv"
OUTDIR = ROOT / "results/ROI_final/final_analysis/figures"
OUTDIR.mkdir(parents=True, exist_ok=True)

# ---------- load data ----------
benchmarks = ["matmult-int", "crc32", "wikisort"]
opts = ["-O0", "-O2", "-O3", "-Os"]

with CSV.open(newline="", encoding="utf-8") as f:
    rows = [
        row for row in csv.DictReader(f)
        if row["Cache"] == "C2"
    ]

data = {
    (row["Benchmark"], row["Optimization"]): float(row["ROI_IPC"])
    for row in rows
}
assert len(data) == 12, "Expected 12 benchmark configurations"

# ---------- style ----------
plt.rcParams["font.family"] = "Times New Roman"
plt.rcParams["axes.edgecolor"] = "#4A5568"
plt.rcParams["axes.linewidth"] = 1.0

colors = {
    "-O0": "#D9DEE5",
    "-O2": "#AFC4DE",
    "-O3": "#6E8FB7",
    "-Os": "#2E4E79",
}

# values
pivot = {
    opt: np.array([data[(bench, opt)] for bench in benchmarks])
    for opt in opts
}

# ---------- figure ----------
fig, ax = plt.subplots(figsize=(10.5, 6.4), dpi=300)
fig.patch.set_facecolor("white")
ax.set_facecolor("white")

x = np.arange(len(benchmarks))
bar_w = 0.14
offsets = np.array([-0.27, -0.09, 0.09, 0.27])

bars = []
for i, opt in enumerate(opts):
    b = ax.bar(
        x + offsets[i],
        pivot[opt],
        width=bar_w,
        color=colors[opt],
        edgecolor="#4A5568",
        linewidth=0.8,
        label=opt,
        zorder=3
    )
    bars.append(b)

# ---------- labels ----------
for i, opt in enumerate(opts):
    vals = pivot[opt]
    for j, v in enumerate(vals):
        ax.text(
            x[j] + offsets[i],
            v + 0.008,
            f"{v:.3f}",
            ha="center",
            va="bottom",
            fontsize=10.5,
            color="#1F2937",
            fontweight="semibold"
        )

# ---------- axes ----------
ax.set_xticks(x)
ax.set_xticklabels(benchmarks, fontsize=12)
ax.set_ylabel("Instructions Per Cycle (IPC)", fontsize=12.5)
ax.set_ylim(0, 0.50)
ax.set_yticks(np.arange(0, 0.51, 0.10))
ax.tick_params(axis="y", labelsize=11)
ax.grid(axis="y", color="#D6DCE5", linewidth=0.8, alpha=0.9, zorder=0)
ax.set_axisbelow(True)

# spines
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)
ax.spines["left"].set_color("#4A5568")
ax.spines["bottom"].set_color("#4A5568")

# ---------- title ----------
fig.text(
    0.08, 0.95,
    "Instruction Throughput Across Optimization Levels",
    fontsize=17, fontweight="bold", color="#20324A"
)
fig.text(
    0.08, 0.915,
    "ROI instructions per cycle (IPC)  |  32 KB L1D cache",
    fontsize=11.5, color="#4A5568"
)

# ---------- legend ----------
leg = ax.legend(
    ncol=4,
    loc="upper center",
    bbox_to_anchor=(0.5, -0.12),
    frameon=True,
    fontsize=10.5,
    handlelength=1.0,
    columnspacing=1.6,
    borderpad=0.6
)
leg.get_frame().set_edgecolor("#B8C2D1")
leg.get_frame().set_linewidth(0.8)
leg.get_frame().set_facecolor("white")

# ---------- border box around plotting region ----------
ax.add_patch(
    Rectangle(
        (0, 0), 1, 1,
        transform=ax.transAxes,
        fill=False,
        linewidth=1.0,
        edgecolor="#B8C2D1"
    )
)

plt.subplots_adjust(left=0.11, right=0.97, top=0.84, bottom=0.22)

png_path = OUTDIR / "figure2_compiler_ipc.png"
pdf_path = OUTDIR / "figure2_compiler_ipc.pdf"

fig.savefig(png_path, dpi=300, bbox_inches="tight", facecolor="white")
fig.savefig(pdf_path, bbox_inches="tight", facecolor="white")
plt.close(fig)

print("Figure 2 redrawn successfully.")
print("PNG:", png_path)
print("PDF:", pdf_path)
print("Data source:", CSV)
print("Original experiment data: unchanged")
