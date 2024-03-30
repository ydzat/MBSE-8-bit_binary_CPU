<!--
 * @Author: Dongze Yang
 * @Date: 2024-01-27 13:27:00
 * @LastEditors: Dongze Yang
 * @LastEditTime: 2024-03-30 02:08:05
 * @Description: 
-->

# Overview

- The development branch should **ONLY** include the latest, compilable files!

- Please **DO NOT** upload files that cannot be compiled!

- Please perform compilation work **locally**!

- If you want to **push** files to this branch, please **pull** to local for synchronization first!

# Update

[2024-03-30 2:00]
 + New:
 \+ Combined Memory
 \+ Instruction
 \+ Control Unit
 \+ Computer
 + All unit tests have been passed.
 + Some BUGs fixed
 + Part of Documents


[2024-03-29 6:40]
 \+ Register8.arc rewritten. Now, its function is completely equal to RAM8, that is, it can perform random access and store a total of eight 8-bit data. But it has not been unit tested, it has only passed compilation, so it is not yet known whether the actual performance is as expected.

    Input:
        Address: ad2, ad1, ad0
        Write: w
        Read: r
        Clock: cl
        Store: st
        Data: d7, d6, d5, d4, d3, d2, d1, d0
    Output:
        Data: a7, a6, a5, a4, a3, a2, a1, a0
    
    In use, w input is equal to st to some extent;
    In use, r input, to simplify, you can make "read" always true (in your own code);

    Because of the new input, the code in the Processor part needs to be modified accordingly.

[2024-03-28]
 + Some unit tests have been completed: all memory parts.

# TODO

 - If you completed a component, please check it below.
 - Class diagram is not written.

## Components

### Circuits
- [x] Always False
- [x] Always True
- [x] Relay Default Off
- [x] Relay Default On


### Logic Gates
- [x] Nand
- [x] Invert
- [x] Invert 8 bit
- [x] And
- [x] And 8 bit
- [x] And 3 Input
- [x] Or
- [x] Or 8 bit
- [x] Xor
- [x] Xor 8 bit
- [x] Nor
- [x] Nor 3 Input
- [x] Not
- [x] Decoder38


### Arithmetics
- [x] Half Adder
- [x] Full Adder
- [x] Multi-bit Adder
- [x] Increment
- [x] Substraction
- [x] Equal to Zero

### Switching
- [x] Selector
- [x] Selector 8 bit
- [x] Switch

### Arithmetic Logic Unit
- [x] Logic Unit
- [x] Arithmetic Unit
- [x] ALU
- [x] Condition

### Memory
- [x] Latch / RSFF
- [x] Data Flip-Flop
- [x] Register
- [x] Register 8 address
- [x] Counter
- [x] RAM


### Processor
- [x] Combined Memory
- [x] Instruction
- [x] Control Unit
- [x] Computer
- [x] Input and Output
