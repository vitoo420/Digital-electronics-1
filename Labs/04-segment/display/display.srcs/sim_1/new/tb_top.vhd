----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2021 02:07:27 PM
-- Design Name: 
-- Module Name: tb_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
--Port ( );
end tb_top;

architecture Behavioral of tb_top is

        signal s_SW   : STD_LOGIC_VECTOR (4 - 1 downto 0);
        signal s_CA   : STD_LOGIC;
        signal s_CB   : STD_LOGIC;
        signal s_CC   : STD_LOGIC;
        signal s_CD   : STD_LOGIC;
        signal s_CE   : STD_LOGIC;
        signal s_CF   : STD_LOGIC;
        signal s_CG   : STD_LOGIC;
            
        signal s_LED  : STD_LOGIC_VECTOR (8 - 1 downto 0);
        signal s_AN   : STD_LOGIC_VECTOR (8 - 1 downto 0);
begin

uut_top : entity work.top
        port map
        ( 
            SW      => s_SW,
            CA      => s_CA,
            CB      => s_CB,
            CC      => s_CC,
            CD      => s_CD,
            CE      => s_CE,
            CF      => s_CF,
            CG      => s_CG,
               
            LED     => s_LED,
            AN      => s_AN
        );
        
p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;


		s_SW <= "0000"; wait for 100 ns;         -- 0
        s_SW <= "0001"; wait for 100 ns;         -- 1
        s_SW <= "0010"; wait for 100 ns;         -- 2
		s_SW <= "0011"; wait for 100 ns;         -- 3
		s_SW <= "0100"; wait for 100 ns;         -- 4
		s_SW <= "0101"; wait for 100 ns;         -- 5
		s_SW <= "0110"; wait for 100 ns;         -- 6
		s_SW <= "0111"; wait for 100 ns;         -- 7
		s_SW <= "1000"; wait for 100 ns;         -- 8
		s_SW <= "1001"; wait for 100 ns;         -- 9
		s_SW <= "1010"; wait for 100 ns;         -- A
		s_SW <= "1011"; wait for 100 ns;         -- b
		s_SW <= "1100"; wait for 100 ns;         -- C
		s_SW <= "1101"; wait for 100 ns;         -- d
		s_SW <= "1110"; wait for 100 ns;         -- E
		s_SW <= "1111"; wait for 100 ns;         -- F
		wait;	
		
		end process p_stimulus;

end Behavioral;
