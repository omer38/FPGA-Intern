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
        in1 : std_logic_vector(3 downto 0);
        out1 : std_logic
        );
end component my_component;

        in1 : in std_logic_vector(7 downto 0);
        out1 : out std_logic
        );
end component my_component;
-- type definitions and init
type t_state is (s_start, s_operation, s_terminate, s_idle);
-- subtype is a type with a constraint
subtype t_decimal_digit is integer range 0 to 9;
subtype t_byte is bit_vector(7 downto 0);
-- record
type my_record_type is record 
    param1 : std_logic;
    param2 : std_logic_vector( 3 downto 0);
end record;

-- signals declarations
signal s0 : std_logic_vector(7 downto 0) := x"00" ; 
signal s1 : integer range 0 to 255 := 0; -- 8 bit HW tutar
signal s2 : integer := 0; -- 32 bit HW tutar
signal state : t_state := s_start;
----------------------------------------------------------------
begin
-- component instantiations
mycomp1 : my_component
    generic map( gen1 => c_i2ccfreq,
                 gen2 => '0'
                );
    port map(
            in1 => input1_i,
            out1 => output1_o
            );
------- concurrent assignments
-- when-else structure
s1 <= x"01" when s0<30 else
      x"03";
-- with-select structure
with state select
    s0 <= x"01" when s_start,
          x"02" when s_operation,
          x"04" when others;
-- direct
s3 <= s + 2;
s4 <= in1(3) xor in1(2) xor in2;

--------- sequential assignment ( note : process blocks work concurrently with each other)
-- combinational process
p_combinational : process(s0,state,input1_i, input2_i) begin -- It is important to put all changing variables into sensitivity list
    if (s0 < 30) then 
        s1 <= x"01";
    elsif (s0 < 40) -- kontrol et burayı
        s1 <= x"02";
    else
        s1 <= x"03";
    end if;
    -- case block
    case state is
        when s_start =>
            s0 <= x"01" ;
        when s_operation =>
            s0 <= x"02" ;
        when others =>
            s0 <= x"04";
    end case;
end process;
-- sequential process synchronously with clock and use FF's.
p_sequential : process(clk) begin
                    if rising_edge(clk) then
                        ------
                        ------
                        ------
                     end if;
               end process p_sequential;
        
 end behavioral;     









