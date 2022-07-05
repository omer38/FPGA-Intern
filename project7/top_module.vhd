-- top module 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
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
end top_module;

architecture Behavioral of top_module is

component controller is
	port(
		clk : in std_logic;
		reset : in std_logic;
		start : in std_logic;
		--
		load_multiplier : out std_logic;
		load_multiplicand : out std_logic;
		load_product : out std_logic;
		shift_multiplier: out std_logic;
		shift_product : out std_logic;
		reset_product : out std_logic;
		ready 		: out std_logic
	);
end component;

component Adder_module is
	port(
		in1 : in std_logic_vector(7 downto 0);
		in2 : in std_logic_vector(7 downto 0);
		cin : in std_logic;
		cout : inout std_logic;
		output : out std_logic_vector(8 downto 0)
		
	);
end component;

component and_module is
	port(
		in_bit : in std_logic;
		in2 : in std_logic_vector(7 downto 0);
		--
		output_and : out std_logic_vector(7 downto 0)
	
	);
end component;

component multiplicand_module is
    port(
        clk : in std_logic;
        load_md : in std_logic;
        datain_md : in std_logic_vector(7 downto 0);
        --
        multiplicand : out std_logic_vector(7 downto 0)
    );
end component;

component multiplier is
	port(
		clk : in std_logic;
		load_m : in std_logic;
		shift_r_m : in std_logic;
		datain : in std_logic_vector(7 downto 0);
		--
		dataout_m : out std_logic -- multiplier(0)'ı çıkışa verecek 
	);
end component;

component product_module is
    port(
        clk : in std_logic;
        load_p : in std_logic;
        shift_r_p : in std_logic;
        reset_p : in std_logic;
        datain_p : in std_logic_vector(8 downto 0);
        --
        dataout : out std_logic_vector(15 downto 0)
    );
end component;
-- sinyal tanımla eşleşmeleri yap
signal load_multiplier,shift_multiplier,load_multiplicand,reset_product,load_product,shift_product,cout : std_logic;
signal in2,output_and: std_logic_vector(7 downto 0);
signal datain_p : std_logic_vector(8 downto 0);
signal in_bit: std_logic;
signal ready_out :std_logic;
signal product_out: std_logic_vector(15 downto 0);

begin

multiplier1 : multiplier port map(
			clk_i,
			load_multiplier,
			shift_multiplier,
			A_i,
		--
			in_bit
);

multiplicand1 : multiplicand_module port map(
			clk_i,
			load_multiplicand,
			B_i,
        --
			in2
);

and1 		: and_module port map(
			in_bit,
			in2,
			--
			output_and	
);

adder1 		: Adder_module port map(
			output_and,
			product_out(15 downto 8),
			'0',
			cout,
			--
		    datain_p
);

product1 	: product_module port map(
			clk_i,
			load_product,
			shift_product,
			reset_product,
			datain_p,
			--
			product_out
);

controller1 : controller port map(
			clk_i,
			reset_i,
			start_i,
			--
			load_multiplier,
			load_multiplicand,
			load_product,
			shift_multiplier,
			shift_product,
			reset_product,
			ready_out
);
product_o <= product_out;
ready_o <= ready_out;
end Behavioral;

