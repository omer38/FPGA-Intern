library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;
use ieee.numeric_std.all;

entity vending_machine_tb is -- testbench top declaration
--  Port ( );
end vending_machine_tb;

architecture Behavioral of vending_machine_tb is   
    -- Component Declaration for the Unit Under Test (UUT)
    component vending_machine is
	port(
	   clk : in std_logic;
		para : in std_logic_vector(2 downto 0); -- (1tl,50kr,25kr)
		--
		su    : out std_logic 
	
	);
end component;
    
    --input signals - with initial values
    signal para : std_logic_vector(2 downto 0);
    signal clk : std_logic;
    --output signals
    signal su: std_logic;
    
begin
    
     uut: vending_machine PORT MAP (
     para => para,
     clk => clk,
     su => su );
     
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
    para <= "001";
    wait for 10 ns; 
     para <= "100";
    wait for 10 ns; 
     para <= "001";
    wait for 10 ns; 
     para <= "010";
    wait for 10 ns; 
     para <= "010";
    wait for 10 ns; 
     para <= "001";
    wait for 10 ns; 
     para <= "010";
    wait for 10 ns; 
     para <= "100";
    wait for 10 ns; 
     para <= "010";
    wait for 10 ns; 
     para <= "001";
    wait for 10 ns;   
     para <= "100";
    wait for 10 ns; 
      para <= "010";
    wait for 10 ns;
     para <= "010";
    wait for 10 ns;
     para <= "010";
    wait for 10 ns;
    wait;
    end process;

end Behavioral;
