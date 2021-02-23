# Lab 2

## Task 1

*Digital* or *Binary comparator* compares the digital signals A, B presented at input terminal and produce outputs depending upon the condition of those inputs. Complete the truth table for 2-bit *Identity comparator* (B equals A), and two *Magnitude comparators* (B is greater than A, B is less than A). Note that, such a digital device has four inputs and three outputs/functions.

### Logical table

| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

According to the truth table, write canonical SoP (Sum of Products) and PoS (Product of Sums) forms for "equals" and "less than" functions:

sop(equals): (!b1 \* !b0 \* !a1 \* !a0) + (!b1 \* b0 \* !a1 \* a0) + (b1 \* !b0 \* a1 \* !a0) + (b1 \* b0 \* a1 \* a0)

pos(less): (b1 + b0 + a1 + a0) \* (b1 + !b0 + a1 + a0) \* (b1 + !b0 + a1 + !a0) \* (b1 + !b0 + !a1 + a0) \* (!b1 + b0 + a1 + a0) \* (!b1 + b0 + a1 + !a0) \* (!b1 + b0 + !a1 + a0) \* (!b1 + !b0 + a1 + a0) \* (!b1 + !b0 + a1 + !a0) \* (!b1 + !b0 + !a1 + a0) \* (!b1 + !b0 + !a1 + !a0)

## Task 2

### Karnaugh maps

![alt text][B_greater_A]

![alt text][B_equals_A]

![alt text][B_less_A]

### Simplified equations

SoP of b>a f(b1, b0, a1, a0) = (b0\*!a1\*!a0) + (b1\*!a1) + (b1\*b0*\!a0) 

PoS of b<a f(b1, b0, a1, a0) = (a1 + a0)(!b0 + a1)(!b0+a0)(!b1 + a1)(!b1 + a0)(!b1 + !b0)

### Link to playground



## Task 3

### Source code

```vhdl

```

### VHDL Test bench

```vhdl

```

### Screenshot of waveforms

### Link to playground
[EDA Playground link]()


[B_less_A]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/02-logic/Img/BlessA.jpg "B less A Karnaugh map"
[B_greater_A]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/02-logic/Img/BgreaterA.jpg "B gretaer A Karnaugh map"
[B_equals_A]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/02-logic/Img/BequalsA.jpg "B equals A Karnaugh map"