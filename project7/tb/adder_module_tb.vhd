library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity Adder_module_tb is -- testbench top declaration
--  Port ( );
end Adder_module_tb;

architecture Behavioral of Adder_module_tb is
    
    -- Component Declaration for the Unit Under Test (UUT)
    component Adder_module
        Port ( in1 : in STD_LOGIC_vector(7 downto 0);
               in2 : in STD_LOGIC_vector(7 downto 0);
               cin : in std_logic;
               --
               cout : inout std_logic;
               output : out STD_LOGIC_vector(8 downto 0));
    end component; 
    
    --input signals - with initial values
    signal in1,in2 : std_logic_vector(7 downto 0) := (others=>'0');
    signal cin : std_logic := '0';
    --output signals
    signal cout : std_logic;
    signal output: std_logic_vector(8 downto 0);
    
begin
    
     uut: Adder_module PORT MAP (
     in1 => in1,
     in2 => in2,
     cin => cin,
     cout => cout,
     output => output );
    
     -- Stimulus process
     stim_proc: process
     begin
        
         -- insert stimulus here
      SUM:  for i in 0 to 63 loop
            for j in 0 to 63 loop
            in1 <= std_logic_vector(to_unsigned(i,8));
            in2 <= std_logic_vector(to_unsigned(j,8));
            wait for 10 ns;
            end loop;
         end loop;
  
         --wait;
         finish(0);
         
		 
    end process;


end Behavioral;
