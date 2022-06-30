library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity pattern_recog_tb is -- testbench top declaration
--  Port ( );
end pattern_recog_tb;

architecture Behavioral of pattern_recog_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component pattern_recog
        port(
		clk : in std_logic;
		datain : in std_logic;
		--
		dataout    : out std_logic
	);
    end component; 
    
    --input signals - with initial values
    signal clk : std_logic := '0';
    signal datain: std_logic;
    --output signals
    signal dataout: std_logic;
    
begin
    
     uut: pattern_recog PORT MAP (
     clk => clk,
     datain => datain,
     dataout => dataout );
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
    datain <= '1';
    wait for 21 ns;    
    datain <= '0';
    wait for 21 ns;
    datain <= '1';
    wait for 21 ns;
    datain <= '1';
    wait for 21 ns;
    datain <= '0';
    wait for 21 ns;
     datain <= '1';
    wait for 21 ns; 
    datain <= '0';
    wait for 21 ns;
    datain <= '1';
    wait for 21 ns;
    datain <= '1';
    wait for 21 ns; 
     datain <= '0';
    wait for 21 ns;
     datain <= '0';
    wait for 21 ns; 
     datain <= '1';
    wait for 21 ns;
    datain <= '1';
    wait for 21 ns;
    datain <= '0';
    wait for 21 ns;
     datain <= '1';
    wait for 21 ns; 
    datain <= '0';
    wait for 21 ns;
    datain <= '1';
    wait for 21 ns;
    datain <= '1';
    wait for 21 ns; 
     datain <= '1';
    wait for 21 ns;
     datain <= '1';
    wait for 21 ns;
    datain <= '0';
    wait for 21 ns;
   wait;
end process;


end Behavioral;
