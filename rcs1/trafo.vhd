----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:15 05/25/2017 
-- Design Name: 
-- Module Name:    trafo - Behavioral 
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

entity trafo is
    Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end trafo;

architecture Behavioral of trafo is

		COMPONENT addop
    PORT(
         X : IN  STD_LOGIC_VECTOR(15 downto 0);
         Y : IN  STD_LOGIC_VECTOR(15 downto 0);
         Z : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT mulop
    PORT(
         X : IN  STD_LOGIC_VECTOR(15 downto 0);
         Y : IN  STD_LOGIC_VECTOR(15 downto 0);
         Z : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;

begin

	m1 : mulop port map (X=>X1, Y=>Z1, Z=>Y1);
	m2 : mulop port map (X=>X4, Y=>Z4, Z=>Y4);
	
	a1 : addop port map (X=>X2, Y=>Z3, Z=>Y3);
	a2 : addop port map (X=>X3, Y=>Z2, Z=>Y2);

end Behavioral;

