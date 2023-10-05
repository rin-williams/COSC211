# Written Part

- i. 2.8 (1 mark)
  - 0xABCDEF12 to decimal is
  - a = 10, b = 11, c = 12, d = 13, e = 14, f = 15
  - so we add them up following that the most right side bit is 2\*16^0
  - and one to the left is 1\*16^1, so on.. we have,
  - 10\*16^7 + 11\*16^6 + 12\*16^5 + 13\*16^4 + 14\*16^3 +
  - 15\*16^2 + 1\*16^1 + 2\*16^0
  - the result equals to 2882400018
- ii. 2.12.1 (1 mark)
  - Assume that registers $s0 and $s1 hold the values 0x80000000 and - 0xD0000000, respectively.
  - What is the value of $t0 for the following assembly code? add $t0, $s0, $s1
  - The value of $t0 = $s0 + $s1 = 0x80000000 + 0xD0000000 =
  - since mips register is 32 bit only, it can only show 8 digits.
  - since d is 13, 8+13 = 21, but 21 as a hexadecimal is 15, so we have
  - 0x80000000 + 0xD0000000 = 0x150000000
- iii. 2.12.2 (1 marks)
  - Is the result in $t0 the desired result, or has there been overflow?
  - The result is not the desired result, there has been overflow.
  - The result is 0x50000000, but the desired result is 0x150000000
- iv. 2.12.3 (1 mark)

  - For the contents of registers $s0 and $s1 as specified above,
    what is the value of $t0 for the following assembly code?
    sub $t0, $s0, $s1.7
    - The value of $t0 = $s0 - $s1 = 0x80000000 - 0xD0000000 = 0x50000000
    - we know that 8 - 13 = -5 for 13 is D represented in hexadecimal
    - so the output will be 0x80000000 - 0xD0000000 = -0x50000000

- v. 2.12.4 (1 marks)
  - Is the result in $t0 the desired result, or has there been overflow?
  - The result is not the desired result, there has been overflow.
  - The result is -0x50000000
- vi. 2.12.5 (1 mark)
- vii. 2.12.6 (1 marks)
- viii. 2.14 (2 mark)
- ix. 2.15 (1 mark)
- x. 2.19.1 (1 mark)
- xi. 2.19.2 (1 mark)
- xii. 2.19.3 (1 mark)
