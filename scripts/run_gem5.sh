#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <gem5_binary> <benchmark_binary> <cache_KB> <run_name>"
    exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

GEM5="$1"
BINARY="$2"
CACHE="$3"
NAME="$4"

case "$CACHE" in
    4|8|16|32|64) ;;
    *) echo "Unsupported cache size: $CACHE"; exit 1 ;;
esac

[ -f "$GEM5" ] || { echo "gem5 binary not found"; exit 1; }
[ -f "$BINARY" ] || { echo "Benchmark binary not found"; exit 1; }

OUT="$ROOT/results/regenerated/simulations/$NAME"

if [ -e "$OUT" ]; then
    echo "Output already exists: $OUT"
    exit 1
fi

mkdir -p "$OUT"

"$GEM5" -d "$OUT" \
    "$ROOT/configs/cache_test.py" \
    --dcache-size "${CACHE}kB" \
    --binary "$BINARY" \
    > "$OUT/run.log" 2>&1

echo "Simulation completed: $OUT"
