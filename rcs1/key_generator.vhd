----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:16 06/07/2017 
-- Design Name: 
-- Module Name:    key_generator - Behavioral 
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

entity key_generator is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           R : in  STD_LOGIC_VECTOR (3 downto 0);
           A : out  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0);
           D : out  STD_LOGIC_VECTOR (15 downto 0);
           E : out  STD_LOGIC_VECTOR (15 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
end key_generator;

architecture Behavioral of key_generator is
	
	type PARTIAL_KEYS_ARRAY is array(52 downto 1) of std_logic_vector(15 downto 0);
	signal partial_keys : PARTIAL_KEYS_ARRAY;

begin

	partial_key: process (KEY)

		variable temp_key : STD_LOGIC_VECTOR(127 downto 0);
		variable index : integer range 1 to 52;

	begin


		index := 1;
		temp_key := key;
		
		for i in 0 to 5
		loop
			for j in 0 to 7
			loop
				partial_keys(index) <= temp_key(127-j*16 downto 112-j*16);
				index := index + 1;
			end loop;
			temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
		end loop;
		for k in 0 to 3
		loop
				partial_keys(index) <= temp_key(127-k*16 downto 112-k*16);
				index := index + 1;
		end loop;
		
		end process partial_key;

	output: process (partial_keys,R)
	
	variable i : integer range 0 to 8;
		
	begin
			
			IF R = "0000" THEN
				i := 0;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
				E <= partial_keys(6*i+5);
				F <= partial_keys(6*i+6);
			ELSIF R = "0001" THEN
				i := 1;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
				E <= partial_keys(6*i+5);
				F <= partial_keys(6*i+6);
			ELSIF R = "0010" THEN
				i := 2;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
				E <= partial_keys(6*i+5);
				F <= partial_keys(6*i+6);
			ELSIF R = "0011" THEN
				i := 3;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
				E <= partial_keys(6*i+5);
				F <= partial_keys(6*i+6);
			ELSIF R = "0100" THEN
				i := 4;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
				E <= partial_keys(6*i+5);
				F <= partial_keys(6*i+6);
			ELSIF R = "0101" THEN
				i := 5;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
				E <= partial_keys(6*i+5);
				F <= partial_keys(6*i+6);
			ELSIF R = "0110" THEN
				i := 6;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
				E <= partial_keys(6*i+5);
				F <= partial_keys(6*i+6);
			ELSIF R = "0111" THEN
				i := 7;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
				E <= partial_keys(6*i+5);
				F <= partial_keys(6*i+6);
			ELSIF R = "1000" THEN
				i := 8;
				A <= partial_keys(6*i+1);
				B <= partial_keys(6*i+2);
				C <= partial_keys(6*i+3);
				D <= partial_keys(6*i+4);
			
			end IF;
			
			end process output;
			
				


end Behavioral;

