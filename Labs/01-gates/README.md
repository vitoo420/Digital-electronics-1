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



*Sometimes you want numbered lists:*

1. One
2. Two
3. Three
4.  Four

Sometimes you want bullet points:

* Start a line with a star
* Profit!

Alternatively,

- Dashes work just as well
- And if you have sub points, put two spaces before the dash or star:
  - Like this
  - And this
 
 
  
[DeMorgan]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/01-gates/Img/Casovy_prubeh.png "DeMorgan time course"
