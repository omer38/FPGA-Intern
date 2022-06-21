library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity RCA_tb is -- testbench top declaration
--  Port ( );
end RCA_tb;

architecture Behavioral of RCA_tb is
    
    -- Component Declaration for the Unit Under Test (UUT)
    component RCA
        Port ( in1 : in STD_LOGIC_vector(3 downto 0);
               in2 : in STD_LOGIC_vector(3 downto 0);
               --
               sum : out STD_LOGIC_vector(3 downto 0));
    end component; 
    
    --input signals - with initial values
    signal in1,in2 : std_logic_vector(3 downto 0) := (others=>'0');
    --output signals
    signal Sum: std_logic_vector(3 downto 0);
    
begin
    
     uut: RCA PORT MAP (
     in1 => in1,
     in2 => in2,
     sum => sum );
    
     -- Stimulus process
     stim_proc: process
     begin
        
         -- insert stimulus here
      SUM:  for i in 0 to 15 loop
            for j in 0 to 15 loop
            in1 <= std_logic_vector(to_unsigned(i,4));
            in2 <= std_logic_vector(to_unsigned(j,4));
            wait for 10 ns;
            end loop;
         end loop;
  
         --wait;
         finish(0);
         
		 
		 -- insert stimulus here
         --A <= (0=>'1',1=>'1',others=>'0');
         --B <= (2=>'1',0=>'1',others=>'0');
         --Cin <= '0';
         --wait for 10 ns;
         
         --A <= x"3"; -- Writing a value as hexadecimal
         --B <= x"9";
         --Cin <= '0';
         --wait for 10 ns;
		 
		 
    end process;


end Behavioral;
