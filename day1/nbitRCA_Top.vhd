-- n-bit RCA Top Module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA is
	generic (n: integer:= 4);
	port(
		in1 : in std_logic_vector(n-1 downto 0);
		in2 : in std_logic_vector(n-1 downto 0);
		--
		sum : out std_logic_vector(n-1 downto 0)
	
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

signal carry : std_logic_vector(n-1 downto 0);
begin

HA0 : halfadder port map(
					x => in1(0),
					y => in2(0),
					sum => sum(0),
					cout =>carry(0)
				);
				
FA: for i in 1 to n-1 generate
	FA_i: fulladder port map(
					x=>in1(i),
					y=>in2(i),
					cin=>carry(i-1),
					sum=>sum(i),
					cout=>carry(i)
					);
	end generate;

end architecture;