library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity parallel_to_serial_tb is -- testbench top declaration
--  Port ( );
end parallel_to_serial_tb;

architecture Behavioral of parallel_to_serial_tb is   
    -- Component Declaration for the Unit Under Test (UUT)
    component parallel_to_serial is
        port(
		clk    : in std_logic;
		datain : in std_logic_vector(7 downto 0);
		load   : in std_logic;
		--
		dataout : out std_logic
	);
end component;
    
    --input signals - with initial values
    signal clk,load : std_logic;
    signal datain : std_logic_vector(7 downto 0);
    --output signals
    signal dataout: std_logic;
    
begin
    
     uut: parallel_to_serial PORT MAP (
     clk => clk,
     load => load,
     datain => datain,
     dataout => dataout);
     
       -- Stimulus process
    clock_process :process
     begin
     clk <= '0';
     wait for 5 ns;
     clk <= '1';
     wait for 5 ns;
    end process;

  -- Stimulus process
stim_proc: process
begin        
    load <= '0';
    datain <= "00010010";
    wait for 10 ns;
    load <= '0';
    datain <= "00010010";
    wait for 10 ns;
    load <= '1';
    datain <= "10110010";
    wait for 10 ns;
    load <= '0';
    datain <= "01011010";
    
    wait;
    end process;

end Behavioral;
