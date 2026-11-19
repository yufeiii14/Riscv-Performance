# Compiler Assembly Analysis: matmult-int

## Objective
Investigate why GCC -O3 produces longer ROI execution time than -O2.

## Experimental Configuration
- Architecture: RISC-V
- Simulator: gem5 TimingSimpleCPU
- L1D Cache: 32 KB
- Measurement: Warmed-up ROI
- Workload: Embench-IoT matmult-int

## Performance Comparison

| Metric | -O2 | -O3 |
|---|---:|---:|
| ROI Cycles | 7,421,749 | 10,762,509 |
| Dynamic Instructions | 2,696,742 | 3,687,721 |
| CPI | 2.752117 | 2.918472 |
| L1D Accesses | 1,014,021 | 1,043,657 |

## Assembly Observations

1. At -O2, benchmark() calls benchmark_body(), which calls a separate Multiply() function.
2. At -O3, benchmark() calls benchmark_body.constprop.0, containing inlined matrix multiplication logic.
3. The -O2 multiplication loop maintains an accumulator in a register.
4. The -O3 implementation uses a different loop organization and repeatedly reads and updates result elements.
5. The -O3 implementation also includes conditional instructions inside the multiplication loop.

## Key Findings

- ROI cycles increase by approximately 45.01% at -O3.
- Dynamic instructions increase by approximately 36.75%.
- CPI increases by approximately 6.04%.
- L1D accesses increase by approximately 2.92%.

The performance regression is associated with increased dynamic instruction execution and CPI, rather than a comparably large increase in L1D access count.

## Limitations

The assembly comparison identifies structural differences but does not independently quantify the causal contribution of each compiler transformation.

These findings apply to the tested workload, compiler, and simulated microarchitecture.
