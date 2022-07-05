-- Multiplier And module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_module is
	port(
		in_bit: in std_logic;
		in2 : in std_logic_vector(7 downto 0);
		--
		output_and : out std_logic_vector(7 downto 0)
	
	);
end and_module;
architecture behavioral of and_module is

signal output_reg : std_logic_vector(7 downto 0);

begin

output_reg(0) <= in_bit and in2(0);
output_reg(1) <= in_bit and in2(1);
output_reg(2) <= in_bit and in2(2);
output_reg(3) <= in_bit and in2(3);
output_reg(4) <= in_bit and in2(4);
output_reg(5) <= in_bit and in2(5);
output_reg(6) <= in_bit and in2(6);
output_reg(7) <= in_bit and in2(7);

output_and <= output_reg; -- testbench kontrol et bunun yerine direkt outputu andlere bağlayabilirsin

end architecture;
