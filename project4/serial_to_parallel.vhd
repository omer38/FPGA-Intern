-- serial to parallel
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity serial_to_parallel is 
port(
	a : in std_logic;
	clk : in std_logic;
	start : in std_logic;
	ready : out std_logic := '0';
	out_p : out std_logic_vector(7 downto 0) := "00000000"
);
end serial_to_parallel;

architecture behavioral of serial_to_parallel is

type states is (idle,s0,s1,s2,s3,s4,s5,s6,s7);
signal cs : states := idle;

signal vector : std_logic_vector(7 downto 0) := "00000000";
begin

process(clk)
begin
if rising_edge(clk) then
    case cs is
        when idle =>  
          if start = '1' then
            cs <= s0;
           ready<= '0';
          else
            cs <= idle;
            ready <= '0';
           end if; 
         when s0 =>
            vector(0) <= a;
            cs <= s1;
           ready<= '0';
          when s1 =>
            vector(1) <= a;
            cs <= s2;
           ready<= '0';
          when s2 =>
            vector(2) <= a;
            cs <= s3;
           ready<= '0';
          when s3 =>
            vector(3) <= a;
            cs <= s4;
           ready<= '0';
          when s4 =>
            vector(4) <= a;
            cs <= s5;
           ready<= '0';
           when s5 =>
            vector(5) <= a;
            cs <= s6;
           ready<= '0';
           when s6 =>
            vector(6) <= a;
            cs <= s7;
           ready<= '0';
           when s7 =>
            vector(7) <= a;
            cs <= idle;
           ready<= '1';
     end case;
end if;
if cs = idle then
    out_p <= "00000000";
elsif cs = s7 then
    out_p <= vector;
end if;
end process;


end architecture;
