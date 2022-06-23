--ALU Top Module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ALU is
	port(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		CNT : in std_logic_vector(3 downto 0);
		--
		D : out std_logic_vector(31 downto 0)
	);
end ALU;

architecture behavioral of ALU is
-- signal tanımla
signal cout : std_logic;
signal summation,subtraction,shifted_r,shifted_l : std_logic_vector(31 downto 0);

component Add_Sub
generic(n : integer := 32);
	port(
		A : in std_logic_vector(n-1 downto 0);
		B : in std_logic_vector(n-1 downto 0);
		cntlast : in std_logic;
		cout : out std_logic;
		D : out std_logic_vector(n-1 downto 0)
		
	);
end component;

component shifter
generic(n: integer := 3;
        k: integer := 8
 );
port(
		A : in std_logic_vector(k-1 downto 0);-- shift yapılacak
		CNT : in std_logic; -- shift direction ( 0 left, 1 right) logical left-right
		B : in std_logic_vector(n-1 downto 0); -- shift amount
		--
		D : out std_logic_vector(k-1 downto 0)-- shift edilen
		
	);
end component;

begin

ADD : Add_Sub port map(
				A => A,
				B => B,
				cntlast => CNT(0),
				cout => cout,
				D => summation
			);

SUB : Add_Sub port map(
				A => A,
				B => B,
				cntlast => CNT(0),
				cout => cout,
				D => subtraction
			);

Shift_R : shifter -- b girişinin ilk 5 biti değeri kadar kaydır
			generic map (n => 5, k=>32)
			port map(
					A => A,
					CNT => '1',
					B=> B(4 downto 0),
					D=> shifted_r
				);
				
Shift_L : shifter
			generic map (n  => 5, k=>32)
			port map(
					A => A,
					CNT => '0',
					B=> B(4 downto 0),
					D=> shifted_l
				);
				
process(A,B,CNT,summation,subtraction,shifted_r,shifted_l)
begin

case CNT is 
	when "0000" => -- toplama
		D <= summation;
	
	when "0001" => -- çıkarma
		D <= subtraction;
	
	when "0010" => -- A>=B
		if (A>=B) then
			D <=  x"FFFFFFFF";
		else 
			D <= x"00000000";
		end if;
	when "0011" => -- A<B
		if (A<B) then
			D <=  x"FFFFFFFF";
		else 
			D <= x"00000000";
		end if;
	
	when "0100" => -- A!=B
		if (A /= B) then
			D <=  x"FFFFFFFF";
		else 
			D <= x"00000000";
		end if;
	
	when "0101" => -- A = B
		if (A=B) then
			D <=  x"FFFFFFFF";
		else 
			D <= x"00000000";
		end if;
	
	when "0110" => -- A and B
		D <= A and B;
	
	when "0111" => -- A or B 
		D <= A or B;
	
	when "1000" => -- A xor B
		D <= A xor B;
	
	when "1001" => -- A rol B(5:0)
		D <= std_logic_vector(unsigned(A) rol to_integer(unsigned(B(5 downto 0))));
		
	when "1010" => -- A ror B(5:0)
		D <= std_logic_vector(unsigned(A) ror to_integer(unsigned(B(5 downto 0))));
		
	when "1011" => -- A sll B(5:0)
		D <= shifted_l;
	
	when "1100" => -- A slr B(5:0)
		D <= shifted_r;
		
	when others =>
		D <= x"00000000";

end case;
end process;


end architecture;