--ALU testbench
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ALU_tb is
end ALU_tb;

architecture testbench of ALU_tb is

  component ALU
  	port(
  		A : in std_logic_vector(31 downto 0);
  		B : in std_logic_vector(31 downto 0);
  		CNT : in std_logic_vector(3 downto 0);
  		D : out std_logic_vector(31 downto 0)
  	);
  end component;

-- input signals with inital values
  signal A: std_logic_vector(31 downto 0) := (others =>'0');
  signal B: std_logic_vector(31 downto 0) := (others =>'0');
  signal CNT: std_logic_vector(3 downto 0):= (others =>'0');
  signal D: std_logic_vector(31 downto 0) := (others =>'0') ;

begin

  uut: ALU port map ( A   => A,
                      B   => B,
                      CNT => CNT,
                      D   => D );

  stimulus: process
  begin
  A <= "00000000000000000000000000000001";
  B <= "00000000000000000000000000000010";
  CNT <= "0000";
  wait for 10ns;
  A <= "00000000000000000000000000001001";
  B <= "00000000000000000000000010000010";
  CNT <= "0000";
  wait for 10ns;
  A <= "00000000000000000000000000000011";
  B <= "00000000000000000000000000000001";
  CNT <= "0001";
  wait for 10ns;
  A <= "00000000000000000000000100000011";
  B <= "00000000000000000000000000011101";
  CNT <= "0001";
  wait for 10ns;
  A <= "00000000000000000000000000000011";
  B <= "00000000000000000000000000000001";
  CNT <= "0010";
  wait for 10ns;
  A <= "00000000000000000000000000000011";
  B <= "00000000000000000000000000000001";
  CNT <= "0011";
  wait for 10ns;
  A <= "00000000000000000000000000000111";
  B <= "00000000000000000000000000010001";
  CNT <= "0100";
  wait for 10ns;
  A <= "00000000000000000000000000000011";
  B <= "00000000000000000000000000000001";
  CNT <= "0101";
  wait for 10ns;
  A <= "00000000001000000000100000000011";
  B <= "00000000100000000000001100000001";
  CNT <= "0110";
  wait for 10ns;
  A <= "10000000100010111000000000000011";
  B <= "00000000011000000000000000000001";
  CNT <= "0111";
  wait for 10ns;
  A <= "01000110010000000000000000000011";
  B <= "10011010100000000000000000000001";
  CNT <= "1000";
  wait for 10ns;
  A <= "00001000000100011000001101010011";
  B <= "00000011000010001000100000101101";
  CNT <= "1001";
  wait for 10ns;
  A <= "00001000000100011000001101010011";
  B <= "00000011000010001000100000000001";
  CNT <= "1001";
  wait for 10ns;
  A <= "11000000010001010001100010000011";
  B <= "00100000000000010000100001101001";
  CNT <= "1010";
  wait for 10ns;
  A <= "00001000000100011000001101010011";
  B <= "00000011000010001000100000000001";
  CNT <= "1010";
  wait for 10ns;
  A <= "00010000110001100010010010010011";
  B <= "01001001000000000001001000100001";
  CNT <= "1011";
  wait for 10ns;
  A <= "10001000000100011000001101010011";
  B <= "00000011000010001000100000000001";
  CNT <= "1011";
  wait for 10ns;
  A <= "00110001001000001000111001000111";
  B <= "01000100000000000001001001100011";
  CNT <= "1100";
  wait for 10ns;
  A <= "00001000000100011000001101010011";
  B <= "00000011000010001000100000000001";
  CNT <= "1100";
  wait for 10ns;
  
    wait;
  end process;


end;