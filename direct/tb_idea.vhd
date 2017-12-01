--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:28:00 05/26/2017
-- Design Name:   
-- Module Name:   C:/Users/brahm/OneDrive/MSCE Plan/Lab/VHDL/submission_template/submit/direct/tb_idea.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: idea
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
 
ENTITY tb_idea IS
END tb_idea;
 
ARCHITECTURE behavior OF tb_idea IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT idea
    PORT(
         KEY : IN  std_logic_vector(127 downto 0);
         A1 : IN  std_logic_vector(15 downto 0);
         A2 : IN  std_logic_vector(15 downto 0);
         A3 : IN  std_logic_vector(15 downto 0);
         A4 : IN  std_logic_vector(15 downto 0);
         B1 : OUT  std_logic_vector(15 downto 0);
         B2 : OUT  std_logic_vector(15 downto 0);
         B3 : OUT  std_logic_vector(15 downto 0);
         B4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal A1 : std_logic_vector(15 downto 0) := (others => '0');
   signal A2 : std_logic_vector(15 downto 0) := (others => '0');
   signal A3 : std_logic_vector(15 downto 0) := (others => '0');
   signal A4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal B1 : std_logic_vector(15 downto 0);
   signal B2 : std_logic_vector(15 downto 0);
   signal B3 : std_logic_vector(15 downto 0);
   signal B4 : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: idea PORT MAP (
          KEY => KEY,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          A4 => A4,
          B1 => B1,
          B2 => B2,
          B3 => B3,
          B4 => B4
        );

process
   begin

		--Test
		KEY <= x"00010002000300040005000600070008";
		A1 <= x"1111";
		A2 <= x"2222";
		A3 <= x"4444";
		A4 <= x"8888";
		wait for 10 ns;

   end process;


END;
