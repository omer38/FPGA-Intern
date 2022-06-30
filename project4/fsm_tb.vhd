library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity fsm_tb is -- testbench top declaration
--  Port ( );
end fsm_tb;

architecture Behavioral of fsm_tb is   
    -- Component Declaration for the Unit Under Test (UUT)
    component fsm is
	port(
	    -- inputs
		a : in std_logic;
		b : in std_logic;
		d : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		-- output
		x : out std_logic
	);
end component;
    
    --input signals - with initial values
    signal clk : std_logic := '0';
    signal reset,a,b,d: std_logic := '0';
    --output signals
    signal x: std_logic;
    
begin
    
     uut: fsm PORT MAP (
     clk => clk,
     reset => reset,
     a => a,
     b => b,
     d => d,
     x => x );
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
     reset <= '1';
     a <= '0';
     b <= '0';
     d <= '0';
    wait for 21 ns;    
    reset <= '0';
     a <= '0';
     b <= '0';
     d <= '0';
    wait for 21 ns;
    reset <= '0';
     a <= '0';
     b <= '0';
     d <= '1';
    wait for 21 ns; 
    reset <= '0';
     a <= '0';
     b <= '1';
     d <= '1';
    wait for 21 ns; 
    reset <= '0';
     a <= '1';
     b <= '0';
     d <= '0';
    wait for 21 ns; 
    reset <= '0';
     a <= '1';
     b <= '0';
     d <= '1';
    wait for 21 ns; 
    reset <= '0';
     a <= '1';
     b <= '1';
     d <= '0';
    wait for 21 ns; 
    reset <= '0';
     a <= '1';
     b <= '1';
     d <= '1';
    wait for 21 ns;     
    wait;
    end process;


end Behavioral;
