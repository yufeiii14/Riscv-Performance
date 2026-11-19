from pathlib import Path
import csv
import numpy as np
import matplotlib.pyplot as plt

ROOT = Path.home() / "riscv-gem5-project"
CSV = ROOT / "results/ROI_final/final_analysis/table2_performance_summary.csv"
OUT = ROOT / "results/ROI_final/final_analysis/figures"

BENCHMARKS = ["matmult-int", "crc32", "wikisort"]
OPTS = ["-O0", "-O2", "-O3", "-Os"]

COLORS = {
    "-O0": "#D9DEE5",
    "-O2": "#AFC4DE",
    "-O3": "#6E8FB7",
    "-Os": "#2E4E79",
}

with CSV.open(newline="", encoding="utf-8") as f:
    rows = [r for r in csv.DictReader(f) if r["Cache"] == "C2"]

data = {(r["Benchmark"], r["Optimization"]): r for r in rows}
assert len(data) == 12, "Expected 12 unique configurations"

for benchmark in BENCHMARKS:
    for opt in OPTS:
        assert (benchmark, opt) in data, f"Missing: {benchmark}, {opt}"

plt.rcParams.update({
    "font.family": "Times New Roman",
    "axes.edgecolor": "#4A5568",
    "axes.linewidth": 1.0,
    "pdf.fonttype": 42,
})

def draw(filename, title, subtitle, ylabel, values, ylim, yticks, fmt):
    fig, ax = plt.subplots(figsize=(10.5, 6.4), dpi=300)
    fig.patch.set_facecolor("white")

    x = np.arange(3)
    offsets = [-0.27, -0.09, 0.09, 0.27]

    for i, opt in enumerate(OPTS):
        heights = [values(b, opt) for b in BENCHMARKS]

        ax.bar(
            x + offsets[i], heights,
            width=0.14,
            color=COLORS[opt],
            edgecolor="#4A5568",
            linewidth=0.8,
            label=opt,
            zorder=3
        )

        for j, value in enumerate(heights):
            ax.text(
                x[j] + offsets[i],
                value + ylim * 0.012,
                fmt(value),
                ha="center",
                va="bottom",
                fontsize=10.5,
                fontweight="semibold",
                color="#1F2937"
            )

    ax.set_xticks(x)
    ax.set_xticklabels(BENCHMARKS, fontsize=12)
    ax.set_ylabel(ylabel, fontsize=12.5)
    ax.set_ylim(0, ylim)
    ax.set_yticks(yticks)
    ax.tick_params(axis="y", labelsize=11)

    ax.grid(axis="y", color="#D6DCE5", linewidth=0.8, zorder=0)
    ax.set_axisbelow(True)

    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)

    fig.text(0.08, 0.95, title,
             fontsize=17, fontweight="bold", color="#20324A")
    fig.text(0.08, 0.915, subtitle,
             fontsize=11.5, color="#4A5568")

    legend = ax.legend(
        ncol=4, loc="upper center",
        bbox_to_anchor=(0.5, -0.12),
        frameon=True, fontsize=10.5,
        columnspacing=1.6, borderpad=0.6
    )
    legend.get_frame().set_edgecolor("#B8C2D1")
    legend.get_frame().set_facecolor("white")

    plt.subplots_adjust(left=0.11, right=0.97, top=0.84, bottom=0.22)

    fig.savefig(OUT / f"{filename}.png",
                dpi=300, bbox_inches="tight", facecolor="white")
    fig.savefig(OUT / f"{filename}.pdf",
                bbox_inches="tight", facecolor="white")
    plt.close(fig)

    print(f"Generated: {filename}.png / .pdf")


def get(b, o, key):
    return float(data[(b, o)][key])


draw(
    "figure1_compiler_cycles",
    "Execution Cycles Across Optimization Levels",
    "ROI cycles normalized to -O0  |  32 KB L1D cache",
    "Normalized Execution Cycles",
    lambda b, o: get(b, o, "ROI_Cycles") / get(b, "-O0", "ROI_Cycles"),
    1.2, np.arange(0, 1.21, 0.2),
    lambda v: f"{v:.3f}"
)

draw(
    "figure3_compiler_instructions",
    "Dynamic Instruction Count Across Optimization Levels",
    "Committed instructions within ROI  |  32 KB L1D cache",
    "Committed Instructions (millions)",
    lambda b, o: get(b, o, "ROI_Instructions") / 1e6,
    20, np.arange(0, 21, 5),
    lambda v: f"{v:.2f}"
)

draw(
    "figure4_compiler_code_size",
    "Code Size Across Optimization Levels",
    "ELF .text section size  |  RISC-V benchmark binaries",
    "Code Size (KiB)",
    lambda b, o: get(b, o, "Text_Size_Bytes") / 1024,
    21, np.arange(0, 21, 5),
    lambda v: f"{v:.2f}"
)

print("All three figures generated successfully.")
