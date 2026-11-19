from pathlib import Path
import csv
import math
import numpy as np
import matplotlib.pyplot as plt

ROOT = Path("/home/yufei/riscv-gem5-project")
MAIN_CSV = ROOT / "results/ROI_final/final_analysis/table2_performance_summary.csv"
EXT_CSV = ROOT / "results/cache_sensitivity/cache_sensitivity_results.csv"
OUTDIR = ROOT / "results/ROI_final/final_analysis/figures"
OUTDIR.mkdir(parents=True, exist_ok=True)

BENCH = "matmult-int"
OPTS = ["-O0", "-O2"]
CACHES = ["4KB", "8KB", "16KB", "32KB", "64KB"]

plt.rcParams["font.family"] = "Times New Roman"
plt.rcParams["axes.edgecolor"] = "#50627A"
plt.rcParams["axes.linewidth"] = 1.0

COLORS = {
    "-O0": "#D9DEE5",
    "-O2": "#355A8A",
}

# ---------- helpers ----------
def read_csv_rows(path):
    with open(path, "r", newline="", encoding="utf-8-sig") as f:
        return list(csv.DictReader(f))

def first_value(row, names):
    for n in names:
        if n in row and str(row[n]).strip() != "":
            return row[n]
    return None

def norm_opt(x):
    s = str(x).strip()
    if not s:
        return None
    s = s.replace("–", "-")
    if not s.startswith("-"):
        s = "-" + s
    return s.upper().replace("-OS", "-Os").replace("-O0", "-O0").replace("-O2", "-O2")

def norm_bench(x):
    return str(x).strip().lower()

def norm_cache(x):
    s = str(x).strip().replace(" ", "").replace("kB", "KB")
    if s in ("C1", "c1"):
        return "16KB"
    if s in ("C2", "c2"):
        return "32KB"
    if s in ("C3", "c3"):
        return "64KB"
    if s in ("4KB", "8KB", "16KB", "32KB", "64KB"):
        return s
    if s in ("4", "8", "16", "32", "64"):
        return s + "KB"
    return s

def to_float(x):
    return float(str(x).replace(",", "").strip())

# ---------- load original 16/32/64 KB data ----------
main_rows = read_csv_rows(MAIN_CSV)

main_data = {}
for r in main_rows:
    bench = norm_bench(first_value(r, ["Benchmark", "benchmark"]))
    if bench != BENCH:
        continue

    opt = norm_opt(first_value(r, ["Optimization", "optimization", "Opt", "opt"]))
    cache = norm_cache(first_value(r, ["Cache", "cache", "L1D_Cache", "Cache_Config"]))

    if opt not in OPTS or cache not in ("16KB", "32KB", "64KB"):
        continue

    cyc = first_value(r, ["ROI_Cycles", "roi_cycles", "NumCycles", "numCycles", "Cycles", "Raw_Cycles"])
    miss = first_value(r, [
        "L1D_Miss_Rate", "l1d_miss_rate", "DCache_Miss_Rate",
        "L1D_Miss_Rate_Percent", "MissRate", "Overall_Miss_Rate", "dcache_miss_rate"
    ])

    if cyc is None:
        continue

    main_data[(opt, cache)] = {
        "cycles": to_float(cyc),
        "miss": to_float(miss) if miss is not None else 0.0
    }

# ---------- load new 4/8 KB data ----------
ext_rows = read_csv_rows(EXT_CSV)

ext_data = {}
raw_miss_values = []

for r in ext_rows:
    opt = norm_opt(first_value(r, ["Optimization", "optimization", "Opt", "opt"]))
    cache = norm_cache(first_value(r, ["L1D_KB", "Cache", "cache", "CacheKB", "cache_kb", "L1D", "L1D_Cache"]))
    if opt not in OPTS or cache not in ("4KB", "8KB"):
        continue

    cyc = first_value(r, ["ROI_Cycles", "roi_cycles", "NumCycles", "numCycles", "Cycles", "Raw_Cycles"])
    miss = first_value(r, [
        "L1D_Miss_Rate", "l1d_miss_rate", "DCache_Miss_Rate",
        "L1D_Miss_Rate_Percent", "MissRate", "Overall_Miss_Rate", "dcache_miss_rate"
    ])

    if cyc is None or miss is None:
        continue

    miss_val = to_float(miss)
    raw_miss_values.append(miss_val)

    ext_data[(opt, cache)] = {
        "cycles": to_float(cyc),
        "miss": miss_val
    }

# ---------- merge ----------
data = {}
for k, v in main_data.items():
    data[k] = v
for k, v in ext_data.items():
    data[k] = v

# ---------- compute overhead vs 64KB ----------
cycle_overhead = {}
miss_rate = {}

for opt in OPTS:
    base_key = (opt, "64KB")
    if base_key not in data:
        raise RuntimeError(f"Missing 64KB baseline for {opt} in input CSV files.")

    base_cycles = data[base_key]["cycles"]

    for cache in CACHES:
        key = (opt, cache)
        if key not in data:
            raise RuntimeError(f"Missing data for {opt}, {cache}.")
        cyc = data[key]["cycles"]
        overhead = (cyc / base_cycles - 1.0) * 100.0
        cycle_overhead[(opt, cache)] = overhead
        miss_rate[(opt, cache)] = data[key]["miss"]

# ---------- plotting ----------
fig = plt.figure(figsize=(13.6, 7.6), dpi=300)
fig.patch.set_facecolor("white")

gs = fig.add_gridspec(
    2, 2,
    height_ratios=[1.0, 3.0],
    wspace=0.25,
    hspace=0.08
)

ax1_top = fig.add_subplot(gs[0, 0])
ax1_bot = fig.add_subplot(gs[1, 0], sharex=ax1_top)

ax2_top = fig.add_subplot(gs[0, 1])
ax2_bot = fig.add_subplot(gs[1, 1], sharex=ax2_top)

x = np.arange(len(CACHES))
w = 0.32
offsets = {"-O0": -w/2, "-O2": w/2}

def style_axes(ax):
    ax.grid(axis="y", color="#D6DCE5", linewidth=0.8, alpha=0.9)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_color("#50627A")
    ax.spines["bottom"].set_color("#50627A")
    ax.tick_params(axis="both", labelsize=11)

for ax in [ax1_top, ax1_bot, ax2_top, ax2_bot]:
    style_axes(ax)

# y-ranges chosen to show both large and tiny values clearly
ax1_top.set_ylim(1.0, 13.8)
ax1_bot.set_ylim(0.0, 0.08)

ax2_top.set_ylim(0.20, 1.90)
ax2_bot.set_ylim(0.0, 0.020)

# hide touching spines
ax1_top.spines["bottom"].set_visible(False)
ax1_bot.spines["top"].set_visible(False)
ax2_top.spines["bottom"].set_visible(False)
ax2_bot.spines["top"].set_visible(False)

ax1_top.tick_params(labelbottom=False, bottom=False)
ax2_top.tick_params(labelbottom=False, bottom=False)

# diagonal break marks
def add_break_marks(ax_top, ax_bot):
    d = 0.008
    kwargs = dict(transform=ax_top.transAxes, color="#50627A", clip_on=False, linewidth=1.0)
    ax_top.plot((-d, +d), (-d, +d), **kwargs)
    ax_top.plot((1-d, 1+d), (-d, +d), **kwargs)
    kwargs.update(transform=ax_bot.transAxes)
    ax_bot.plot((-d, +d), (1-d, 1+d), **kwargs)
    ax_bot.plot((1-d, 1+d), (1-d, 1+d), **kwargs)

add_break_marks(ax1_top, ax1_bot)
add_break_marks(ax2_top, ax2_bot)

# plot bars on both top and bottom axes
for opt in OPTS:
    vals_cycle = [cycle_overhead[(opt, c)] for c in CACHES]
    vals_miss = [miss_rate[(opt, c)] for c in CACHES]

    ax1_top.bar(x + offsets[opt], vals_cycle, width=w, color=COLORS[opt], edgecolor="#50627A", linewidth=0.8, label=opt)
    ax1_bot.bar(x + offsets[opt], vals_cycle, width=w, color=COLORS[opt], edgecolor="#50627A", linewidth=0.8)

    ax2_top.bar(x + offsets[opt], vals_miss, width=w, color=COLORS[opt], edgecolor="#50627A", linewidth=0.8, label=opt)
    ax2_bot.bar(x + offsets[opt], vals_miss, width=w, color=COLORS[opt], edgecolor="#50627A", linewidth=0.8)

# labels
def add_labels(ax_top, ax_bot, values_by_opt, fmt):
    for opt in OPTS:
        vals = values_by_opt[opt]
        for i, v in enumerate(vals):
            xpos = x[i] + offsets[opt]
            if v >= ax_top.get_ylim()[0]:
                ax = ax_top
                dy = (ax_top.get_ylim()[1] - ax_top.get_ylim()[0]) * 0.02
                ax.text(xpos, v + dy, fmt(v), ha="center", va="bottom", fontsize=10.5, color="#20324A", fontweight="semibold")
            else:
                ax = ax_bot
                dy = (ax_bot.get_ylim()[1] - ax_bot.get_ylim()[0]) * 0.06
                label = fmt(v) if v > 0 else ""
                ax.text(xpos, v + dy, label, ha="center", va="bottom", fontsize=9.5, color="#20324A", rotation=0)

cycle_vals = {opt: [cycle_overhead[(opt, c)] for c in CACHES] for opt in OPTS}
miss_vals = {opt: [miss_rate[(opt, c)] for c in CACHES] for opt in OPTS}

add_labels(ax1_top, ax1_bot, cycle_vals, lambda v: f"{v:.4f}%" if v < 0.1 else f"{v:.2f}%")
add_labels(ax2_top, ax2_bot, miss_vals, lambda v: f"{v:.4f}%" if v < 0.1 else f"{v:.2f}%")

# titles
fig.text(0.06, 0.955, "Cache Sensitivity of matmult-int", fontsize=21, fontweight="bold", color="#20324A")
fig.text(0.06, 0.915, "All five cache sizes are included; split y-axes are used to make tiny values visible.", fontsize=12.5, color="#50627A")

ax1_top.set_title("(a) Execution Cycle Overhead vs. 64 KB", fontsize=15, fontweight="bold", color="#20324A", pad=8)
ax2_top.set_title("(b) L1D Cache Miss Rate", fontsize=15, fontweight="bold", color="#20324A", pad=8)

ax1_bot.set_ylabel("Overhead (%)", fontsize=13)
ax2_bot.set_ylabel("Miss rate (%)", fontsize=13)

for ax in [ax1_bot, ax2_bot]:
    ax.set_xticks(x)
    ax.set_xticklabels(CACHES, fontsize=12)

# legend
handles = [
    plt.Rectangle((0,0),1,1,facecolor=COLORS["-O0"], edgecolor="#50627A"),
    plt.Rectangle((0,0),1,1,facecolor=COLORS["-O2"], edgecolor="#50627A")
]
labels = ["-O0", "-O2"]
leg = fig.legend(
    handles, labels,
    loc="lower center",
    ncol=2,
    bbox_to_anchor=(0.5, 0.035),
    frameon=True,
    fontsize=12
)
leg.get_frame().set_edgecolor("#B8C2D1")
leg.get_frame().set_linewidth(0.8)
leg.get_frame().set_facecolor("white")

plt.subplots_adjust(left=0.08, right=0.98, top=0.82, bottom=0.16)

png_path = OUTDIR / "figure8_cache_sensitivity.png"
pdf_path = OUTDIR / "figure8_cache_sensitivity.pdf"
fig.savefig(png_path, dpi=300, bbox_inches="tight", facecolor="white")
fig.savefig(pdf_path, bbox_inches="tight", facecolor="white")
plt.close(fig)

print("Figure 8 redrawn successfully.")
print("PNG:", png_path)
print("PDF:", pdf_path)

print("\\nCycle overhead vs 64KB:")
for opt in OPTS:
    for cache in CACHES:
        print(opt, cache, f"{cycle_overhead[(opt, cache)]:.6f}%")

print("\\nL1D miss rate:")
for opt in OPTS:
    for cache in CACHES:
        print(opt, cache, f"{miss_rate[(opt, cache)]:.6f}%")
