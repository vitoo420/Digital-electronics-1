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

### Karnaugh's maps

![alt text][B_greater_A]

![alt text][B_equals_A]

![alt text][B_less_A]

### Simplified equations

SoP of b>a f(b1, b0, a1, a0) = (b0\*!a1\*!a0) + (b1\*!a1) + (b1\*b0*\!a0) 

PoS of b<a f(b1, b0, a1, a0) = (a1 + a0)(!b0 + a1)(!b0+a0)(!b1 + a1)(!b1 + a0)(!b1 + !b0)

### Source code

```vhdl
architecture Behavioral of comparator_2bit is
begin
    B_greater_A_o   <= '1' when (b_i > a_i) else '0';
    B_equals_A_o   <= '1' when (b_i = a_i) else '0';
    B_less_A_o   <= '1' when (b_i < a_i) else '0';

end architecture Behavioral;
```

### Link to playground
[EDA Playground link] (https://www.edaplayground.com/x/vwkq)


## Task 3

### Source code

```vhdl
architecture Behavioral of comparator_4bit is
begin
    B_greater_A_o <= '1' when (b_i > a_i) else '0';
    B_equals_A_o  <= '1' when (b_i = a_i) else '0';
    B_less_A_o    <= '1' when (b_i < a_i) else '0';


end architecture Behavioral;
```

### VHDL Test bench

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;
        
		s_b <= "0000"; s_a <= "1100"; wait for 100 ns;
  		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0000, 1100" severity error;

		s_b <= "0000"; s_a <= "1101"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0000, 1101" severity error;

		s_b <= "0000"; s_a <= "1110"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0000, 1110" severity error;

		s_b <= "0000"; s_a <= "1111"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0000, 1111" severity error;

		s_b <= "0001"; s_a <= "0000"; wait for 100 ns;
		assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
		report "Test failed for input combination: 0001, 0000" severity error;

		s_b <= "0001"; s_a <= "0001"; wait for 100 ns;
		assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
		report "Test failed for input combination: 0001, 0001" severity error;

		s_b <= "0001"; s_a <= "0010"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0001, 0010" severity error;

		s_b <= "0001"; s_a <= "0011"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0001, 0011" severity error;

		s_b <= "0001"; s_a <= "0100"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0001, 0100" severity error;

		s_b <= "0001"; s_a <= "0101"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0001, 0101" severity error;

		s_b <= "0001"; s_a <= "0110"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0001, 0110" severity error;

		s_b <= "0001"; s_a <= "0111"; wait for 100 ns;
		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
		report "Test failed for input combination: 0001, 0111" severity error;

		

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

### Screenshot of console

![alt text][console]

### Link to playground

[EDA Playground link] (https://www.edaplayground.com/x/XAF3)


[B_less_A]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/02-logic/Img/BlessA.jpg "B less A Karnaugh map"
[B_greater_A]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/02-logic/Img/BgreaterA.jpg "B gretaer A Karnaugh map"
[B_equals_A]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/02-logic/Img/BequalsA.jpg "B equals A Karnaugh map"
[console]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/02-logic/Img/console.png "Console"