----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_rcs2plus - Structural 
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

entity idea_rcs2plus is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_rcs2plus;

architecture Structural of idea_rcs2plus is

	component clockedround is
		 Port ( CLOCK : in  STD_LOGIC;
				  INIT : in  STD_LOGIC;
				  TRAFO : in STD_LOGIC;
				  X1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
				  Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
				  RESULT : out STD_LOGIC;
				  Y1_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
				  Y2_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
				  Y3_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
				  Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0));
	end component clockedround;

	component roundcounter is
		 Port ( CLOCK : in  STD_LOGIC;
				  START : in  STD_LOGIC;
				  RESULT : in  STD_LOGIC;
				  READY : out  STD_LOGIC;
				  S_i : out  STD_LOGIC;
				  INIT : out  STD_LOGIC;
				  TRAFO : out  STD_LOGIC;
				  ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
	end component roundcounter;
	
	component KEY_generator is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           R : in  STD_LOGIC_VECTOR (3 downto 0);
           A : out  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0);
           D : out  STD_LOGIC_VECTOR (15 downto 0);
           E : out  STD_LOGIC_VECTOR (15 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	end component KEY_generator;

	component mux2x1 is
		 Port ( S : in  STD_LOGIC;
				  D0 : in  STD_LOGIC_VECTOR (15 downto 0);
				  D1 : in  STD_LOGIC_VECTOR (15 downto 0);
				  O : out  STD_LOGIC_VECTOR (15 downto 0));
	end component mux2x1;
	
	component clock_controlled_register is
		 Port ( Clock : in  STD_LOGIC;
				  ENABLE : in  STD_LOGIC;
				  D : in  STD_LOGIC_VECTOR (15 downto 0);
				  Q : out  STD_LOGIC_VECTOR (15 downto 0)
				 );
	end component clock_controlled_register;
	
	signal Result,Sel,Initialize,Trafo : STD_LOGIC;
	signal Round : STD_LOGIC_VECTOR(3 downto 0);
	signal KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,MUXOUT1,MUXOUT2,MUXOUT3,MUXOUT4,
			 clkrndout1,clkrndout2,clkrndout3,clkrndout4,
			 registerout1,registerout2,registerout3,registerout4 :  STD_LOGIC_VECTOR (15 downto 0);

begin

	roundcounter1 : roundcounter port map(CLOCK => CLOCK, START => START, RESULT => Result, 
													  READY => READY, S_i => Sel, INIT => Initialize, TRAFO => Trafo, ROUND => Round);
													  
	key_generator1 : KEY_generator port map(KEY => KEY, R => Round, A => KEY1, B => KEY2, C => KEY3, D => KEY4, E => KEY5, F => KEY6);
	
	clockedround1 : clockedround port map(CLOCK => CLOCK, INIT => Initialize, TRAFO => Trafo,
													  X1 => MUXOUT1, X2 => MUXOUT2, X3 => MUXOUT3, X4 => MUXOUT4,
													  Z1 => KEY1, Z2 => KEY2, Z3 => KEY3, Z4 => KEY4, Z5 => KEY5, Z6 => KEY6,
													  Y1 => clkrndout1, Y2 => clkrndout2, Y3 => clkrndout3, Y4 => clkrndout4,
													  RESULT => Result, Y1_TRAFO => Y1, Y2_TRAFO => Y2, Y3_TRAFO => Y3, Y4_TRAFO => Y4);
													  
	register01 : clock_controlled_register port map(Clock => CLOCK, ENABLE => Result, D => clkrndout1, Q => registerout1);	
	register02 : clock_controlled_register port map(Clock => CLOCK, ENABLE => Result, D => clkrndout2, Q => registerout2);	
	register03 : clock_controlled_register port map(Clock => CLOCK, ENABLE => Result, D => clkrndout3, Q => registerout3);	
	register04 : clock_controlled_register port map(Clock => CLOCK, ENABLE => Result, D => clkrndout4, Q => registerout4);
	
	mux01 : mux2x1 port map(S => Sel, D0 => registerout1, D1 => X1, O => MUXOUT1);	
	mux02 : mux2x1 port map(S => Sel, D0 => registerout2, D1 => X2, O => MUXOUT2);	
	mux03 : mux2x1 port map(S => Sel, D0 => registerout3, D1 => X3, O => MUXOUT3);	
	mux04 : mux2x1 port map(S => Sel, D0 => registerout4, D1 => X4, O => MUXOUT4);

end Structural;

