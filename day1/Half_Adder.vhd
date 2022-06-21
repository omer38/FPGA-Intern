--Half Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is
	port(
		x : in std_logic;
		y : in std_logic;
		--
		sum : out std_logic;
		cout: out std_logic
	
	);
end halfadder;

architecture rtl of halfadder is
begin

sum <= x xor y;
cout<= x and y;

end architecture;