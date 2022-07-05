library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity multiplier_tb is -- testbench top declaration
--  Port ( );
end multiplier_tb;

architecture Behavioral of multiplier_tb is
    
    -- Component Declaration for the Unit Under Test (UUT)
    component multiplier
        port(
		clk : in std_logic;
		load : in std_logic;
		shift_r : in std_logic;
		datain : in std_logic_vector(7 downto 0);
		--
		dataout : out std_logic -- multiplier(0)'ı çıkışa verecek 
	);
    end component; 
    
    --input signals - with initial values
    signal clk,load,shift_r : std_logic;
    signal datain : std_logic_vector(7 downto 0);
    --output signals
    signal dataout: std_logic := '0';
    
begin
    
     uut: multiplier PORT MAP (
     clk => clk,
     load => load,
     shift_r => shift_r,
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
     -- insert stimulus here
     load <= '0';
     shift_r <= '0';
     datain <= "00000000";
     wait for 21 ns;
     load <= '1';
     shift_r <= '1';
     datain <= "00010010";
     wait for 21 ns;
     load <= '0';
     shift_r <= '1';
     datain <= "00000010";
     wait for 21 ns;
     load <= '1';
     shift_r <= '1';
     datain <= "00001001";
     wait for 21 ns;
     load <= '0';
     shift_r <= '1';
     datain <= "01001010";
     wait for 21 ns;
            
     --wait;
    finish(0);
         
    end process;


end Behavioral;
