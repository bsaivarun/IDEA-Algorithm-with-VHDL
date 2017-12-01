----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port ( CLOCK : in  STD_LOGIC;
           INIT : in  STD_LOGIC;
           TRAFO : in STD_LOGIC;
           EN125 : out  STD_LOGIC;
           EN346 : out  STD_LOGIC;
           EN78 : out  STD_LOGIC;
           RESULT : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(1 downto 0);
           S_T: out STD_LOGIC_VECTOR(1 downto 0));	
end control;

architecture Behavioral of control is

signal INTERNAL_STATE : STD_LOGIC_VECTOR(2 downto 0) := "111";
signal state1,state2,state3,state4 : STD_LOGIC := '0';


begin
	
	bit_counter : process(CLOCK,INIT)
	
	begin
		
		if (CLOCK = '1' AND CLOCK'EVENT) then
			if TRAFO = '0' then
				case INTERNAL_STATE is
					when "111" => 
						if INIT = '1' then
							state1 <= '1'; 
							INTERNAL_STATE <= INTERNAL_STATE + "001";
							S <= INTERNAL_STATE(2 downto 1);
							S_T <= INTERNAL_STATE(2 downto 1);
						else
							null;
						end if;
					when "000" => state1 <= '0'; INTERNAL_STATE <= INTERNAL_STATE + "001"; S <= INTERNAL_STATE(2 downto 1); S_T <= INTERNAL_STATE(2 downto 1);
					when "001" => state2 <= '1'; INTERNAL_STATE <= INTERNAL_STATE + "001"; 
					when "010" => state2 <= '0'; INTERNAL_STATE <= INTERNAL_STATE + "001"; S <= INTERNAL_STATE(2 downto 1); S_T <= INTERNAL_STATE(2 downto 1);
					when "011" => state3 <= '1'; INTERNAL_STATE <= INTERNAL_STATE + "001"; 
					when "100" => state3 <= '0'; INTERNAL_STATE <= INTERNAL_STATE + "001"; S <= INTERNAL_STATE(2 downto 1); S_T <= INTERNAL_STATE(2 downto 1);
					when "101" => state4 <= '1'; INTERNAL_STATE <= INTERNAL_STATE + "001"; 
					when "110" => state4 <= '0'; INTERNAL_STATE <= INTERNAL_STATE + "001"; S <= INTERNAL_STATE(2 downto 1); S_T <= INTERNAL_STATE(2 downto 1);
					when others => null;
					
				end case;
				
				elsif TRAFO = '1' then
					case INTERNAL_STATE is
						when "111" => 
							if INIT = '1' then
								state1 <= '1'; 
								INTERNAL_STATE <= INTERNAL_STATE + "001";
								S <= INTERNAL_STATE(2 downto 1);
								S_T <= INTERNAL_STATE(2 downto 1);
							else
								null;
							end if;
						when "000" => state1 <= '0'; INTERNAL_STATE <= INTERNAL_STATE + "001"; S <= INTERNAL_STATE(2 downto 1); S_T <= INTERNAL_STATE(2 downto 1) + '1';
						when "001" => state2 <= '1'; INTERNAL_STATE <= INTERNAL_STATE + "001"; 
						when "010" => state2 <= '0'; INTERNAL_STATE <= INTERNAL_STATE + "001"; S <= INTERNAL_STATE(2 downto 1); S_T <= INTERNAL_STATE(2 downto 1) - '1';
						when "011" => state4 <= '1'; INTERNAL_STATE <= INTERNAL_STATE + "011"; 
						when "110" => state4 <= '0'; INTERNAL_STATE <= INTERNAL_STATE + "001"; S <= INTERNAL_STATE(2 downto 1); S_T <= INTERNAL_STATE(2 downto 1) - '1';
						when others => null;
					end case;
--				EN125 <= state1;
--				EN346 <= state2;
--				EN78 <= state3;
--				RESULT <= state4;
--				EN125 <= state1;
--				EN346 <= state2;
--				EN78 <= state3;
--				RESULT <= state4;
			else
				null;
			end if;
				EN125 <= state1;
				EN346 <= state2;
				EN78 <= state3;
				RESULT <= state4;
		end if;
		
	end process;
	
end Behavioral;

