# Embench Build Notes

## Experimental Setup

- ISA: RISC-V RV64GC
- ABI: lp64d
- Simulator: gem5 23.0.0.1
- Benchmarks: matmult-int, crc32, wikisort
- Optimization levels: -O0, -O2, -O3, -Os
- Linking: Static

## Recorded SCons Command

The following command was recovered from the original shell history.
It documents an earlier -O0 build, not necessarily the final ROI build.

```bash
scons --config-dir=examples/native/speed \
  --build-dir=../../build/embench_O0 \
  cc="$HOME/opt/riscv64-linux-musl-cross/bin/riscv64-linux-musl-gcc" \
  cflags="-O0 -march=rv64gc -mabi=lp64d" \
  ldflags="-static" \
  user_libs="-lm" \
  warmup_heat=1 \
  gsf=1
```

## Reproduction Status

- The original 40 experiment outputs are preserved.
- Main experiment statistics can be checked with scripts/verify_results.py.
- Data extraction and analysis scripts have been tested.
- A gem5 simulation runner is provided but has not yet been runtime-tested.
- Exact final ROI build commands and compiler toolchain provenance
  still require confirmation before claiming full source-to-result reproduction.
