-- project 4 question 1 diagram
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm is
	port(
	    -- inputs
		a : in std_logic;
		b : in std_logic;
		d : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		-- output
		x : out std_logic
	);
end fsm;

architecture behavioral of fsm is
type states is (state_a, state_b);
signal cs : states;--current state

begin

-- state transitions
process(clk) begin
	if rising_edge(clk) then
		if reset = '1' then
			cs <= state_a;
		end if;
		case cs is
			when state_a =>
				if d = '0' then
					cs <= state_a;
				elsif d = '1' then  
					cs <= state_b;
				end if;
			when state_b =>
				if d = '0' then
					cs <= state_b;
				elsif d = '1' then
					cs <= state_a;
				end if;
			end case;
	end if;
end process;

-- moore outputs of the states
x <= a when cs = state_a else b;

end architecture;
