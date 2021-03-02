# Lab 3

## Task 1

| **LED** | **Pin** | **Switch** | **Pin** | 
| :-: | :-: | :-: | :-: |
| LED0 | H17 | SW0 | J15 |
| LED1 | K15 | SW1 | L16 |
| LED2 | J13 | SW2 | M13 |
| LED3 | N14 | SW3 | R15 |
| LED4 | R18 | SW4 | R17 |
| LED5 | V17 | SW5 | T18 |
| LED6 | U17 | SW6 | U18 |
| LED7 | U16 | SW7 | R13 |
| LED8 | V16 | SW8 | T8 |
| LED9 | T15 | SW9 | U8 |
| LED10 | U14 | SW10 | R16 |
| LED11 | T16 | SW11 | T13 |
| LED12 | V15 | SW12 | H6 |
| LED13 | V14 | SW13 | U12 |
| LED14 | V12 | SW14 | U11 |
| LED15 | V11 | SW15 | V10 |

## Task 2

### Architecture source code

```vhdl
architecture Behavioral of mux_2bit_4to1 is

begin

    f_o <= a_i when (sel_i = "00") else
       b_i when (sel_i = "01") else
       c_i when (sel_i = "10") else
       d_i;                 -- All other combinations        

end Behavioral;
```

### Stimulus process source code

```vhdl
p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;


		s_sel <= "00"; s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; wait for 100 ns;
		assert (s_f = "11");
		
		s_sel <= "01"; s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; wait for 100 ns;
		assert (s_f = "10");
        
        s_sel <= "10"; s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; wait for 100 ns;
		assert (s_f = "01");
		
		s_sel <= "11"; s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; wait for 100 ns;
		assert (s_f = "00");
		
		s_sel <= "00"; s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; wait for 100 ns;
		assert (s_f = "00");	
		
		s_sel <= "01"; s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; wait for 100 ns;
		assert (s_f = "01");
		
		s_sel <= "10"; s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; wait for 100 ns;
		assert (s_f = "10");
		
		s_sel <= "11"; s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; wait for 100 ns;
		assert (s_f = "11");
		
		wait;	
		
		end process p_stimulus;
```

### Waveform screenshot

![alt text][waveform]

## Task 3

### Creating project

1. Click 'File -> Project -> New...'

![alt text][pic1]

2. Click 'Next'

![alt text][pic2]

3. Name your project, select project path and click 'Next'

![alt text][pic3]

4. Select RTL project and click 'Next'

![alt text][pic4]

5. Select VHDL as File type, name new source file and click 'OK'

![alt text][pic5]

6. Optionally add Constraints file and click 'Next'

![alt text][pic6]

7. Select board 'Nexys A7-50T' and click 'Next'

![alt text][pic7]

8. Check summary and click 'Finish'

![alt text][pic8]

9. Name new entity and click 'OK'

![alt text][pic9]

### Adding source files

1. Click 'File -> Add Sources...', select 'Add or create design sources' and click 'Next'

![alt text][pic10]

2. Click 'Create file' name source file and click 'OK'

![alt text][pic11]

3. Name new entity and optionally define port and click 'OK' 

![alt text][pic12]

### Adding testbench file

1. Click 'File -> Add Sources...', select 'Add or create simulation sources' and click 'Next'

![alt text][pic13]

2. Name new file same as source file with tb_ prefix 

![alt text][pic14]

3. Name new entity same as entity in source file with tb_ prefix

![alt text][pic15]

### Running simulation

1. Click 'Flow -> Run Simulation -> Run Behavioral Simulation'

![alt text][pic16]

3. Done!

![alt text][pic17]


[waveform]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/waveform.png "Waveform"
[pic1]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/1.png "1"
[pic2]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/2.png "2"
[pic3]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/3.png "3"
[pic4]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/4.png "4"
[pic5]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/5.png "5"
[pic6]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/6.png "6"
[pic7]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/7.png "7"
[pic8]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/8.png "8"
[pic9]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/9.png "9"
[pic10]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/10.png "10"
[pic11]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/11.png "11"
[pic12]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/12.png "12"
[pic13]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/13.png "13"
[pic14]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/14.png "14"
[pic15]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/15.png "15"
[pic16]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/16.png "16"
[pic17]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/03-vivado/Img/17.png "17"