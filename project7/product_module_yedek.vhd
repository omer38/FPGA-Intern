-- product module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity product_module is
    port(
        clk : in std_logic;
        load_p : in std_logic;
        shift_r_p : in std_logic;
        reset_p : in std_logic;
        datain_p : in std_logic_vector(8 downto 0);
        --
        dataout : out std_logic_vector(15 downto 0)
    );
end product_module;

architecture Behavioral of product_module is

signal product_register : std_logic_vector(16 downto 0):= "00000000000000000";
signal data_reg1 : std_logic_vector(16 downto 0);
begin

data_reg1 <= std_logic_vector(unsigned(product_register) srl 1) when shift_r_p = '1' else
             product_register;       

product_register(16 downto 8) <= datain_p;
                
process(clk,reset_p,load_p) begin
if reset_p = '1' then
    dataout <= "0000000000000000";
else
    if rising_edge(clk) then
        if load_p = '1' then
           dataout <= data_reg1(15 downto 0);
        end if;
    end if;
end if;
end process;

end Behavioral;
