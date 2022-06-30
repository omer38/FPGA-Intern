library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity counter_tb is -- testbench top declaration
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is

 constant ClockFrequency: integer := 10e6; -- 10 MHz
 constant    ClockPeriod: time := 1 sec / ClockFrequency;
    
    -- Component Declaration for the Unit Under Test (UUT)
    component counter
        port(
		clk : in std_logic;
		reset : in std_logic;
		sw    : in std_logic;
		leds: out std_logic_vector(7 downto 0)
	);
    end component; 
    
    --input signals - with initial values
    signal clk : std_logic := '0';
    signal reset,sw: std_logic;
    --output signals
    signal leds: std_logic_vector(7 downto 0);
    
begin
    
     uut: counter PORT MAP (
     clk => clk,
     reset => reset,
     sw => sw,
     leds => leds );
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
   -- hold reset state for 100 ns.
     reset <= '1';
   sw <= '1';
    wait for 20 ns;    
    reset <= '0';
  wait for 300 ns;    
  sw <= '0';
   wait;
end process;


end Behavioral;
