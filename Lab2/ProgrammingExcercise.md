## Question 1: What does this program do?

- this program reads the number of digits that you enter

## Question 2: What are the memory addresses of the data labelled len, buffer, and str?

```
    [00400028] 3c011001  lui $1, 4097 [str]
    [0040002c] 34240010  ori $4, $1, 16 [str]
    [00400038] 3c011001  lui $1, 4097 [buffer]
    [0040003c] 34240004  ori $4, $1, 4 [buffer]
    [00400048] 3c011001  lui $1, 4097 [buffer]
    [0040004c] 34280004  ori $8, $1, 4 [buffer]
    [00400050] 3c011001  lui $1, 4097 [len]
    [00400054] 34300000  ori $16, $1, 0 [len]
```

## Question 3: Will your answer to Question 2 the same if the directive ".align 4" is commented out? Why?

- Yes, because the default alignment of bytes in MIPS assembly is 4 so it will not affect the memory.
