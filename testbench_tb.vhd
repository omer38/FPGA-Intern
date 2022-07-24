library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity example_tb is -- testbench top declaration
--  Port ( );
end example_tb;

architecture Behavioral of example_tb is   
    -- Component Declaration for the Unit Under Test (UUT)
    component example is
	port(
	   clk : in std_logic;
		inp1 : in std_logic_vector(2 downto 0);
		--
		out1    : out std_logic 
	
	);
end component;
    
    --input signals - with initial values
    signal inp1 : std_logic_vector(2 downto 0);
    signal clk : std_logic;
    --output signals
    signal out1: std_logic;
    
begin
    
     uut: example PORT MAP (
     inp1 => inp1,
     clk => clk,
     out1 => out1 );
     
       -- Stimulus process
    clock_process :process
     begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
    end process;

  -- Stimulus process
stim_proc: process
begin        
    inp1 <= "001";
    wait for 21 ns; 
    inp1 <= "100";
    wait for 21 ns; 
    wait;
    end process;

end Behavioral;
