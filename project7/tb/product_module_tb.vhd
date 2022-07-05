-- product module testbench
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity product_module_tb is
--  Port ( );
end product_module_tb;

architecture Behavioral of product_module_tb is

component product_module is
    port(
        clk : in std_logic;
        load : in std_logic;
        shift_r : in std_logic;
        reset : in std_logic;
        datain : in std_logic_vector(8 downto 0);
        --
        dataout : out std_logic_vector(15 downto 0)
    );
end component;
 --input signals - with initial values
    signal clk,load,shift_r,reset : std_logic;
    signal datain : std_logic_vector(8 downto 0);
    --output signals
    signal dataout: std_logic_vector(15 downto 0);
begin

uut: product_module PORT MAP (
     clk => clk,
     load => load,
     shift_r => shift_r,
     reset => reset,
     datain => datain,
     dataout => dataout );
     
      -- Stimulus process
    clock_process :process
     begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
     end process;
     
 -- Stimulus process
     stim_proc: process
     begin
     -- insert stimulus here
     load <= '0';
     shift_r <= '0';
     reset <= '0';
     datain <= "000000001";
     wait for 21 ns;
     load <= '1';
     shift_r <= '1';
      reset <= '0';
     datain <= "000100101";
     wait for 21 ns;
     load <= '0';
     shift_r <= '1';
     reset <= '0';
     datain <= "000000100";
     wait for 21 ns;
     load <= '1';
     shift_r <= '1';
     reset <= '1';
     datain <= "000010010";
     wait for 21 ns;
     load <= '0';
     shift_r <= '1';
     reset <= '0';
     datain <= "010010101";
     wait for 21 ns;
     load <= '1';
     shift_r <= '1';
     reset <= '0';
     datain <= "010011101";
     wait for 21 ns;
            
     --wait;
    wait;
         
    end process;


end Behavioral;
