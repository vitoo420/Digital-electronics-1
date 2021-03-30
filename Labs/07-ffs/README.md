# Lab 7

## Task 1

![alt text][eq1]
![alt text][eq2]
![alt text][eq3]


| **D** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | hold |
   | 0 | 1 | 0 | reset |
   | 1 | 0 | 1 | set |
   | 1 | 1 | 1 | hold |

   | **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | 0 | No change |
   | 0 | 0 | 1 | 1 | No change |
   | 0 | 1 | 0 | 0 | reset |
   | 0 | 1 | 1 | 0 | reset |
   | 1 | 0 | 0 | 1 | set |
   | 1 | 0 | 1 | 1 | set |
   | 1 | 1 | 0 | 1 | toggle |
   | 1 | 1 | 1 | 0 | toggle |

   | **T** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | no change |
   | 0 | 1 | 1 | no change |
   | 1 | 0 | 1 | toggle |
   | 1 | 1 | 0 | toggle |
   
## Task 2

### process p_d_latch

```vhdl
p_d_latch : process (d, arst, en)
begin
    if (arst = '1') then
        q       <= '0';
        q_bar   <= '1';
    elsif (en = '1') then
        q       <= d;
        q_bar   <= not d;
    end if;
end process p_d_latch;
```

### reset and stimulus processes

```vhdl
 p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_en <= '0';
        s_d  <= '0';
        
        --switch d sequence
        wait for 10 ns;   
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        --/switch d sequence
        
        s_en <= '1';
        
        wait for 3 ns;
        assert(s_q = '0' and s_q_bar = '1')
        report "neco" severity error;
        
        --switch d sequence
        wait for 7 ns;   
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_en <= '0';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        --/switch d sequence
        
      
        
        --switch d sequence
        wait for 10 ns;   
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        --/switch d sequence
        
        s_en <= '1';
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;  
    
     p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 53 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 5 ns;
        
        s_arst <= '0';
        wait for 108 ns;
        s_arst <= '1';
        
        wait;
    end process p_reset_gen;
```



### screenshot

![alt text][dlatch_wave]

## Task 3

### p_d_ff_arst + clock, reset, stimulus

### p_d_ff_rst + clock, reset, stimulus

### p_jk_ff_rst + clock, reset, stimulus

### p_t_ff_rst + clock, reset, stimulus

### scrennshots

## Task 4






[eq1]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/07-ffs/Img/rov_d.jpg "Equation D"
[eq2]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/07-ffs/Img/rov_jk.jpg "Equation JK"
[eq3]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/07-ffs/Img/rov_t.jpg "Equation T"
[dlatch_wave]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/07-ffs/Img/d_latch_wave.jpg "D waveform"