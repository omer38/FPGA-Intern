-- RCA Module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder is
	generic(n : integer := 8);
	port(
		A : in std_logic_vector(n-1 downto 0);
		B : in std_logic_vector(n-1 downto 0);
		cntlast : in std_logic;
		cout : out std_logic;
		D : out std_logic_vector(n-1 downto 0)
		
	);
end Adder;

architecture behavioral of Adder is

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

signal carry : std_logic_vector(n downto 0);

signal i : std_logic_vector(n-1 downto 0);

begin

carry(0) <= cntlast;

iFor : for j in 0 to n-1 generate
		i(j) <= B(j) xor cntlast;
		end generate;

FA  : for k in 0 to n-1 generate
		FA_k : fulladder port map(
					x=>A(k),
					y=>i(k),
					cin=>carry(k),
					sum=>D(k),
					cout=>carry(k+1)
		);
		end generate;
		
cout <= carry(n);

end architecture;
