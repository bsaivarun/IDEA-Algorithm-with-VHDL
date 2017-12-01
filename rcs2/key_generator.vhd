----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:16:16 06/07/2017 
-- Design Name: 
-- Module Name:    KEY_generator - Behavioral 
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


--entity KEY_generator is
--    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
--           R : in  STD_LOGIC_VECTOR (3 downto 0);
--           A : out  STD_LOGIC_VECTOR (15 downto 0);
--           B : out  STD_LOGIC_VECTOR (15 downto 0);
--           C : out  STD_LOGIC_VECTOR (15 downto 0);
--           D : out  STD_LOGIC_VECTOR (15 downto 0);
--           E : out  STD_LOGIC_VECTOR (15 downto 0);
--           F : out  STD_LOGIC_VECTOR (15 downto 0)
--			 );
--end KEY_generator;
--
--architecture Behavioral of KEY_generator is
--	
--	type PARTIAL_KEYS_ARRAY is array(52 downto 1) of std_logic_vector(15 downto 0);
--	signal partial_KEYs : PARTIAL_KEYS_ARRAY;
--
--begin
--
--	partial_KEY: process (KEY)
--
--		variable temp_KEY : STD_LOGIC_VECTOR(127 downto 0);
--		variable index : integer range 1 to 52;
--
--	begin
--
--
--		index := 1;
--		temp_KEY := KEY;
--		
--		for i in 0 to 5
--		loop
--			for j in 0 to 7
--			loop
--				partial_KEYs(index) <= temp_KEY(127-j*16 downto 112-j*16);
--				index := index + 1;
--			end loop;
--			temp_KEY := temp_KEY(102 downto 0) & temp_KEY(127 downto 103);
--		end loop;
--		for k in 0 to 3
--		loop
--				partial_KEYs(index) <= temp_KEY(127-k*16 downto 112-k*16);
--				index := index + 1;
--		end loop;
--		
--		end process partial_KEY;
--
--	output: process (partial_KEYs,R)
--	
--	variable i : integer range 0 to 8;
--		
--	begin
--			
--			IF R = "0000" THEN
--				i := 0;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--				E <= partial_KEYs(6*i+5);
--				F <= partial_KEYs(6*i+6);
--			ELSIF R = "0001" THEN
--				i := 1;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--				E <= partial_KEYs(6*i+5);
--				F <= partial_KEYs(6*i+6);
--			ELSIF R = "0010" THEN
--				i := 2;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--				E <= partial_KEYs(6*i+5);
--				F <= partial_KEYs(6*i+6);
--			ELSIF R = "0011" THEN
--				i := 3;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--				E <= partial_KEYs(6*i+5);
--				F <= partial_KEYs(6*i+6);
--			ELSIF R = "0100" THEN
--				i := 4;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--				E <= partial_KEYs(6*i+5);
--				F <= partial_KEYs(6*i+6);
--			ELSIF R = "0101" THEN
--				i := 5;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--				E <= partial_KEYs(6*i+5);
--				F <= partial_KEYs(6*i+6);
--			ELSIF R = "0110" THEN
--				i := 6;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--				E <= partial_KEYs(6*i+5);
--				F <= partial_KEYs(6*i+6);
--			ELSIF R = "0111" THEN
--				i := 7;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--				E <= partial_KEYs(6*i+5);
--				F <= partial_KEYs(6*i+6);
--			ELSIF R = "1000" THEN
--				i := 8;
--				A <= partial_KEYs(6*i+1);
--				B <= partial_KEYs(6*i+2);
--				C <= partial_KEYs(6*i+3);
--				D <= partial_KEYs(6*i+4);
--			
--			end IF;
--			
--			end process output;
--			
--				
--
--
--end Behavioral;


entity KEY_generator is
    Port ( R : in  STD_LOGIC_VECTOR (3 downto 0);
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           A : out  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0);
           D : out  STD_LOGIC_VECTOR (15 downto 0);
           E : out  STD_LOGIC_VECTOR (15 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0));
end KEY_generator;

architecture Behavioral of KEY_generator is
--    TYPE KEY_barrels_array IS ARRAY(6 downto 0) OF std_logic_vector(127 downto 0);
    SIGNAL KEY_barrels0 : std_logic_vector (127 downto 0);
    SIGNAL KEY_barrels1 : std_logic_vector (127 downto 0);
    SIGNAL KEY_barrels2 : std_logic_vector (127 downto 0);
    SIGNAL KEY_barrels3 : std_logic_vector (127 downto 0);
    SIGNAL KEY_barrels4 : std_logic_vector (127 downto 0);
    SIGNAL KEY_barrels5 : std_logic_vector (127 downto 0);
    SIGNAL KEY_barrels6 : std_logic_vector (95 downto 0);
    
    signal output : std_logic_vector (95 downto 0);
    
--    signal longlongKEY : std_logic_vector(895 downto 0);
    
begin

    process (R, KEY)
        --variable i : integer range 0 to 8;
    begin
        KEY_barrels0 <= KEY;
        KEY_barrels1 <= KEY_barrels0(102 downto 0) & KEY_barrels0(127 downto 103);
        KEY_barrels2 <= KEY_barrels1(102 downto 0) & KEY_barrels1(127 downto 103);
        KEY_barrels3 <= KEY_barrels2(102 downto 0) & KEY_barrels2(127 downto 103);
        KEY_barrels4 <= KEY_barrels3(102 downto 0) & KEY_barrels3(127 downto 103);
        KEY_barrels5 <= KEY_barrels4(102 downto 0) & KEY_barrels4(127 downto 103);
        KEY_barrels6 <= KEY_barrels5(102 downto 7); --& KEY_barrels5(127 downto 103);
    
        case R is
            when "0000" => output <= KEY_barrels0(127 downto 32);
            when "0001" => output <= KEY_barrels0(31 downto 0) & KEY_barrels1(127 downto 64);
            when "0010" => output <= KEY_barrels1(63 downto 0) & KEY_barrels2(127 downto 96);
            when "0011" => output <= KEY_barrels2(95 downto 0);
            when "0100" => output <= KEY_barrels3(127 downto 32);
            when "0101" => output <= KEY_barrels3(31 downto 0) & KEY_barrels4(127 downto 64);
            when "0110" => output <= KEY_barrels4(63 downto 0) & KEY_barrels5(127 downto 96);
            when "0111" => output <= KEY_barrels5(95 downto 0);
            when "1000" => output <= KEY_barrels6;--(127 downto 32);
            when others => output <= (others => 'X');
        end case;
        
        --output <= longlongKEY(895-i*6*16 downto 895-i*6*16-95);
    end process;

    F <= output(15 downto 0);
    E <= output(31 downto 16);
    D <= output(47 downto 32);
    C <= output(63 downto 48);
    B <= output(79 downto 64);
    A <= output(95 downto 80);
    
end Behavioral;
