# Lab 8

## Task 1

| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) | ![rising](Img/eq_uparrow.png) |
| **State** | A | A | B | C | C | D | A | B | C | D | D | A | A | B | C | D |
| **Output R** | `0` | `0` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `1` | `1` | `0` | `0` | `0` | `0` | `1` |


![alt text][figure]

| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` | `1,1,0` | `0,1,0` |
| LD17 | N16, R11, G14 | `1,0,0` | `1,1,0` | `0,1,0` |

## Task 2

### State diagram

![alt text][state_diagram]

### p_traffic_fsm process

```vhdl
p_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= STOP1 ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                
                case s_state is

                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when STOP1 =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= WEST_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    when WEST_GO =>
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= WEST_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                    when WEST_WAIT =>
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP2;
                            s_cnt   <= c_ZERO;
                        end if;
                    when STOP2 =>
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_GO;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when SOUTH_GO =>
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;                        
                    when SOUTH_WAIT =>
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP1;
                            s_cnt   <= c_ZERO;
                        end if;
                    -- It is a good programming practice to use the 
                    -- OTHERS clause, even if all CASE choices have 
                    -- been made. 
                    when others =>
                        s_state <= STOP1;

                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_traffic_fsm;
```

### p_output_fsm process

```vhdl
p_output_fsm : process(s_state)
    begin            
            case s_state is
                when STOP1 =>
                    south_o <= c_RED;
                    west_o  <= c_RED;
                when WEST_GO =>
                    south_o <= c_RED;
                    west_o  <= c_GREEN;
                when WEST_WAIT =>
                    south_o <= c_RED;
                    west_o  <= c_YELLOW;
                when STOP2  =>
                    south_o <= c_RED;
                    west_o  <= c_RED;
                when SOUTH_GO =>
                    south_o <= c_GREEN;
                    west_o  <= c_RED;
                when SOUTH_WAIT =>
                    south_o <= c_YELLOW;
                    west_o  <= c_RED;
    
                when others =>
                    south_o <= c_RED;
                    west_o  <= c_RED;
            end case;
    end process p_output_fsm;
```

### Waweforms

![alt text][wave1]

![alt text][wave2]

## Task 3

### State table

First column shows actual state and others shows next state depending on input

| **State** | **No cars** | **Cars to west** | **Cars to south** | **Cars both direction** | 
| :-: | :-: | :-: | :-: | :-: |
| Stop1 | WestGo | WestGo | Stop2 | WestGo |
| Stop2 | SouthGo | Stop1 | SouthGo | SouthGo |
| WestGo | WestWait | WestWait | Stop2 | WestWait |
| WestWait | Stop2 | Stop1 | Stop2 | Stop2 |
| SouthGo | SouthWait | Stop1 | SouthWait | SouthWait |
| SouthWait | Stop1 | Stop1 | Stop2 | Stop1 |

### State diagram

![alt text][state_diagram2]

### p_smart_traffic_fsm process

```vhdl
p_smart_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= STOP1 ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                if(sensorSouth = '1' and sensorWest = '0' and s_state /= STOP2 and s_state /= SOUTH_GO and s_state /= WEST_WAIT) then
                    s_state <= WEST_WAIT;
                elsif (sensorSouth = '0' and sensorWest = '1' and s_state /= STOP1 and s_state /= WEST_GO and s_state /= SOUTH_WAIT) then
                    s_state <= SOUTH_WAIT;
                end if;
                
                case s_state is

                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when STOP1 =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= WEST_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    when WEST_GO =>
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= WEST_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                    when WEST_WAIT =>
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP2;
                            s_cnt   <= c_ZERO;
                        end if;
                    when STOP2 =>
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_GO;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when SOUTH_GO =>
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;                        
                    when SOUTH_WAIT =>
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP1;
                            s_cnt   <= c_ZERO;
                        end if;
                    -- It is a good programming practice to use the 
                    -- OTHERS clause, even if all CASE choices have 
                    -- been made. 
                    when others =>
                        s_state <= STOP1;

                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_smart_traffic_fsm;
```


[wave1]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Img/wave1.jpg "waveform"
[wave2]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Img/wave2.jpg "waveform"
[state_diagram]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Img/state_diagram.jpg "state diagram"
[state_diagram2]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Img/rsz_state_diagram_2.jpg "state diagram"
[figure]: https://github.com/vitoo420/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Img/figure.png "figure"