--VHDL cheat sheet --

--Library and package declerations--------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
-- user defined packages
use work.package_myname.all;

-- Entity declerations--------------------------------------------------------------------------------
entity my_entity_name is
    generic( c_clkfreq : integer := 100_000_000;
            C_is_sum   : boolean := false;
            c_clkfreq_reg : std_logic_vector(7 downto 0) : x"A3"
            );  
    port (
            in1_i : in std_logic_vector(7 downto 0);
            out2_i : out std_logic;
            inout_io : inout std_logic
         );
end my_entity_name;

-- Architecture definition------------------------------------------------------------------------------
architecture behavioral of my_entity_name is
begin
-- define constants
constant c_time1mslim : integer := c_clkfreq/1000;
constant c_constant2 : std_logic_vector(7 downto 0) := (others => '0');
-- component declerations
component my_component is
    generic( gen1 : integer := 10;
             gen2 : std_logic := '0'
            );
    port(
        in1 : in std_logic_vector(7 downto 0);
        out1 : out std_logic
        );
end component my_component;
-- type definitions and init

      









