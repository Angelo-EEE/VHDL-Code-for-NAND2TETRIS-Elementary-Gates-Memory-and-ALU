library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder_16bit is
	port(
		a_i, b_i : in signed(15 downto 0); --inputs
		carry_i : in std_logic;
		
		sum : out signed(15 downto 0); -- outputs
		carry_o : out std_logic
		);
end adder_16bit;

architecture behavioural of adder_16bit is
	
	signal sum_bits : std_logic_vector(15 downto 0);
	signal carry_bits : std_logic_vector(15 downto 0);
	
	component full_adder
		port(
		a_i, b_i, fa_carry_i : in std_logic; --full adder inputs
		fa_sum_o, fa_carry_o : out std_logic -- full adder outputs
		);
	end component full_adder;
	
	begin
	--map all of the signals to the 16 full adder signals
	FA0 : full_adder port map(
		a_i => a_i(0), b_i => b_i(0), fa_carry_i => carry_i,
		fa_sum_o => sum_bits(0), fa_carry_o => carry_bits(0)
		);
		
	FA1 : full_adder port map(
		a_i => a_i(1), b_i => b_i(1), fa_carry_i => carry_bits(0),
		fa_sum_o => sum_bits(1), fa_carry_o => carry_bits(1)
		);
		
	FA2 : full_adder port map(
		a_i => a_i(2), b_i => b_i(2), fa_carry_i => carry_bits(1),
		fa_sum_o => sum_bits(2), fa_carry_o => carry_bits(2)
		);
		
	FA3 : full_adder port map(
		a_i => a_i(3), b_i => b_i(3), fa_carry_i => carry_bits(2),
		fa_sum_o => sum_bits(3), fa_carry_o => carry_bits(3)
		);
		
	FA4 : full_adder port map(
		a_i => a_i(4), b_i => b_i(4), fa_carry_i => carry_bits(3),
		fa_sum_o => sum_bits(4), fa_carry_o => carry_bits(4)
		);
		
	FA5 : full_adder port map(
		a_i => a_i(5), b_i => b_i(5), fa_carry_i => carry_bits(4),
		fa_sum_o => sum_bits(5), fa_carry_o => carry_bits(5)
		);
		
	FA6 : full_adder port map(
		a_i => a_i(6), b_i => b_i(6), fa_carry_i => carry_bits(5),
		fa_sum_o => sum_bits(6), fa_carry_o => carry_bits(6)
		);
		
	FA7 : full_adder port map(
		a_i => a_i(7), b_i => b_i(7), fa_carry_i => carry_bits(6),
		fa_sum_o => sum_bits(7), fa_carry_o => carry_bits(7)
		);
		
	FA8 : full_adder port map(
		a_i => a_i(8), b_i => b_i(8), fa_carry_i => carry_bits(7),
		fa_sum_o => sum_bits(8), fa_carry_o => carry_bits(8)
		);
		
	FA9 : full_adder port map(
		a_i => a_i(9), b_i => b_i(9), fa_carry_i => carry_bits(8),
		fa_sum_o => sum_bits(9), fa_carry_o => carry_bits(9)
		);
		
	FA10 : full_adder port map(
		a_i => a_i(10), b_i => b_i(10), fa_carry_i => carry_bits(9),
		fa_sum_o => sum_bits(10), fa_carry_o => carry_bits(10)
		);
		
	FA11 : full_adder port map(
		a_i => a_i(11), b_i => b_i(11), fa_carry_i => carry_bits(10),
		fa_sum_o => sum_bits(11), fa_carry_o => carry_bits(11)
		);
		
	FA12 : full_adder port map(
		a_i => a_i(12), b_i => b_i(12), fa_carry_i => carry_bits(11),
		fa_sum_o => sum_bits(12), fa_carry_o => carry_bits(12)
		);
		
	FA13 : full_adder port map(
		a_i => a_i(13), b_i => b_i(13), fa_carry_i => carry_bits(12),
		fa_sum_o => sum_bits(13), fa_carry_o => carry_bits(13)
		);
		
	FA14 : full_adder port map(
		a_i => a_i(14), b_i => b_i(14), fa_carry_i => carry_bits(13),
		fa_sum_o => sum_bits(14), fa_carry_o => carry_bits(14)
		);
		
	FA15 : full_adder port map(
		a_i => a_i(15), b_i => b_i(15), fa_carry_i => carry_bits(14),
		fa_sum_o => sum_bits(15), fa_carry_o => carry_bits(15)
		);
		
	sum <= signed(sum_bits); --put all full adder sums into one 16 bit signed sum
	carry_o <= carry_bits(15); -- carry bit 15 is the final carry out of the final adder
		
end behavioural;