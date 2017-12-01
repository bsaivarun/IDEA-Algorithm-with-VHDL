----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:58 06/24/2017 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
    Port ( CLOCK : in  STD_LOGIC;
			  EN125 : in  STD_LOGIC;
           EN346 : in  STD_LOGIC;
           EN78 : in  STD_LOGIC;
			  Slt : in  STD_LOGIC_VECTOR (1 downto 0);
           Slt_T: in STD_LOGIC_VECTOR (1 downto 0);
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
			  Y1_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0));
end datapath;

architecture Structural of datapath is

	component addop is
		PORT(	X: in STD_LOGIC_VECTOR (15 downto 0);
				Y: in STD_LOGIC_VECTOR (15 downto 0);
				Z: out STD_LOGIC_VECTOR (15 downto 0));
	end component addop;
		
	component mulop is
    Port (X : in  STD_LOGIC_VECTOR (15 downto 0);
          Y : in  STD_LOGIC_VECTOR (15 downto 0);
          Z : out  STD_LOGIC_VECTOR (15 downto 0));
	end component mulop;
	
	component xorop is
	PORT (X: in STD_LOGIC_VECTOR (15 downto 0);
			Y: in STD_LOGIC_VECTOR (15 downto 0);
			Z: out STD_LOGIC_VECTOR (15 downto 0));
	end component xorop;

	component clock_controlled_register is
		 Port (Clock : in  STD_LOGIC;
				 ENABLE : in  STD_LOGIC;
				 D : in  STD_LOGIC_VECTOR (15 downto 0);
				 Q : out  STD_LOGIC_VECTOR (15 downto 0));
	end component clock_controlled_register;

	component mux4x1 is
		 Port ( S : in  STD_LOGIC_VECTOR (1 downto 0);
				  A : in  STD_LOGIC_VECTOR (15 downto 0);
				  B : in  STD_LOGIC_VECTOR (15 downto 0);
				  C : in  STD_LOGIC_VECTOR (15 downto 0);
				  D : in  STD_LOGIC_VECTOR (15 downto 0);
				  O : out  STD_LOGIC_VECTOR (15 downto 0));
	end component mux4x1;
	
	signal MuxOut1,MuxOut2,MuxOut3,MuxOut4,registerout1,registerout2,registerout3,registerout4,
			 registerout5,registerout6,registerout7,registerout8,
			 MulOut12,AddOut34,XorOut1234 : STD_LOGIC_VECTOR (15 downto 0);
		
begin
	
	mux001 : mux4x1 port map(S => Slt, A => X1, B => X4, C => Z5, D => Z6, O => MuxOut1);
	mux002 : mux4x1 port map(S => Slt, A => Z1, B => Z4, C => registerout5, D => registerout8, O => MuxOut2);
	mux003: mux4x1 port map(S => Slt, A => X3, B => X2, C => registerout6, D => registerout7, O => MuxOut3);
	mux004: mux4x1 port map(S => Slt_T, A => Z3, B => Z2, C => MulOut12, D => MulOut12, O => MuxOut4);
	
	mulop1 : mulop port map(X => MuxOut1, Y => MuxOut2, Z => MulOut12);
	
	addop1 : addop port map(X => MuxOut3, Y => MuxOut4, Z => AddOut34);
	
	xorop1 : xorop port map(X => MulOut12, Y => AddOut34, Z => XorOut1234);
	xorop2 : xorop port map(X => registerout3, Y => AddOut34, Z => Y3);
	xorop3 : xorop port map(X => registerout2, Y => MulOut12, Z => Y2);
	xorop4 : xorop port map(X => registerout4, Y => AddOut34, Z => Y4);
	xorop5 : xorop port map(X => registerout1, Y => MulOut12, Z => Y1);
		
	register1 : clock_controlled_register port map(Clock => CLOCK, ENABLE => EN125, D => MulOut12, Q => registerout1);
	register2 : clock_controlled_register port map(Clock => CLOCK, ENABLE => EN125, D => AddOut34, Q => registerout2);
	register3 : clock_controlled_register port map(Clock => CLOCK, ENABLE => EN346, D => AddOut34, Q => registerout3);
	register4 : clock_controlled_register port map(Clock => CLOCK, ENABLE => EN346, D => MulOut12, Q => registerout4);
	register5 : clock_controlled_register port map(Clock => CLOCK, ENABLE => EN125, D => XorOut1234, Q => registerout5);
	register6 : clock_controlled_register port map(Clock => CLOCK, ENABLE => EN346, D => XorOut1234, Q => registerout6);
	register7 : clock_controlled_register port map(Clock => CLOCK, ENABLE => EN78, D => MulOut12, Q => registerout7);
	register8 : clock_controlled_register port map(Clock => CLOCK, ENABLE => EN78, D => AddOut34, Q => registerout8);
	
	Y1_TRAFO <= registerout1;
	Y2_TRAFO <= registerout2;
	Y3_TRAFO <= registerout3;
	Y4_TRAFO <= registerout4;
	
end Structural;
