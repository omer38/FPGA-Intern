library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_counter is
	port(
		clk : in std_logic;
		reset : in std_logic;
		sw    : in std_logic;
		button : in std_logic;
		leds: out std_logic_vector(7 downto 0)
	);
end top_counter;

architecture Behavioral of top_counter is

type states is (A,B);
signal state: states;

component counter is
	port(
		clk : in std_logic;
		reset : in std_logic;
		sw    : in std_logic;
		leds: out std_logic_vector(7 downto 0)
	);
end component;

signal count: std_logic_vector(7 downto 0); 
signal en: std_logic;
begin

coun : counter 
        port map(
            clk => en,
            reset => reset,
            sw => sw,
            leds => count
        );
                    
en <= '1' when (((button='1') and (state=A))or ((state=B)and button='1')) else '0';

process (clk)
begin
    if(reset = '1') then
        state <= A;
    elsif rising_edge(clk) then
    case state is
        when A =>
            if button='1' then
                state <= B;
            else
                state <= A; 
            end if;
        when B =>
            if button='1' then
                state <=B;
            else
                state <=A; 
            end if;
end case;
end if;
end process;


leds <= count;



end Behavioral;
