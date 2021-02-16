# Lab 1

## Task 2

**1. Source code**

```vhdl
architecture dataflow of gates is
begin
    f_o		<=	(not b_i and a_i) or (not c_i and not b_i);	
    fnand_o	<=	not(not(not b_i and a_i) and not(not c_i and not b_i));	
    fnor_o	<=	not(b_i or not a_i) or not(c_i or b_i);

end architecture dataflow;
```
f = !b*a + !c*!b
NOR: !(b+!a)+!(c+b)
NAND: !(!b*a*!c*!b)

**2. Screenshot of time course**

  ![alt text][DeMorgan]

  a | b | c | f(a,b,c)
  ---|---|---|--------
  0 | 0 | 0 |    1   
  0 | 0 | 1 |    0
  0 | 1 | 0 |    0 
  0 | 1 | 1 |    0
  1 | 0 | 0 |    1
  1 | 0 | 1 |    1
  1 | 1 | 0 |    0  
  1 | 1 | 1 |    0


**3. Link**

  [EDA Playground link](https://www.edaplayground.com/x/8MW7)


## Task 3
 
**1. Source code**

```vhdl
architecture dataflow of gates is
begin
	f1_o <= (x_i and y_i) or (x_i and z_i);
    f2_o <= x_i and (y_i or z_i);
    f3_o <= (x_i or y_i) and (x_i or z_i);
    f4_o <= x_i or (y_i and z_i);

end architecture dataflow;
```
x*y + x*z = x*(y+z)
(x+y) * (x+z) = x + (y*z)

f1_o = x*y + x*z
f2_o = x*(y+z)
f3_o = (x+y) * (x+z)
f4_o = x + (y*z)

**2. Screenshot of time course**

  ![alt text][Distributive]
  
  x | y | z | f1 | f2 | f3 | f4
 ---|---|---|----|----|----|----
  0 | 0 | 0 | 0  | 0  | 0  | 0
  0 | 0 | 1 | 0  | 0  | 0  | 0
  0 | 1 | 0 | 0  | 0  | 0  | 0
  0 | 1 | 1 | 0  | 0  | 1  | 1
  1 | 0 | 0 | 0  | 0  | 1  | 1
  1 | 0 | 1 | 1  | 1  | 1  | 1
  1 | 1 | 0 | 1  | 1  | 1  | 1
  1 | 1 | 1 | 1  | 1  | 1  | 1
  
**3. Link**

  [EDA Playground link](https://www.edaplayground.com/x/G7Nn)
  
  
  
  
[DeMorgan]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/01-gates/Img/Casovy_prubeh.png "DeMorgan time course"
[Distributive]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/01-gates/Img/Casovy_prubeh_dist.png "DeMorgan time course"
