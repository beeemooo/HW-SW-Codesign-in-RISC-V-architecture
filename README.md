# HW-SW Codesign in RISC-V/MIPS Architecture

## 📌 Project Overview
This project demonstrates **hardware–software co-design** by integrating a MIPS-like processor written in **Verilog** with custom **assembly programs**.  
The hardware implements essential CPU components, while the software runs on top of the processor, interacting with instruction memory, data memory, and simple I/O devices such as LEDs.

---

## 🏗️ Hardware Design (Verilog)

The hardware was implemented in Verilog and includes the following modules:

- **ALU.v** — Arithmetic Logic Unit  
- **RegisterFile.v** — General-purpose register storage  
- **ControlUnit.v** — Decodes instructions and generates control signals  
- **InstructionMemory.v** — Stores instructions (preloaded from `.txt` files)  
- **DataMemory.v** — Provides read/write access to memory  
- **reg_half.v** — Half-register utility  
- **clockdiv.v** — Clock divider for simulation/FPGA adaptation  
- **top.v** — Top-level module integrating all components  
- **MIPS.v** — Main processor datapath  

This modular design reflects a simplified MIPS CPU architecture that can be synthesized and tested on FPGA platforms.

---

## 💻 Software Design (Assembly)

The software side was developed in **MIPS assembly language**:

- **mul.asm** — Implements arithmetic and branching logic, compiled into machine code for the instruction memory:contentReference[oaicite:0]{index=0}  
- **insmem_h.txt** — Instruction memory initialization file:contentReference[oaicite:1]{index=1}  
- **datamem_h.txt** — Data memory initialization file:contentReference[oaicite:2]{index=2}  

The program demonstrates:
- Reading values from memory  
- Performing arithmetic operations (including multiplication)  
- Conditional branching and looping  
- Writing results to memory-mapped I/O (e.g., LED output at address `0x7FF0`):contentReference[oaicite:3]{index=3}  

---

## 🔗 HW-SW Interaction

1. Assembly instructions are preloaded into **InstructionMemory** (`insmem_h.txt`).  
2. Data is preloaded into **DataMemory** (`datamem_h.txt`).  
3. The Verilog CPU fetches and executes the instructions cycle by cycle.  
4. Results are written back to registers, data memory, or to I/O devices (such as LEDs).  

This demonstrates how **hardware architecture and software control flow are co-designed** to achieve functional execution on a custom processor.

---

## ⚙️ Requirements

- **HDL Tools**: Xilinx Vivado / ModelSim / Icarus Verilog  
- **Assembler/Compiler**: MARS or SPIM for generating MIPS machine code  
- **FPGA Board** (optional for synthesis): Xilinx Basys 3 / Zybo / ZedBoard  

---

## 🚀 How to Run

1. Load Verilog source files into your HDL tool.  
2. Preload `insmem_h.txt` and `datamem_h.txt` into instruction and data memory modules.  
3. Run simulation (`top.v` as top-level).  
4. Observe register values and LED output (`0x7FF0`) to verify program execution.  

---

## 📚 Future Work

- Extend the instruction set (e.g., floating-point operations).  
- Add pipelining and hazard detection.  
- Support more complex I/O devices beyond LEDs.  

---
