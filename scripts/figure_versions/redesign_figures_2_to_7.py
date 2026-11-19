import csv
import math
import os
import shutil
import tempfile
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib import font_manager
from matplotlib.ticker import FuncFormatter

ROOT = Path("results/ROI_final")
SOURCE = ROOT / "roi_results_verified.csv"
DEST = ROOT / "final_analysis/figures"

B = ["matmult-int", "crc32", "wikisort"]
O = ["-O0", "-O2", "-O3", "-Os"]
C = ["C1", "C2", "C3"]
KB = [16, 32, 64]

NAVY = "#172C43"
SLATE = "#536477"
COPPER = "#BD713B"
TEAL = "#477D7B"
GRID = "#DFE5EA"
MUTED = "#455465"
PALE = "#AAB6C2"

font_manager._load_fontmanager(try_read_cache=False)
fonts = {f.name for f in font_manager.fontManager.ttflist}
assert {"Georgia", "Times New Roman"} <= fonts, "Required fonts missing"

plt.rcParams.update({
    "font.family": "Times New Roman",
    "font.size": 11,
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
    "pdf.fonttype": 42,
})

with SOURCE.open(newline="") as f:
    rows = list(csv.DictReader(f))

D = {
    (r["Benchmark"], r["Optimization"], r["Cache"]): r
    for r in rows
}

expected = {(b, o, c) for b in B for o in O for c in C}
assert len(rows) == len(D) == 36 and set(D) == expected

def val(b, o, c, key):
    result = float(D[b, o, c][key])
    assert math.isfinite(result) and result >= 0
    return result

for b in B:
    for o in O:
        for c in C:
            cycles = val(b, o, c, "ROI_Cycles")
            inst = val(b, o, c, "ROI_Instructions")
            ipc = val(b, o, c, "ROI_IPC")
            assert cycles > 0 and inst > 0
            assert abs(inst / cycles - ipc) < 0.001

def heading(fig, title, subtitle):
    fig.text(
        .08, .965, title,
        fontfamily="Georgia", fontsize=17.5,
        color=NAVY, va="top"
    )
    fig.text(
        .08, .915, subtitle,
        fontsize=11.2, color=MUTED, va="top"
    )

def note(fig, content):
    fig.text(
        .08, .044, content,
        fontsize=10, color=MUTED, va="bottom"
    )

def three_panels(title, subtitle, footnote):
    fig, axes = plt.subplots(3, 1, figsize=(9.2, 8.1))
    fig.subplots_adjust(
        left=.18, right=.94,
        top=.82, bottom=.19, hspace=.85
    )
    heading(fig, title, subtitle)
    note(fig, footnote)

    for ax, b in zip(axes, B):
        ax.set_title(
            b, loc="left", fontfamily="Georgia",
            fontsize=13.5, color=NAVY, pad=9
        )
        ax.tick_params(length=0, pad=7)
        ax.grid(axis="x", color=GRID, linewidth=.8)
        ax.set_axisbelow(True)

    return fig, axes

def dot_chart(ax, values, fmt, highlight):
    maximum = max(values)
    ax.hlines(
        range(4), 0, values,
        color=PALE, linewidth=2.3, zorder=1
    )

    for i, value in enumerate(values):
        best = i == highlight
        ax.scatter(
            value, i,
            s=130 if best else 75,
            color=COPPER if best else SLATE,
            zorder=3
        )
        ax.text(
            value + maximum * .035, i,
            fmt(value), va="center",
            fontsize=10.8,
            color=NAVY if best else SLATE,
            fontweight="bold" if best else "normal"
        )

    ax.set_yticks(range(4), O)
    ax.set_ylim(-.55, 3.55)
    ax.invert_yaxis()
    ax.set_xlim(0, maximum * 1.42)

def export(fig, directory, filename):
    path = directory / filename
    fig.savefig(path, dpi=350, facecolor="white")
    plt.close(fig)
    assert path.stat().st_size > 10000, filename
    return filename

# Generate first; replace existing figures only after all succeed.
with tempfile.TemporaryDirectory(prefix="gem5_figures_") as folder:
    temp = Path(folder)
    generated = []

    # FIGURE 2: IPC
    fig, axes = three_panels(
        "Instruction Throughput Across Optimization Levels",
        "ROI instructions per cycle (IPC)  |  32 KB L1D cache",
        "Note: Higher IPC does not necessarily imply fewer total execution cycles."
    )

    for ax, b in zip(axes, B):
        values = [val(b, o, "C2", "ROI_IPC") for o in O]
        dot_chart(
            ax, values, lambda x: f"{x:.3f}",
            int(np.argmax(values))
        )

    generated.append(export(
        fig, temp, "figure2_compiler_ipc.png"
    ))

    # FIGURE 3: DYNAMIC INSTRUCTIONS
    fig, axes = three_panels(
        "Dynamic Instruction Count",
        "Committed instructions within the ROI  |  32 KB L1D",
        "Note: These are executed instructions, not static instructions in the ELF."
    )

    for ax, b in zip(axes, B):
        values = [
            val(b, o, "C2", "ROI_Instructions") / 1e6
            for o in O
        ]
        dot_chart(
            ax, values, lambda x: f"{x:.2f}M",
            int(np.argmin(values))
        )
        ax.set_xlabel("Millions of instructions")

    generated.append(export(
        fig, temp, "figure3_compiler_instructions.png"
    ))

    # FIGURE 4: CODE SIZE
    fig, axes = three_panels(
        "Code Footprint by Compiler Optimization",
        "ELF .text section size  |  KiB",
        "Note: The .text section is not the full statically linked ELF size."
    )

    for ax, b in zip(axes, B):
        values = [
            val(b, o, "C2", "Text_Size_Bytes") / 1024
            for o in O
        ]
        dot_chart(
            ax, values, lambda x: f"{x:.2f} KiB",
            int(np.argmin(values))
        )
        ax.set_xlabel(".text size (KiB)")

    generated.append(export(
        fig, temp, "figure4_compiler_code_size.png"
    ))

    # FIGURE 5: CACHE CYCLE SENSITIVITY
    fig, axes = three_panels(
        "L1D Cache Capacity and Execution Cycles",
        "Cycle reduction relative to 16 KB L1D  |  same compiler setting",
        "Note: Positive values mean fewer cycles. The vertical scale magnifies tiny changes."
    )

    line_colors = [NAVY, COPPER, TEAL, "#88939B"]
    reductions = []

    for ax, b in zip(axes, B):
        for o, color in zip(O, line_colors):
            baseline = val(b, o, "C1", "ROI_Cycles")
            values = [
                100 * (
                    baseline - val(b, o, c, "ROI_Cycles")
                ) / baseline
                for c in C
            ]
            reductions.extend(values)
            ax.plot(
                KB, values, marker="o",
                markersize=5.5, linewidth=1.7,
                color=color, label=o
            )

        ax.set_xticks(KB, ["16 KB", "32 KB", "64 KB"])
        ax.set_ylabel("Cycle reduction (%)")
        ax.grid(axis="y", color=GRID, linewidth=.8)
        ax.axhline(0, color=PALE, linewidth=1)

    upper = max(
        .001,
        math.ceil(max(reductions) * 1000) / 1000 * 1.18
    )

    for ax in axes:
        ax.set_ylim(-upper * .08, upper)

    fig.legend(
        handles=axes[0].lines[:4], labels=O,
        loc="lower center", bbox_to_anchor=(.53, .105),
        ncol=4, frameon=False
    )

    generated.append(export(
        fig, temp, "figure5_cache_cycles.png"
    ))

    # FIGURE 6: L1D MISS RATE
    fig, axes = three_panels(
        "L1 Data Cache Miss Rate",
        "Verified L1D misses / accesses  |  warmed-up ROI",
        "Note: Zero indicates no measured misses; all observed rates are below 0.01%."
    )

    maximum_miss = 0

    for ax, b in zip(axes, B):
        for o, color in zip(O, line_colors):
            values = [
                100 * val(
                    b, o, c, "L1D_Miss_Rate_Calculated"
                )
                for c in C
            ]
            maximum_miss = max(maximum_miss, *values)
            ax.plot(
                KB, values, marker="o",
                markersize=5.5, linewidth=1.7,
                color=color, label=o
            )

        ax.set_xticks(KB, ["16 KB", "32 KB", "64 KB"])
        ax.set_ylabel("L1D miss rate (%)")
        ax.grid(axis="y", color=GRID, linewidth=.8)
        ax.axhline(0, color=PALE, linewidth=1)
        ax.yaxis.set_major_formatter(
            FuncFormatter(lambda x, _: f"{x:.3f}")
        )

    upper = max(
        .001,
        math.ceil(maximum_miss * 1000) / 1000 * 1.2
    )

    for ax in axes:
        ax.set_ylim(-upper * .05, upper)

    fig.legend(
        handles=axes[0].lines[:4], labels=O,
        loc="lower center", bbox_to_anchor=(.53, .105),
        ncol=4, frameon=False
    )

    generated.append(export(
        fig, temp, "figure6_cache_miss_rate.png"
    ))

    # FIGURE 7: COMPILER + CACHE MATRIX
    fig, axes = plt.subplots(1, 3, figsize=(12.3, 5.8))
    fig.subplots_adjust(
        left=.08, right=.97,
        top=.76, bottom=.20, wspace=.30
    )

    heading(
        fig,
        "Compiler and Cache Configuration Matrix",
        "Normalized ROI cycles  |  each benchmark: -O0 / 16 KB L1D = 100%"
    )

    note(
        fig,
        "Note: Lower is better. Each benchmark is normalized independently."
    )

    for ax, b in zip(axes, B):
        baseline = val(b, "-O0", "C1", "ROI_Cycles")

        matrix = np.array([
            [
                100 * val(b, o, c, "ROI_Cycles") / baseline
                for c in C
            ]
            for o in O
        ])

        ax.imshow(
            matrix,
            cmap="YlGnBu_r",
            vmin=0, vmax=100,
            aspect="auto",
            interpolation="nearest"
        )

        ax.set_title(
            b, fontfamily="Georgia",
            fontsize=13.5, color=NAVY, pad=14
        )
        ax.set_xticks(
            range(3), ["16 KB", "32 KB", "64 KB"]
        )
        ax.set_yticks(range(4), O)
        ax.tick_params(length=0, pad=8)

        for i in range(4):
            for j in range(3):
                value = matrix[i, j]
                ax.text(
                    j, i, f"{value:.1f}%",
                    ha="center", va="center",
                    fontsize=10.3,
                    color="white" if value < 35 else NAVY,
                    fontweight=(
                        "bold" if value == matrix.min()
                        else "normal"
                    )
                )

    generated.append(export(
        fig, temp, "figure7_compiler_cache_heatmap.png"
    ))

    assert len(generated) == 6

    DEST.mkdir(parents=True, exist_ok=True)

    for filename in generated:
        shutil.copy2(temp / filename, DEST / filename)

print("SUCCESS: Figures 2-7 replaced.")
print("Figure 1: unchanged")
print("Experiment CSV: unchanged")
print("Output:", DEST)
