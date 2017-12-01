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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           ENABLE : out  STD_LOGIC;
           S : out  STD_LOGIC);
end control;

architecture Behavioral of control is	
	
begin

	process(CLOCK,START)
	
	variable rnd : STD_LOGIC_VECTOR(3 downto 0);

	begin
	
--		if (CLOCK = '1' AND CLOCK'EVENT) THEN
----		READY <= '0';
----		S <= '0';
--		if rnd = "0000" then
--			rnd := "0001";
--			S <= '1';
--		elsif rnd = "0001" then rnd := "0010";
--		elsif rnd = "0010" then rnd := "0011";
--		elsif rnd = "0011" then rnd := "0100";
--		elsif rnd = "0100" then rnd := "0101";
--		elsif rnd = "0101" then rnd := "0110";
--		elsif rnd = "0110" then rnd := "0111";
--		elsif rnd = "0111" then rnd := "1000"; ENABLE <= '0'; READY <= '1';
--		elsif rnd = "1000" then
--			if START = '1' THEN 
--				rnd := "0000";
--				READY <= '0';
--				ENABLE <= '1';
--				S <= '0';
--			else 
--				rnd := "1000";
--				READY <= '1';
--				ENABLE <= '0';
--			end if;
--		else
--			if START = '1' THEN 
--				rnd := "0000";
--				READY <= '0';
--				ENABLE <= '1';
--				S <= '0';
--			else 
--				rnd := "1000";
--				READY <= '1';
--				ENABLE <= '0';
--			end if;		
--		end if;
--		ROUND <= rnd;
--		end if;



	if (CLOCK = '1' AND CLOCK'EVENT) THEN
--		READY <= '0';
--		S <= '0';
	case rnd is 
		when "0000" => rnd := "0001";
			S <= '1';
		when "0001" => rnd := "0010";
		when "0010" => rnd := "0011";
		when "0011" => rnd := "0100";
		when "0100" => rnd := "0101";
		when "0101" => rnd := "0110";
		when "0110" => rnd := "0111";
		when "0111" => rnd := "1000"; ENABLE <= '0'; READY <= '1';
		when "1000" =>
			if START = '1' THEN 
				rnd := "0000";
				READY <= '0';
				ENABLE <= '1';
				S <= '0';
			else 
				rnd := "1000";
				READY <= '1';
				ENABLE <= '0';
			end if;
		when others =>
			if START = '1' THEN 
				rnd := "0000";
				READY <= '0';
				ENABLE <= '1';
				S <= '0';
			else 
				rnd := "1000";
				READY <= '1';
				ENABLE <= '0';
			end if;		
		end case;
		ROUND <= rnd;
		end if;
	
end process;
		
			
end Behavioral;

