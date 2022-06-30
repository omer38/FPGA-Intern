-- Counter Module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
	port(
		clk : in std_logic;
		reset : in std_logic;
		sw    : in std_logic;
		leds: out std_logic_vector(7 downto 0)
	);
end counter;


architecture behavioral of counter is

component Adder is
generic(n : integer := 8);
	port(
		A : in std_logic_vector(n-1 downto 0);
		B : in std_logic_vector(n-1 downto 0);
		cntlast : in std_logic;
		cout : out std_logic;
		D : out std_logic_vector(n-1 downto 0)
		
	);
end component;

signal counter : std_logic_vector(7 downto 0) := "00000000";
signal result: std_logic_vector(7 downto 0);
signal cout : std_logic;

begin 
Add : Adder generic map(n => 8)
			port map(
            A => counter ,
            B => "00000001",
			cntlast => sw,
            D => result,
            cout => cout
            );
process(clk)
begin

if rising_edge(clk) then
if (reset = '0') then
            counter <= result;

if (reset = '1') then
	   counter <= "00000000";
	end if;
end if;
end if;
end process;


leds <= counter;

end architecture;
