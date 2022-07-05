library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity and_module_tb is -- testbench top declaration
--  Port ( );
end and_module_tb;

architecture Behavioral of and_module_tb is
    
    -- Component Declaration for the Unit Under Test (UUT)
    component and_module
        Port ( in1 : in STD_LOGIC;
               in2 : in STD_LOGIC_vector(7 downto 0);
               --
               output : out STD_LOGIC_vector(7 downto 0));
    end component; 
    
    --input signals - with initial values
    signal in1 : std_logic;
    signal in2 : std_logic_vector(7 downto 0);
    --output signals
    signal output: std_logic_vector(7 downto 0);
    
begin
    
     uut: and_module PORT MAP (
     in1 => in1,
     in2 => in2,
     output => output );
    
     -- Stimulus process
     stim_proc: process
     begin
        
         -- insert stimulus here
            in1 <= '0';
            in2 <= "00010001";
            wait for 10 ns;
            in1 <= '1';
            in2 <= "01010101";
            wait for 10 ns;
            in1 <= '1';
            in2 <= "10010110";
            wait for 10 ns;
            in1 <= '0';
            in2 <= "01010000";
            wait for 10 ns;
         --wait;
         finish(0);
         
    end process;


end Behavioral;
