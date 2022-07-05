-- multiplicand module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplicand_module is
    port(
        clk : in std_logic;
        load_md : in std_logic;
        datain_md : in std_logic_vector(7 downto 0);
        --
        multiplicand : out std_logic_vector(7 downto 0)
    );
end multiplicand_module;

architecture Behavioral of multiplicand_module is

signal m_reg : std_logic_vector(7 downto 0);

begin
m_reg <= datain_md;

process(clk) begin
	if rising_edge(clk) then
		if load_md = '1' then
		    multiplicand <= m_reg;
		end if;
	end if;
end process;

end Behavioral;
