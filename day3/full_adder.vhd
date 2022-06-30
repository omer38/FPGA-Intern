-- Full Adder Module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
	port(
		x : in std_logic;
		y : in std_logic;
		cin: in std_logic;
		--
		sum : out std_logic;
		cout: out std_logic	
	);
end fulladder;

architecture rtl of fulladder is
begin

sum <= x xor y xor cin;
cout<= (x and y)or (x and cin) or (y and cin);

end architecture;
