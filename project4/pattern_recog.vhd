-- pattern recognition
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pattern_recog is
	port(
		clk : in std_logic;
		datain : in std_logic;
		-- 
		dataout : out std_logic
	);
end pattern_recog;

architecture behavioral of pattern_recog is

type states is (s0,s1,s2,s3,s4,s5,s6,s7);
signal cs : states;

begin
-- output function
dataout <= '1' when (cs = s7)
			else '0';

-- state transitions
process(clk)
begin
if rising_edge(clk) then
	case cs is 
		when s0 =>
			if datain = '0' then
				cs <= s0;
			else
				cs <= s1;
			end if;
		when s1 =>
			if datain = '0' then
				cs <= s0;
			else
				cs <= s2;
			end if;
		when s2 =>
			if datain = '0' then
				cs <= s3;
			else
				cs <= s2;
			end if;
		when s3 =>
			if datain = '0' then
				cs <= s0;
			else
				cs <= s4;
			end if;
		when s4 =>
			if datain = '0' then
				cs <= s5;
			else
				cs <= s2;
			end if;
		when s5 =>
			if datain = '0' then
				cs <= s0;
			else
				cs <= s6;
			end if;
		when s6 =>
			if datain = '0' then
				cs <= s0;
			else
				cs <= s7;
			end if;
		when s7 =>
			if datain = '0' then
				cs <= s0;
			else
				cs <= s0;
			end if;
		when others => cs <= s0;
		
		end case;
	end if;
end process;

end architecture;
