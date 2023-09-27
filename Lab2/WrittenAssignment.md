# Written Assignment

### 2. a. Exercise 2.1 (Textbook, page 164)

```mips
main:
    # assuming g var is stored on this file
    lw $t0, g
    lw $t1, h
    subi $s0, $t1, 5
    add $s1, $t0, $s0
    sw $s1, f

```

### b. Exercise 2.2: (Textbook, pages 164)

```c
int main(){
    f = g + h;
    f = i + f;
}
```

### c. Exercise 2.3: (Textbook, pages 165)

```mips
main:
    # reg $s0 = f, $s1 = g, $s2 = h, $s3 = i, and $s4 = j
    # reg $s6 = B, $s7 = A

    # code out B[8] = A[i−j]; in MIPS

    #sub i from j
    sub $t0, $s3, s4

    # store the
    sw $t0($s7), 8($s6)
```

### d. Exercise 2.9: (Textbook, pages 166)

```mips
    # reg $s0 = f, $s1 = g, $s2 = h, $s3 = i, and $s4 = j
    # reg $s6 = B, $s7 = A

    # code out B[8] = A[i] + A[j]; in MIPS

    add 8($s6), $s3($s7), $s4($s7)
```
