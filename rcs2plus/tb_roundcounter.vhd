--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:12:50 07/24/2017
-- Design Name:   
-- Module Name:   C:/Users/brahm/OneDrive/MSCE Plan/Lab/VHDL/submission_template/submit/rcs2/tb_roundcounter.vhd
-- Project Name:  idea_rcs2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: roundcounter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_roundcounter IS
END tb_roundcounter;
 
ARCHITECTURE behavior OF tb_roundcounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT roundcounter
    PORT(
         CLOCK : IN  std_logic;
         START : IN  std_logic;
         RESULT : IN  std_logic;
         READY : OUT  std_logic;
         S_i : OUT  std_logic;
         INIT : OUT  std_logic;
         TRAFO : OUT  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal START : std_logic := '0';
   signal RESULT : std_logic := '0';

 	--Outputs
   signal READY : std_logic;
   signal S_i : std_logic;
   signal INIT : std_logic;
   signal TRAFO : std_logic;
   signal ROUND : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: roundcounter PORT MAP (
          CLOCK => CLOCK,
          START => START,
          RESULT => RESULT,
          READY => READY,
          S_i => S_i,
          INIT => INIT,
          TRAFO => TRAFO,
          ROUND => ROUND
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		START <= '1';
      wait for CLOCK_period*10;
		START <= '0';
		wait for CLOCK_period;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
      wait for 100 ns;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
      wait for 100 ns;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
      wait for 100 ns;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
		wait for 100 ns;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
		wait for 100 ns;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
      wait for 100 ns;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
      wait for 100 ns;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
		wait for 100 ns;
		RESULT <= '1';
      wait for CLOCK_period;
		RESULT <= '0';
		wait;      
   end process;

END;

