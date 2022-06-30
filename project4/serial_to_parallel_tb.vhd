library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity serial_to_parallel_tb is -- testbench top declaration
--  Port ( );
end serial_to_parallel_tb;

architecture Behavioral of serial_to_parallel_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component serial_to_parallel
     port(
	a : in std_logic;
	clk : in std_logic;
	start : in std_logic;
	ready : out std_logic;
	out_p : out std_logic_vector(7 downto 0)
);
    end component; 
    
    --input signals - with initial values
    signal clk,start : std_logic := '0';
    signal a: std_logic;
    --output signals
    signal ready : std_logic;
    signal out_p: std_logic_vector(7 downto 0);
    
begin
    
     uut: serial_to_parallel PORT MAP (
     clk => clk,
     a => a,
     start => start,
     ready => ready,
     out_p => out_p );
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
    a <= '1';
    start <= '0';
    wait for 21 ns;    
    a <= '1';
    start <= '1';
    wait for 21 ns;
    a <= '0';
    start <= '0';
    wait for 21 ns;
    a <= '0';
    start <= '0';
    wait for 21 ns;
    a <= '0';
    start <= '0';
    wait for 21 ns;
    a <= '1';
    start <= '0';
    wait for 21 ns;
    a <= '0';
    start <= '0';
    wait for 21 ns;
    a <= '1';
    start <= '0';
    wait for 21 ns;
    a <= '0';
    start <= '1';
    wait for 21 ns;
    a <= '1';
    start <= '1';
    wait for 21 ns;
    a <= '0';
    start <= '0';
    wait for 21 ns;
    a <= '1';
    start <= '0';
    wait for 21 ns;
    a <= '0';
    start <= '0';
    wait for 21 ns;
    a <= '1';
    start <= '0';
    wait for 21 ns;
    a <= '1';
    start <= '0';
    wait for 20 ns;
    a <= '1';
    start <= '0';
    wait for 20 ns;
    a <= '0';
    start <= '0';
    wait for 20 ns;
    a <= '0';
    start <= '0';
    wait for 20 ns;
    
   wait;
end process;


end Behavioral;

