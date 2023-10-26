# Programming Questions

1. What is the memory address of the array int_array?
2. The branch instruction beq is encoded as 0x10200009. Explain how the digit 9 in the encoding is determined?
3. Explain why the jump instruction j is encoded as 0x0810000f?

---

# Answers

1. Address of int_array is `R20 [s4] = 10010070`
2. The digit 9 in this encoding is referring to the address of exit. exit is at the address of 36 but it is divided by 4 since PC counts in increment of 4 bits. so 36/4 is 9. if this `beq` is true, it will jump to the address `0x10200009`.
3. The jump instruction j is encoded as `0x0810000f` is because jump instruction uses psuedodirect addressing, where the jump address is the 26 bits of the
   instruction concatenated with the upper bits of the PC. So the jump address is `0x0010000f` and the upper bits of the PC is `0x08000000`. So the jump instruction is encoded as `0x0810000f`.
