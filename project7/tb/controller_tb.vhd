library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity controllerTb is -- testbench top declaration
--  Port ( );
end controllerTb;

architecture Behavioral of controllerTb is   
    -- Component Declaration for the Unit Under Test (UUT)
    component controller is
	port(
	    -- inputs
		start : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		-- output
		load_multiplier : out std_logic;
		shift_multiplier : out std_logic;
		load_multiplicand : out std_logic;
	    reset_product : out std_logic;
	    load_product : out std_logic;
	    shift_product : out std_logic;
	    ready          : out std_logic
	);
end component;
    
    --input signals - with initial values
    signal clk : std_logic := '0';
    signal reset,start: std_logic := '0';
    --output signals
    signal load_multiplier,shift_multiplier,load_multiplicand,reset_product,load_product,shift_product,ready: std_logic;
    
begin
    
     uut: controller PORT MAP (
     clk => clk,
     reset => reset,
     start => start,
     load_multiplier => load_multiplier,
     shift_multiplier => shift_multiplier,
     load_multiplicand => load_multiplicand,
     reset_product => reset_product,
     load_product => load_product,
     shift_product => shift_product,
     ready => ready );
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
     start <= '0';
    wait for 21 ns;    
     reset <= '0';
     start <= '1';
    wait for 21 ns;
    reset <= '0';
     start <= '0';
    wait for 21 ns;
    reset <= '0';
     start <= '0';
    wait for 21 ns;
    reset <= '0';
     start <= '1';
    wait for 21 ns;
    reset <= '1';
     start <= '0';
    wait for 21 ns;
    reset <= '0';
     start <= '1';
    wait for 21 ns;
     reset <= '0';
     start <= '0';
    wait for 21 ns;
    wait;
    end process;


end Behavioral;
