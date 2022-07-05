-- Multiplier 8-bit adder module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_module is
	port(
		in1 : in std_logic_vector(7 downto 0);
		in2 : in std_logic_vector(7 downto 0);
		cin : in std_logic;
		cout : inout std_logic;
		output : out std_logic_vector(8 downto 0)
		
	);
end Adder_module;

architecture behavioral of Adder_module is

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

signal carry : std_logic_vector(8 downto 0);
signal D : std_logic_vector(7 downto 0);

begin

carry(0) <= '0';

FA  : for k in 0 to 7 generate
		FA_k : fulladder port map(
					x=>in1(k),
					y=>in2(k),
					cin=>carry(k),
					sum=>D(k),
					cout=>carry(k+1)
		);
		end generate;
		
cout <= carry(8);
output <= cout & D;

end architecture;
