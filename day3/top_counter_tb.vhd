library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_counter_tb is
end top_counter_tb;

architecture Behavioral of top_counter_tb is

component top_counter 
port(
		clk : in std_logic;
		reset : in std_logic;
		sw    : in std_logic;
		button : in std_logic;
		leds: out std_logic_vector(7 downto 0)
	);
end component;

signal reset,clk,sw,button: std_logic;
signal counter:std_logic_vector(7 downto 0);

begin
dut: top_counter port map 
                        (clk => clk,
                         RESET=>reset, 
                         sw => sw,
                         button=>button, 
                         leds => counter 
                         );
   -- Clock process definitions
clock_process :process
begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
end process;

button_process :process
begin
     button <= '0';
     wait for 50 ns;
     button <= '1';
     wait for 50 ns;
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
