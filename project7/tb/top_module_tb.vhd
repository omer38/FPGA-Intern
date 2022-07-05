library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity top_module_tb is
end;

architecture bench of top_module_tb is

  component top_module
  	port(
  		A_i : in std_logic_vector(7 downto 0);
  		B_i : in std_logic_vector(7 downto 0);
  		clk_i : in std_logic;
  		reset_i : in std_logic;
  		start_i : in std_logic;
  		--
  		ready_o : out std_logic;
  		product_o : out std_logic_vector(15 downto 0)
  	);
  end component;

  signal A_i: std_logic_vector(7 downto 0);
  signal B_i: std_logic_vector(7 downto 0);
  signal clk_i: std_logic;
  signal reset_i: std_logic;
  signal start_i: std_logic;
  signal ready_o: std_logic;
  signal product_o: std_logic_vector(15 downto 0) ;

begin

  uut: top_module port map ( A_i       => A_i,
                             B_i       => B_i,
                             clk_i     => clk_i,
                             reset_i   => reset_i,
                             start_i   => start_i,
                             ready_o   => ready_o,
                             product_o => product_o );
  
   -- Stimulus process
    clock_process :process
     begin
     clk_i <= '0';
     wait for 10 ns;
     clk_i <= '1';
     wait for 10 ns;
     end process;

  stimulus: process
  begin
        reset_i <= '1';
        reset_i <= '0';
        start_i <= '0';
        A_i <= "00000011";
        B_i <= "00000101";
        wait for 30 ns;
        reset_i <= '0';
		wait for 20 ns;
		start_i <= '1';
		wait for 400 ns;
   
   
    wait;
  end process;


end;
