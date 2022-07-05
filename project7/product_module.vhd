library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity product_module is
    Port (clk, load_p, shift_r_p, reset_p: in std_logic;
          datain_p: in std_logic_vector (8 downto 0);
          dataout: out std_logic_vector (15 downto 0) := (others => '0'));
end product_module;

architecture Behavioral of product_module is
    signal input: std_logic_vector (16 downto 0) := (others => '0');
    
begin    
    dataout <= input(15 downto 0);
    
    process(clk)
    begin
        if rising_edge(clk) then
            if reset_p = '0' then
                input <= (others => '0');
            elsif load_p = '1' then            
                input(16 downto 8) <= datain_p;
            elsif shift_r_p = '1' then
                input(15 downto 0) <= input (16 downto 1);
            end if;
        end if;
    end process;
end Behavioral;
