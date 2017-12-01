----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:48:56 05/15/2017 
-- Design Name: 
-- Module Name:    addop - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addop is
	PORT(
			X: in STD_LOGIC_VECTOR (15 downto 0);
			Y: in STD_LOGIC_VECTOR (15 downto 0);
			Z: out STD_LOGIC_VECTOR (15 downto 0)
			);
end addop;

architecture Behavioral of addop is

begin
	
	process (X,Y)
	
	begin

		Z <= (X + Y);
	
	end process;

end Behavioral;

