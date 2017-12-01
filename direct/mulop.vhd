----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mulop is
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : in  STD_LOGIC_VECTOR (15 downto 0);
           Z : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is

	signal XY : STD_LOGIC_VECTOR(33 downto 0);
	signal XY_mod : STD_LOGIC_VECTOR (15 downto 0);
	signal XY_div : STD_LOGIC_VECTOR (15 downto 0);
	signal X1, Y1 : STD_LOGIC_VECTOR (16 downto 0);


begin
	
	zeros : process(X,Y)

	begin
		
		if X = "0000000000000000" then
			X1 <= '1' & X;
		else 
			X1 <= '0' & X;
		end if;
			
		if Y = "0000000000000000" then
			Y1 <= '1' & Y;
		else 
			Y1 <= '0' & Y;
		end if;
		
	end process;

	XY <= X1 * Y1;
	XY_mod <= XY(15 downto 0);
	XY_div <= XY(31 downto 16);
	
	result : process(XY_mod, XY_div)
				variable res : STD_LOGIC_VECTOR (31 downto 0);
				--variable ans : STD_LOGIC_VECTOR (31 downto 0);
		
	begin
	
		res := "0000000000000000" & (XY_mod - XY_div);
		if XY_mod < XY_div then
			res := res + "00000000000000010000000000000001";
		elsif X = "0000000000000000" and Y = "0000000000000000" then
			res := "00000000000000000000000000000001";
		end if;
		Z <= res(15 downto 0);
		
	end process;

end Behavioral;

