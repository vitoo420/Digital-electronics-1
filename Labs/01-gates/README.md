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


**2. Screenshot of time course**

  ![alt text][DeMorgan]

  a | b | c        f(a,b,c)
  ------------ | -------------
  0 | 0 | 0           x   
  0 | 0 | 1           x
  0 | 1 | 0
  0 | 1 | 1
  1 | 0 | 0
  1 | 0 | 1
  1 | 1 | 0
  1 | 1 | 1



**3. Link**

  [EDA Playground link](https://www.edaplayground.com/x/8MW7)


##Task 3
 
**1. Source code**

**2. Screenshot of time course**

**3. Link**
  
  
  
  
  
[DeMorgan]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/01-gates/Img/Casovy_prubeh.png "DeMorgan time course"