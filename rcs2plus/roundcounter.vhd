----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    roundcounter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity roundcounter is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is

TYPE State is (Sleep, Setup, Calc);
signal current_state : State;
signal rnd : STD_LOGIC_VECTOR (3 downto 0):= "0000";

begin

process (CLOCK,rnd)

begin	
	if (CLOCK'EVENT and CLOCK = '1') then
		case current_state is
			when Sleep =>
				INIT <= '0';
				READY <= '1';
				if Start = '1' then
					current_state <= Setup;
				else
					rnd <= "1000";			
				end if;
			when Setup =>
				INIT <= '1';
				READY <= '0';
				current_state <= Calc;
			when Calc =>
				INIT <= '0';
				if RESULT = '0' then
					current_state <= Calc;
				elsif (RESULT = '1' and rnd /= "1000") then
					current_state <= Setup;
				elsif (RESULT = '1' and rnd = "1000") then
					current_state <= Sleep;
				end if;
			when others =>
				current_state <= Sleep;
			end case;
			
			case rnd is
				when "0000" =>
					if RESULT = '1' then
						rnd <= "0001";
					end if;
					S_i <= '1';
				when "0001"  =>
					if RESULT = '1' then
						rnd <= "0010";
					end if;
					S_i <= '0';
				when "0010"  =>
					if RESULT = '1' then
						rnd <= "0011";
					end if;
				when "0011"  =>
					if RESULT = '1' then
						rnd <= "0100";
					end if;
				when "0100"  =>
					if RESULT = '1' then
						rnd <= "0101";
					end if;
				when "0101"  =>
					if RESULT = '1' then
						rnd <= "0110";
					end if;
				when "0110"  =>
					if RESULT = '1' then
						rnd <= "0111";
					end if;
				when "0111"  =>
					if RESULT = '1' then
						rnd <= "1000";
					end if;
				when "1000"  =>
					if START = '1' then
						rnd <= "0000";
					end if;
				when others =>
					rnd <= "1000";
			end case;
	end if;		
		
		ROUND <= rnd;
		TRAFO <= rnd(3);

end process;

end Behavioral;



