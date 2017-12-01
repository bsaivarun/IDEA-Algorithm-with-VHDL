----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:00 06/07/2017 
-- Design Name: 
-- Module Name:    clock_controlled_register - Behavioral 
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

entity clock_controlled_register is
    Port ( Clock : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
end clock_controlled_register;

architecture Behavioral of clock_controlled_register is

begin

	process (Clock)
	
	begin
		IF (Clock = '1' AND Clock'EVENT) THEN
			IF (ENABLE = '1') THEN
				Q <= D;
			end IF;
		end IF;
	end process;

end Behavioral;

