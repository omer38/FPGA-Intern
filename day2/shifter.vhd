--Shift Operators
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity shifter is
	generic(n: integer := 3;
	       k : integer := 8
	);
	port(
		A : in std_logic_vector(k-1 downto 0);-- shift yapılacak
		CNT : in std_logic; -- shift direction ( 0 left, 1 right) logical left-right
		B : in std_logic_vector(n-1 downto 0); -- shift amount
		--
		D : out std_logic_vector(k-1 downto 0)-- shift edilen
		
	);
end shifter;

architecture behavioral of shifter is

begin

process(CNT,B)
begin

if (CNT = '0') then 
	D <= std_logic_vector(unsigned(A) sll to_integer(unsigned(B)));
elsif (CNT = '1') then 
	D <= std_logic_vector(unsigned(A) srl to_integer(unsigned(B)));
else
	D <= A;
end if;
end process;

end architecture;
