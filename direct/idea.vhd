----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea - Structural 
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

entity idea is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           A1 : in  STD_LOGIC_VECTOR (15 downto 0);
           A2 : in  STD_LOGIC_VECTOR (15 downto 0);
           A3 : in  STD_LOGIC_VECTOR (15 downto 0);
           A4 : in  STD_LOGIC_VECTOR (15 downto 0);
           B1 : out  STD_LOGIC_VECTOR (15 downto 0);
           B2 : out  STD_LOGIC_VECTOR (15 downto 0);
           B3 : out  STD_LOGIC_VECTOR (15 downto 0);
           B4 : out  STD_LOGIC_VECTOR (15 downto 0));
end idea;

architecture Structural of idea is

	COMPONENT round
    PORT(
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Z5 : IN  std_logic_vector(15 downto 0);
         Z6 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	COMPONENT trafo
    PORT(
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 type PARTIAL_KEYS_ARRAY is array(51 downto 0) of std_logic_vector(15 downto 0);
	 
	 signal partial_keys : PARTIAL_KEYS_ARRAY;
	 
	 signal 	R11,R12,R13,R14,R21,R22,R23,R24,R31,R32,R33,R34,R41,R42,R43,R44,
				R51,R52,R53,R54,R61,R62,R63,R64,R71,R72,R73,R74,R81,R82,R83,R84 : std_logic_vector(15 downto 0);

begin

	generator : process(key)
		variable temp_key : std_logic_vector(127 downto 0);
		variable index : integer range 0 to 51;
		
	begin
	
		index := 0;
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
		
		end process;
		
		round1 : round port map(X1 => A1, X2 => A2, X3 => A3, X4 => A4,
										Z1 => partial_keys(0), Z2 => partial_keys(1), Z3 => partial_keys(2), 
										Z4 => partial_keys(3), Z5 => partial_keys(4), Z6 => partial_keys(5),
										Y1 => R11, Y2 => R12, Y3 => R13, Y4 => R14);
										
		round2 : round port map(X1 => R11, X2 => R12, X3 => R13, X4 => R14,
										Z1 => partial_keys(6), Z2 => partial_keys(7), Z3 => partial_keys(8), 
										Z4 => partial_keys(9), Z5 => partial_keys(10), Z6 => partial_keys(11),
										Y1 => R21, Y2 => R22, Y3 => R23, Y4 => R24);
										
		round3 : round port map(X1 => R21, X2 => R22, X3 => R23, X4 => R24,
										Z1 => partial_keys(12), Z2 => partial_keys(13), Z3 => partial_keys(14), 
										Z4 => partial_keys(15), Z5 => partial_keys(16), Z6 => partial_keys(17),
										Y1 => R31, Y2 => R32, Y3 => R33, Y4 => R34);
										
		round4 : round port map(X1 => R31, X2 => R32, X3 => R33, X4 => R34,
										Z1 => partial_keys(18), Z2 => partial_keys(19), Z3 => partial_keys(20), 
										Z4 => partial_keys(21), Z5 => partial_keys(22), Z6 => partial_keys(23),
										Y1 => R41, Y2 => R42, Y3 => R43, Y4 => R44);
										
		round5 : round port map(X1 => R41, X2 => R42, X3 => R43, X4 => R44,
										Z1 => partial_keys(24), Z2 => partial_keys(25), Z3 => partial_keys(26), 
										Z4 => partial_keys(27), Z5 => partial_keys(28), Z6 => partial_keys(29),
										Y1 => R51, Y2 => R52, Y3 => R53, Y4 => R54);
										
		round6 : round port map(X1 => R51, X2 => R52, X3 => R53, X4 => R54,
										Z1 => partial_keys(30), Z2 => partial_keys(31), Z3 => partial_keys(32), 
										Z4 => partial_keys(33), Z5 => partial_keys(34), Z6 => partial_keys(35),
										Y1 => R61, Y2 => R62, Y3 => R63, Y4 => R64);
										
		round7 : round port map(X1 => R61, X2 => R62, X3 => R63, X4 => R64,
										Z1 => partial_keys(36), Z2 => partial_keys(37), Z3 => partial_keys(38), 
										Z4 => partial_keys(39), Z5 => partial_keys(40), Z6 => partial_keys(41),
										Y1 => R71, Y2 => R72, Y3 => R73, Y4 => R74);
										
		round8 : round port map(X1 => R71, X2 => R72, X3 => R73, X4 => R74,
										Z1 => partial_keys(42), Z2 => partial_keys(43), Z3 => partial_keys(44), 
										Z4 => partial_keys(45), Z5 => partial_keys(46), Z6 => partial_keys(47),
										Y1 => R81, Y2 => R82, Y3 => R83, Y4 => R84);
										
		output :  trafo port map(X1 => R81, X2 => R82, X3 => R83, X4 => R84,
										Z1 => partial_keys(48), Z2 => partial_keys(49), Z3 => partial_keys(50), Z4 => partial_keys(51),
										Y1 => B1, Y2 => B2, Y3 => B3, Y4 => B4);

end Structural;

