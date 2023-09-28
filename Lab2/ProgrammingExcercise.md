## Question 1: What does this program do?

- this program reads the number of digits that you enter

## Question 2: What are the memory addresses of the data labelled len, buffer, and str?

```
    R4  [a0] = 10010010 (str)
    R4  [a0] = 10010004 (first buffer)
    R8  [t0] = 10010004 (second buffer)
    R16 [s0] = 10010000 (len)
```

## Question 3: Will your answer to Question 2 the same if the directive ".align 4" is commented out? Why?

```
    R4  [a0] = 1001000e (str)
    R4  [a0] = 10010004 (first buffer)
    R8  [t0] = 10010004 (second buffer)
    R16 [s0] = 10010000 (len)
```

- No, the memory of str is changed from `10010010` to `1001000e` because the align memory reserves room for memory.
