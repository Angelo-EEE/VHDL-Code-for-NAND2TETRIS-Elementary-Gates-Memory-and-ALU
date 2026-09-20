library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity incrementer16 is
	port(
		a_i : in signed(15 downto 0);
		q_o : out signed(15 downto 0)
		);
end incrementer16;

architecture behavioural of incrementer16 is
	
	component adder_16bit 
		port(
			a_i, b_i : in signed (15 downto 0);
			carry_i : in std_logic;
			sum : out signed (15 downto 0);
			carry_o : out std_logic
			);
	end component adder_16bit;
	
	begin
	
	ADDER16 : adder_16bit port map(
		a_i => a_i, sum => q_o, 
		b_i => x"0001", --make sure b_i is 1 so that the incrementer always increments by 1
		carry_i => '0' --drive carry in downto 0 always
		);
end behavioural;