----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_single - Structural 
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

entity idea_single is
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
end idea_single;

architecture Structural of idea_single is

	COMPONENT round
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
	end COMPONENT;

	COMPONENT trafo
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
	end COMPONENT;
	
	COMPONENT control
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           ENABLE : out  STD_LOGIC;
           S : out  STD_LOGIC);
	end COMPONENT;

	COMPONENT key_generator
		PORT ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           R : in  STD_LOGIC_VECTOR (3 downto 0);
           A : out  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0);
           D : out  STD_LOGIC_VECTOR (15 downto 0);
           E : out  STD_LOGIC_VECTOR (15 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	end COMPONENT;
	
	COMPONENT mux
    Port ( S : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	end COMPONENT;
	
	COMPONENT clock_controlled_register
    Port ( Clock : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0)
			 );
	end COMPONENT;
	
	signal Key1,Key2,Key3,Key4,Key5,Key6,
			 RegisterOut1,RegisterOut2,RegisterOut3,RegisterOut4,MuxOut1,MuxOut2,MuxOut3,MuxOut4,
			 RoundOut1,RoundOut2,RoundOut3,RoundOut4: STD_LOGIC_VECTOR(15 downto 0);
	signal E,Sel : STD_LOGIC;
	signal ControlOut : STD_LOGIC_VECTOR(3 downto 0);

begin

	control1 : control port map(CLOCK => CLOCK, START => START, 
										ROUND => ControlOut, READY => READY, ENABLE => E, S => Sel);
	
	key_generator1 : key_generator port map(KEY => KEY, R => ControlOut,										
														A => Key1, B => Key2, C => Key3, D => Key4, E => Key5, F => Key6);
	
	mux1 : mux port map(S => Sel, A => X1, B => RegisterOut1,
							 C => MuxOut1);

	mux2 : mux port map(S => Sel, A => X2, B => RegisterOut2,
							 C => MuxOut2);
			 
	mux3 : mux port map(S => Sel, A => X3, B => RegisterOut3,
							 C => MuxOut3);
							 
	mux4 : mux port map(S => Sel, A => X4, B => RegisterOut4,
							 C => MuxOut4);
	
	round1 : round port map(X1 => MuxOut1, X2 => MuxOut2, X3 => MuxOut3, X4 => MuxOut4,
								 Z1 => Key1, Z2 => Key2, Z3 => Key3, Z4 => Key4, Z5 => Key5, Z6 => Key6,
								 Y1 => RoundOut1, Y2 => RoundOut2, Y3 => RoundOut3, Y4 => RoundOut4);
								 
	register1 : clock_controlled_register port map(Clock => CLOCK, ENABLE => E, D => RoundOut1,
																 Q => RegisterOut1);
	
	register2 : clock_controlled_register port map(Clock => CLOCK, ENABLE => E, D => RoundOut2,
																 Q => RegisterOut2);
	
	register3 : clock_controlled_register port map(Clock => CLOCK, ENABLE => E, D => RoundOut3,
																 Q => RegisterOut3);
	
	register4 : clock_controlled_register port map(Clock => CLOCK, ENABLE => E, D => RoundOut4,
																 Q => RegisterOut4);
	
	trafo1 : trafo port map(X1 => RegisterOut1, X2 => RegisterOut2, X3 => RegisterOut3, X4 => RegisterOut4,
								 Z1 => Key1, Z2 => Key2, Z3 => Key3, Z4 => Key4,
								 Y1 => Y1, Y2 => Y2, Y3 => Y3, Y4 => Y4);
								 

end Structural;

