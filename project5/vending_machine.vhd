-- project 5 vending_machine 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity vending_machine is
	port(
	    clk : in std_logic;
		para : in std_logic_vector(2 downto 0); -- (1tl,50kr,25kr)
		--
		su   : out std_logic
	
	);
end vending_machine;

architecture Behavioral of vending_machine is
type states is (s0,s25,s50,s75,s1);
signal cs : states;

begin

-- output combinations
su <= '1' when cs = s1
		else '0';
		
--state transitions
process(clk) begin
        if rising_edge(clk) then
		case cs is
			when s0 =>
				if para = "100" then
					cs <= s1;
					
				elsif para = "010" then
					cs <= s50;
					
				elsif para = "001" then
					cs <= s25;	
					
				end if;
			when s25 =>
				if para = "100" then
					cs <= s1;
					
				elsif para = "010" then
					cs <= s75;
					
				elsif para = "001" then
					cs <= s50;
					
				end if;	
			when s50 =>
				if para = "100" then
					cs <= s1;
					
				elsif para = "010" then
					cs <= s1;
					
				elsif para = "001" then
					cs <= s75;
					
				end if;
			when s75 =>
				if para = "100" then
					cs <= s1;
					
				elsif para = "010" then
					cs <= s1;
					
				elsif para = "001" then
					cs <= s1;
				end if;
			when s1 =>
			     if para = "100" then
					cs <= s0;
					
				elsif para = "010" then
					cs <= s50;
					
				elsif para = "001" then
					cs <= s25;		     				
				end if;
			end case;
end if;
end process;


end Behavioral;
