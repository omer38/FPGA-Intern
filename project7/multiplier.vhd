-- multiplier module

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity multiplier is
	port(
		clk : in std_logic;
		load_m : in std_logic;
		shift_r_m : in std_logic;
		datain : in std_logic_vector(7 downto 0);
		--
		dataout_m : out std_logic -- multiplier(0)'ı çıkışa verecek 
	);
end multiplier;

architecture Behavioral of multiplier is

signal a_reg : std_logic_vector(7 downto 0);

begin

a_reg <= std_logic_vector(unsigned(datain) srl 1) when shift_r_m = '1' 
        else  datain;
        
process(clk) begin
	if rising_edge(clk) then
		if load_m = '1' then
		    dataout_m <= a_reg(0);
		end if;
	end if;
end process;

end Behavioral;
