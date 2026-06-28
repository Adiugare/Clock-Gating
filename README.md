# Clock Gating using Verilog

## Overview

This project demonstrates the implementation of **Clock Gating** in Verilog HDL. Clock gating is a widely used low-power design technique in digital systems that reduces dynamic power consumption by disabling the clock when a circuit is idle.

The design consists of:
- Clock Gating Module
- Top Module
- Testbench
- Functional Simulation
- RTL Schematic

---

## Project Structure

```
Clock_Gating/
│── clk_gating.v      // Clock gating module
│── top.v             // Top module
│── top_tb.v          // Testbench
│── README.md
```

---

## Design Description

### Clock Gating Module

The clock gating module generates a gated clock by ANDing the input clock with an enable signal.

```verilog
assign gated_clk = clk & en;
```

When:
- `en = 1` → Clock passes through.
- `en = 0` → Clock is blocked.

---

### Top Module

The gated clock drives a D Flip-Flop.

```verilog
always @(posedge gated_clk or posedge rst)
begin
    if(rst)
        q <= 1'b0;
    else
        q <= d;
end
```

The output updates only when the gated clock has a positive edge.

---

## Inputs and Outputs

| Signal | Direction | Description |
|---------|-----------|-------------|
| clk | Input | System Clock |
| rst | Input | Asynchronous Reset |
| en | Input | Clock Enable |
| d | Input | Data Input |
| q | Output | Flip-Flop Output |

---

## Simulation

### Test Cases

### Case 1 : Reset

```
rst = 1
```

Expected Output

```
q = 0
```

---

### Case 2 : Enable = 1

```
en = 1
```

Expected

- Gated clock follows input clock.
- Output updates on every positive edge.

---

### Case 3 : Enable = 0

```
en = 0
```

Expected

- Gated clock is disabled.
- Output retains its previous value.
- Data input changes do not affect the output.

---

## RTL Schematic

In Xilinx Vivado FPGA synthesis, the clock gating logic is optimized into the dedicated **Clock Enable (CE)** input of the FPGA flip-flop instead of generating an actual gated clock.

This optimization:
- Eliminates clock glitches.
- Uses dedicated clock routing resources.
- Improves timing and reliability.

---

## FPGA Note

Although the RTL code uses

```verilog
assign gated_clk = clk & en;
```

Vivado recognizes this pattern and implements it using the **Clock Enable (CE)** pin of the flip-flop instead of creating an AND gate.

This is the recommended implementation for FPGA devices.

---

## ASIC Note

In ASIC design, clock gating is typically implemented using **Integrated Clock Gating (ICG)** cells.

ICG cells:
- Prevent clock glitches.
- Reduce dynamic power consumption.
- Are automatically inserted during synthesis by EDA tools.

---

## Applications

- Low-Power Digital Systems
- Microprocessors
- DSP Processors
- SoCs
- Battery Powered Devices
- ASIC Design
- FPGA Design

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Behavioral Simulation
- RTL Analysis
- Synthesis

---

## Learning Outcomes

Through this project, I learned:

- Clock Gating concept
- Dynamic Power Reduction
- Clock Enable (CE)
- FPGA synthesis optimization
- RTL Design
- Behavioral Simulation
- RTL Schematic Analysis
- Difference between FPGA and ASIC clock gating implementation

---

## Author

**Aditya Ugare**

VLSI Design & Verification Engineer (Trainee)

Focused on RTL Design, FPGA Prototyping, Digital Design, and Verification.
