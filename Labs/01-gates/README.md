# Lab 1

## Task 2

**Source code**
```vhdl
architecture dataflow of gates is
begin
    f_o		<=	(not b_i and a_i) or (not c_i and not b_i);	
    fnand_o	<=	not(not(not b_i and a_i) and not(not c_i and not b_i));	
    fnor_o	<=	not(b_i or not a_i) or not(c_i or b_i);

end architecture dataflow;
```

[Test link]()

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

**Screenshot of time course

Inline-style: 
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

Reference-style: 
![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"

*Sometimes you want numbered lists:*

1. One
2. Two
3. Three

Sometimes you want bullet points:

* Start a line with a star
* Profit!

Alternatively,

- Dashes work just as well
- And if you have sub points, put two spaces before the dash or star:
  - Like this
  - And this
