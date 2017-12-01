----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:21:38 05/14/2017 
-- Design Name: 
-- Module Name:    xorop - Behavioral 
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

entity xorop is
	PORT (
			X: in STD_LOGIC_VECTOR (15 downto 0);
			Y: in STD_LOGIC_VECTOR (15 downto 0);
			Z: out STD_LOGIC_VECTOR (15 downto 0)
			);
end xorop;

architecture Behavioral of xorop is

begin
	
	process (X,Y)
	
	begin

		Z <= X xor Y;
		
	end process;
	
end Behavioral;

