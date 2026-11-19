import csv
import os
import tempfile
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib import font_manager

BASE = Path("results/ROI_final")
SOURCE = BASE / "roi_results_verified.csv"
OUTPUT = BASE / "final_analysis/figures/figure1_compiler_cycles.png"

BENCHMARKS = ["matmult-int", "crc32", "wikisort"]
OPTS = ["-O0", "-O2", "-O3", "-Os"]

NAVY = "#172C43"
SLATE = "#536477"
COPPER = "#BD713B"
GRID = "#DFE5EA"
MUTED = "#455465"

font_manager._load_fontmanager(try_read_cache=False)
available = {f.name for f in font_manager.fontManager.ttflist}

for name in ("Georgia", "Times New Roman"):
    if name not in available:
        raise RuntimeError(f"Missing font: {name}")

plt.rcParams.update({
    "font.family": "Times New Roman",
    "font.size": 12,
    "text.color": NAVY,
    "axes.labelcolor": NAVY,
    "xtick.color": MUTED,
    "ytick.color": NAVY,
    "figure.facecolor": "white",
    "axes.facecolor": "white",
    "savefig.facecolor": "white",
    "axes.spines.top": False,
    "axes.spines.right": False,
    "axes.spines.left": False,
    "axes.spines.bottom": False,
})

with SOURCE.open(newline="") as f:
    rows = list(csv.DictReader(f))

data = {
    (r["Benchmark"], r["Optimization"], r["Cache"]): r
    for r in rows
}

assert len(rows) == 36 and len(data) == 36, \
    "Expected exactly 36 unique experimental configurations."

fig, axes = plt.subplots(3, 1, figsize=(9.2, 8.1))

fig.subplots_adjust(
    left=0.19,
    right=0.93,
    top=0.82,
    bottom=0.13,
    hspace=0.72
)

# Main heading
fig.text(
    0.09, 0.955,
    "Compiler Optimization and Execution Performance",
    fontfamily="Georgia",
    fontsize=18,
    color=NAVY,
    va="top"
)

# One concise explanatory subtitle
fig.text(
    0.09, 0.906,
    "Normalized ROI cycles  |  -O0 baseline = 100%",
    fontsize=12,
    color=MUTED,
    va="top"
)

for ax, bench in zip(axes, BENCHMARKS):
    baseline = float(
        data[(bench, "-O0", "C2")]["ROI_Cycles"]
    )

    values = [
        100 * float(
            data[(bench, opt, "C2")]["ROI_Cycles"]
        ) / baseline
        for opt in OPTS
    ]

    best = min(range(4), key=lambda i: values[i])

    ax.hlines(
        range(4), 0, values,
        color="#AAB6C2",
        linewidth=2.4,
        zorder=1
    )

    for i, (opt, value) in enumerate(zip(OPTS, values)):
        is_best = i == best

        ax.scatter(
            value, i,
            s=135 if is_best else 78,
            color=COPPER if is_best else SLATE,
            zorder=3
        )

        label = (
            f"{value:.1f}%  |  {100-value:.1f}% fewer cycles"
            if is_best
            else f"{value:.1f}%"
        )

        ax.text(
            value + 3, i,
            label,
            va="center",
            fontsize=10.8,
            fontweight="bold" if is_best else "normal",
            color=NAVY if is_best else SLATE
        )

    ax.set_xlim(0, 155)
    ax.set_ylim(-0.55, 3.55)
    ax.invert_yaxis()

    ax.set_yticks(range(4), OPTS)
    ax.set_xticks([0, 25, 50, 75, 100])
    ax.set_xticklabels(["0", "25", "50", "75", "100%"])

    ax.tick_params(length=0, pad=8)

    ax.grid(
        axis="x",
        color=GRID,
        linewidth=0.75
    )
    ax.set_axisbelow(True)

    ax.set_title(
        bench,
        loc="left",
        fontfamily="Georgia",
        fontsize=13.5,
        color=NAVY,
        pad=11
    )

# Compact, meaningful methodology note
fig.text(
    0.09, 0.055,
    "Note: 32 KB L1D cache; lower normalized cycle counts indicate faster execution.",
    fontsize=10.2,
    color=MUTED
)

OUTPUT.parent.mkdir(parents=True, exist_ok=True)

with tempfile.NamedTemporaryFile(
    suffix=".png",
    dir=OUTPUT.parent,
    delete=False
) as tmp:
    temporary = Path(tmp.name)

try:
    fig.savefig(
        temporary,
        dpi=350,
        facecolor="white"
    )

    if temporary.stat().st_size < 10000:
        raise RuntimeError("Figure generation failed.")

    os.replace(temporary, OUTPUT)

finally:
    plt.close(fig)
    temporary.unlink(missing_ok=True)

print("Figure 1 updated successfully.")
print("Output:", OUTPUT)
print("Original experimental data: unchanged")
