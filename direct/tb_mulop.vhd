--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:21:27 05/25/2017
-- Design Name:   
-- Module Name:   C:/Users/brahm/OneDrive/MSCE Plan/Lab/VHDL/submission_template/submit/direct/tb_mulop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mulop
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
 
ENTITY tb_mulop IS
END tb_mulop;
 
ARCHITECTURE behavior OF tb_mulop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mulop
    PORT(
         X : IN  std_logic_vector(15 downto 0);
         Y : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(15 downto 0) := (others => '0');
   signal Y : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mulop PORT MAP (
          X => X,
          Y => Y,
          Z => Z
        );

process
   begin
		
		-- Test 1
		
		X <= x"0000";
		Y <= x"0000";
		
		wait for 10 ns;
		--Test 2
		
		X <= x"0001";
		Y <= x"0000";
		wait for 10 ns;
		
		--Test 3
		X <= x"0001";
		Y <= x"0001";
		wait for 10 ns;
				
		--Test 4
		X <= x"0003";
		Y <= x"0001";
		wait for 10 ns;
		
		--Test 5
		X <= x"0003";
		Y <= x"0003";
		wait for 10 ns;
		
		--Test 6
		X <= x"7fff";
		Y <= x"0003";
		wait for 10 ns;
		
		--Test 7
		X <= x"7fff";
		Y <= x"7fff";
		wait for 10 ns;
		
		--Test 8
		X <= x"ffff";
		Y <= x"7fff";
		wait for 10 ns;
		
		--Test 9
		X <= x"ffff";
		Y <= x"ffff";
		wait for 10 ns;
		
		--Test 10
		X <= x"8000";
		Y <= x"ffff";
		wait for 10 ns;
		
		--Test 11
		X <= x"8000";
		Y <= x"8000";
		wait for 10 ns;
		
   end process;

END;
