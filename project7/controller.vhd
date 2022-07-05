-- controller module

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity controller is
	port(
		clk : in std_logic;
		reset : in std_logic;
		start : in std_logic;
		--
		load_multiplier : out std_logic;
		load_multiplicand : out std_logic;
		load_product : out std_logic;
		shift_multiplier : out std_logic;
		shift_product : out std_logic;
		reset_product : out std_logic;
		ready 		: out std_logic
	);
end controller;

architecture Behavioral of controller is

type states is (s0,s1,s2,s3);
signal cs : states;
signal ns : states;
signal next_counter : std_logic_vector(3 downto 0);
signal loop_counter : std_logic_vector(3 downto 0) := "0000";
constant c_max_counter : integer := 7;

begin

-- moore model outputs
load_multiplier <= '1' when cs = s0 else '0';
load_multiplicand <= '1' when cs = s0 else '0';
reset_product <= '1' when cs = s0 else '0';

loop_counter <= "0000" when cs = s0 else
                next_counter;
                
load_product <= '1' when cs = s1 else '0';

shift_multiplier <= '1' when cs = s2 else '0';
shift_product <= '1' when cs = s2 else '0';

ready <= '1' when cs = s3 else '0';

process(clk) begin
if rising_edge(clk)then
    if cs = s1 then
    next_counter <= loop_counter + x"1";
    else
    next_counter <= loop_counter;
    end if;
end if;
end process;
    
-- next state register
process(clk) begin
if rising_edge(clk) then
    if reset = '1' then
		cs <= s0;
	else
	   cs <= ns;
	end if;
end if;
end process;

-- state transition
process(start,cs,ns,loop_counter,reset) begin
case cs is
			when s0 =>
				if start = '1' then
					ns<= s1;
				else 
					ns<= s0;
				end if;
				
			when s1 =>
				ns<= s2;
				
			when s2 =>	
				if loop_counter = c_max_counter then
					ns<= s3;
				else
					ns<= s1;
				end if;
		    when s3 =>
				ns<= s0;
		end case;
end process;


end Behavioral;

