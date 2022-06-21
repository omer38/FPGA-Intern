
-- 4-bit RCA Top Module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA is
	port(
		in1 : in std_logic_vector(3 downto 0);
		in2 : in std_logic_vector(3 downto 0);
		--
		sum : out std_logic_vector(3 downto 0)
	
	);
end RCA;

architecture behavioral of RCA is

component halfadder
port(
		x : in std_logic;
		y : in std_logic;
		--
		sum : out std_logic;
		cout: out std_logic
	
	);
end component;

component fulladder
port(
		x : in std_logic;
		y : in std_logic;
		cin: in std_logic;
		--
		sum : out std_logic;
		cout: out std_logic	
	);
end component;

signal carry : std_logic_vector(3 downto 0);
begin

HA0 : halfadder port map(
					x => in1(0),
					y => in2(0),
					sum => sum(0),
					cout =>carry(0)
				);

FA1 : fulladder port map(
					x => in1(1),
					y => in2(1),
					cin=>carry(0),
					sum => sum(1),
					cout =>carry(1)
				);

FA2 : fulladder port map(
					x => in1(2),
					y => in2(2),
					cin=>carry(1),
					sum => sum(2),
					cout =>carry(2)
				);

FA3 : fulladder port map(
					x => in1(3),
					y => in2(3),
					cin=>carry(2),
					sum => sum(3),
					cout =>carry(3)
				);

end architecture;