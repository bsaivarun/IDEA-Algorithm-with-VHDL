--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:48:20 06/07/2017
-- Design Name:   
-- Module Name:   C:/Users/brahm/OneDrive/MSCE Plan/Lab/VHDL/submission_template/submit/rcs1/tb_clock_controlled_register.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clock_controlled_register
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
 
ENTITY tb_clock_controlled_register IS
END tb_clock_controlled_register;
 
ARCHITECTURE behavior OF tb_clock_controlled_register IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clock_controlled_register
    PORT(
         CLOCK : IN  std_logic;
         ENABLE : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock_controlled_register PORT MAP (
          CLOCK => CLOCK,
          ENABLE => ENABLE,
          D => D,
          Q => Q
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
		ENABLE <= '1';
      wait for CLOCK_period*10; 
		D <= x"0000";
		wait for CLOCK_period*10;
		ENABLE <= '0';
      wait for CLOCK_period*10;
		D <= x"1234";
		wait for CLOCK_period*10;
		ENABLE <= '1';
      wait for CLOCK_period*10;
		D <= x"5678";
      wait;
   end process;

END;
