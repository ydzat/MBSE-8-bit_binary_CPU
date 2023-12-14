# Project: CPU

The task is to create an executable CPU MontiArc model.
You can
* recreate an existing CPU.
  If you do, (very) small 4/8-bit CPUs with open-source schematics are recommended.
* Or invent your own CPU with its own set of instructions, registers, etc.
  Still, your model should be representing a specific (existing) kind of CPU
  (e.g., Harvard / von Neumann architecture).

This project asks for a very low-level model:
The only data type you need is `boolean`.
For the most part you should compose your system, on the lowest level,
using simple logical gates (e.g., `AND`-, `OR`-, `XOR`-gate).

Your CPU must at least have:
 * A specified set of instructions
 * a control unit to select the next instruction
 * arithmetic logic unit
 * register to store and load results from

To try to get a better grade, you can extend the list above.
Here are some suggestions of what you can add:
 * memory beyond the registers to store instructions/data in
 * numeric processing unit
