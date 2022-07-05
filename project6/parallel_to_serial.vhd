
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parallel_to_serial is
        port(
		clk    : in std_logic;
		datain : in std_logic_vector(7 downto 0);
		load   : in std_logic;
		--
		dataout : out std_logic
	);
end parallel_to_serial;

architecture Behavioral of parallel_to_serial is

type states is (idle,d0,d1,d2,d3,d4,d5,d6,d7,p_check);
signal state : states := idle;
signal data_sig : std_logic_vector(7 downto 0);

begin

process(clk) begin
if rising_edge(clk) then
    case state is 
        when idle =>
            data_sig <= datain;
            if load = '0' then
                data_sig <= "00000000";
                dataout <= '0';
                state <= idle;
            elsif load = '1' then
                dataout <= '0';
                state <= d0;
            end if;
        when d0 =>
                dataout <= data_sig(0);
                state <= d1;
        when d1 =>
                dataout <= data_sig(1);
                state <= d2;
        when d2 =>
                dataout <= data_sig(2);
                state <= d3;
        when d3 =>
                dataout <= data_sig(3);
                state <= d4;
        when d4 =>
                dataout <= data_sig(4);
                state <= d5;
       when d5 =>
                dataout <= data_sig(5);
                state <= d6;
       when d6 =>
                dataout <= data_sig(6);
                state <= d7;
       when d7 =>
                dataout <= data_sig(7);
                state <= p_check;  
       when p_check =>
               dataout <= data_sig(0) xor data_sig(0) xor data_sig(0) xor data_sig(0) xor data_sig(0) xor data_sig(0) xor 
               data_sig(0) xor data_sig(0);
               state <= idle;
       end case;
end if;
end process;
                                                         
end Behavioral;
