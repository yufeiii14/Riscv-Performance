from pathlib import Path
import csv
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap

ROOT = Path.home() / "riscv-gem5-project"
CSV = ROOT / "results/ROI_final/roi_results_verified.csv"
OUT = ROOT / "results/ROI_final/final_analysis/figures"

BENCH = ["matmult-int", "crc32", "wikisort"]
OPTS = ["-O0", "-O2", "-O3", "-Os"]
CACHES = ["C1", "C2", "C3"]
SIZES = {"C1": 16, "C2": 32, "C3": 64}

COLORS = {
    "C1": "#D9DEE5",
    "C2": "#AFC4DE",
    "C3": "#31537E"
}

with CSV.open(newline="", encoding="utf-8") as f:
    rows = list(csv.DictReader(f))

data = {
    (r["Benchmark"], r["Optimization"], r["Cache"]): r
    for r in rows
}

assert len(rows) == 36 and len(data) == 36, \
    "Expected 36 unique experiment records"

for b in BENCH:
    for o in OPTS:
        for c in CACHES:
            assert (b, o, c) in data, f"Missing: {b}, {o}, {c}"

def cycles(b, o, c):
    return float(data[(b, o, c)]["ROI_Cycles"])

def miss_rate(b, o, c):
    r = data[(b, o, c)]
    accesses = float(r["L1D_Accesses"])
    misses = float(r["L1D_Misses"])
    assert accesses > 0 and 0 <= misses <= accesses
    return 100 * misses / accesses

plt.rcParams.update({
    "font.family": "Times New Roman",
    "font.size": 12,
    "axes.edgecolor": "#AAB7C8",
    "axes.linewidth": 0.9,
    "pdf.fonttype": 42,
    "savefig.facecolor": "white"
})

def title(fig, main, sub):
    fig.text(0.055, 0.96, main, fontsize=18,
             weight="bold", color="#20324A")
    fig.text(0.055, 0.905, sub, fontsize=12.5,
             color="#4A5568")

def axes_style(ax):
    ax.set_facecolor("white")
    ax.grid(axis="y", color="#E4E8EF",
            linewidth=0.7, zorder=0)
    ax.set_axisbelow(True)
    ax.tick_params(labelsize=12)

def save(fig, name):
    OUT.mkdir(parents=True, exist_ok=True)
    for extension in ("png", "pdf"):
        path = OUT / f"{name}.{extension}"
        if extension == "png":
            fig.savefig(path, dpi=350,
                        bbox_inches="tight", pad_inches=0.18)
        else:
            fig.savefig(path, bbox_inches="tight",
                        pad_inches=0.18)
    plt.close(fig)
    print(f"Saved: {name}.png / .pdf")

# ------------------------------------------------
# Figure 5: Cycle sensitivity, 16-64 KB L1D
# ------------------------------------------------
fig, axs = plt.subplots(1, 3, figsize=(12, 5.5),
                        sharey=True)
title(fig, "L1D Cache Capacity and Execution Cycles",
      "Cycle reduction relative to 16 KB L1D | Higher is better")

x = np.arange(4)
all_reductions = []

for b in BENCH:
    for o in OPTS:
        base = cycles(b, o, "C1")
        for c in ("C2", "C3"):
            all_reductions.append(
                100 * (base - cycles(b, o, c)) / base
            )

ymax = max(0.016, max(all_reductions) * 1.3)

for ax, b in zip(axs, BENCH):
    axes_style(ax)
    best_values = []

    for c, offset in (("C2", -0.15), ("C3", 0.15)):
        values = [
            100 * (cycles(b, o, "C1") - cycles(b, o, c))
            / cycles(b, o, "C1")
            for o in OPTS
        ]
        best_values.append(values)

        ax.bar(x + offset, values, width=0.24,
               color=COLORS[c], edgecolor="#53657B",
               linewidth=0.6, label=f"{SIZES[c]} KB",
               zorder=3)

    ax.set_title(b, fontsize=15, weight="bold",
                 color="#20324A", pad=12)
    ax.set_xticks(x)
    ax.set_xticklabels(OPTS, fontsize=12)
    ax.set_ylim(0, ymax)

    if max(abs(v) for group in best_values for v in group) < 1e-9:
        ax.text(0.5, 0.52, "No cycle change",
                transform=ax.transAxes, ha="center",
                color="#52657A", fontsize=13)
    else:
        for i, o in enumerate(OPTS):
            v = max(best_values[0][i], best_values[1][i])
            if v > 0:
                ax.text(i, v + ymax * 0.035,
                        f"{v:.4f}%", ha="center",
                        fontsize=10.5, weight="bold",
                        color="#20324A")

axs[0].set_ylabel("Cycle reduction (%)", fontsize=13)

handles, labels = axs[0].get_legend_handles_labels()
fig.legend(handles, labels, loc="lower center",
           ncol=2, fontsize=12, frameon=True,
           bbox_to_anchor=(0.5, 0.045))

fig.subplots_adjust(left=0.085, right=0.98,
                    top=0.77, bottom=0.23, wspace=0.18)

save(fig, "figure5_cache_cycles")

# ------------------------------------------------
# Figure 6: Verified L1D cache miss rates
# ------------------------------------------------
fig, axs = plt.subplots(1, 3, figsize=(12, 5.5),
                        sharey=True)
title(fig, "L1D Cache Miss Rates Across Configurations",
      "Verified misses / accesses | Original 16-64 KB experiments")

maximum = max(
    miss_rate(b, o, c)
    for b in BENCH for o in OPTS for c in CACHES
)
ymax = max(0.011, maximum * 1.35)

x = np.arange(4)

for ax, b in zip(axs, BENCH):
    axes_style(ax)

    for c, offset in zip(CACHES, (-0.26, 0, 0.26)):
        values = [miss_rate(b, o, c) for o in OPTS]

        ax.bar(x + offset, values, width=0.21,
               color=COLORS[c], edgecolor="#53657B",
               linewidth=0.6, label=f"{SIZES[c]} KB",
               zorder=3)

    for i, o in enumerate(OPTS):
        v = max(miss_rate(b, o, c) for c in CACHES)
        if v > 0:
            ax.text(i, v + ymax * 0.035,
                    f"{v:.4f}%", ha="center",
                    fontsize=10.5, weight="bold",
                    color="#20324A")

    ax.set_title(b, fontsize=15, weight="bold",
                 color="#20324A", pad=12)
    ax.set_xticks(x)
    ax.set_xticklabels(OPTS, fontsize=12)
    ax.set_ylim(0, ymax)

axs[0].set_ylabel("L1D miss rate (%)", fontsize=13)

handles, labels = axs[0].get_legend_handles_labels()
fig.legend(handles, labels, loc="lower center",
           ncol=3, fontsize=12, frameon=True,
           bbox_to_anchor=(0.5, 0.045))

fig.subplots_adjust(left=0.085, right=0.98,
                    top=0.77, bottom=0.23, wspace=0.18)

save(fig, "figure6_cache_miss_rate")

# ------------------------------------------------
# Figure 7: Compiler-cache performance heatmap
# ------------------------------------------------
fig, axs = plt.subplots(1, 3, figsize=(12, 5.4))

title(fig, "Compiler and Cache Performance Overview",
      "ROI cycles normalized to -O0 / 16 KB within each benchmark")

cmap = LinearSegmentedColormap.from_list(
    "styleA_heatmap",
    ["#24456D", "#8CAAC9", "#F0F3F7"]
)

for ax, b in zip(axs, BENCH):
    baseline = cycles(b, "-O0", "C1")
    matrix = np.array([
        [cycles(b, o, c) / baseline for c in CACHES]
        for o in OPTS
    ])

    im = ax.imshow(matrix, cmap=cmap,
                   vmin=0.15, vmax=1.0,
                   aspect="auto")

    ax.set_title(b, fontsize=15, weight="bold",
                 color="#20324A", pad=12)
    ax.set_xticks(range(3))
    ax.set_xticklabels(["16 KB", "32 KB", "64 KB"],
                       fontsize=11)
    ax.set_yticks(range(4))
    ax.set_yticklabels(OPTS, fontsize=12)

    for i in range(4):
        for j in range(3):
            v = matrix[i, j]
            ax.text(j, i, f"{v:.3f}",
                    ha="center", va="center",
                    fontsize=12, weight="bold",
                    color="white" if v < 0.55 else "#20324A")

    ax.set_xticks(np.arange(-0.5, 3, 1), minor=True)
    ax.set_yticks(np.arange(-0.5, 4, 1), minor=True)
    ax.grid(which="minor", color="white", linewidth=3)
    ax.tick_params(which="minor", bottom=False, left=False)

fig.subplots_adjust(left=0.075, right=0.87,
                    top=0.78, bottom=0.2, wspace=0.26)

cax = fig.add_axes([0.9, 0.2, 0.016, 0.58])
cb = fig.colorbar(im, cax=cax)
cb.set_label("Normalized cycles", fontsize=12)
cb.ax.tick_params(labelsize=11)

save(fig, "figure7_compiler_cache_heatmap")

print("All three figures generated successfully.")
print("Verified CSV:", CSV)
print("Original experimental data: unchanged")
