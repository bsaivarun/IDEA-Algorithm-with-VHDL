----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:40 05/25/2017 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

entity round is
    Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is

	COMPONENT xorop 
		PORT (
				X: in STD_LOGIC_VECTOR (15 downto 0);
				Y: in STD_LOGIC_VECTOR (15 downto 0);
				Z: out STD_LOGIC_VECTOR (15 downto 0)
				);
	end COMPONENT;
	
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

	signal S1, S2, S3, S4, S5, S6, S7, S8, S9, S10 : STD_LOGIC_VECTOR (15 downto 0);
	
begin

	m1 : mulop port map (X=>X1, Y=>Z1, Z=>S1);
	m2 : mulop port map (X=>X4, Y=>Z4, Z=>S4);
	m3 : mulop port map (X=>S5, Y=>Z5, Z=>S7);
	m4 : mulop port map (X=>S8, Y=>Z6, Z=>S9);
	
	a1 : addop port map (X=>X2, Y=>Z2, Z=>S2);
	a2 : addop port map (X=>X3, Y=>Z3, Z=>S3);
	a3 : addop port map (X=>S6, Y=>S7, Z=>S8);
	a4 : addop port map (X=>S7, Y=>S9, Z=>S10);
	
	r1: xorop port map (X=>S1, Y=>S3, Z=>S5);
	r2: xorop port map (X=>S2, Y=>S4, Z=>S6);
	r3: xorop port map (X=>S1, Y=>S9, Z=>Y1);
	r4: xorop port map (X=>S2, Y=>S10, Z=>Y3);
	r5: xorop port map (X=>S3, Y=>S9, Z=>Y2);
	r6: xorop port map (X=>S4, Y=>S10, Z=>Y4);

end Behavioral;

