library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
	port(
		a_i, b_i, fa_carry_i : in std_logic;
		fa_sum_o, fa_carry_o : out std_logic
		);
end full_adder;

architecture behavioural of full_adder is

	signal sum_st1 : std_logic; -- sum of first half adder
	signal carry_st1, carry_st2 : std_logic; -- signals to produce the carry_o
	
	component half_adder 
		port(
		a_i, b_i 	 : in std_logic;
		sum, carry_o : out std_logic
		);
	end component half_adder;
	
	component or_gate
		port(
			a_i, b_i : in std_logic;
			q_o : out std_logic
			);
	end component or_gate;
	
	begin
		--map first half adder connections
		HA1 : half_adder port map(
			a_i => a_i, b_i => b_i, sum => sum_st1, carry_o => carry_st1
			);
		
		--map second half adder connections for the final sum out
		HA2 : half_adder port map(
			a_i => sum_st1, b_i => fa_carry_i, sum => fa_sum_o, carry_o => carry_st2
			);
		
		--map the connections for the final carry out
	    OR1: or_gate port map(
			a_i => carry_st1, b_i => carry_st2, q_o => fa_carry_o
			);
			
end behavioural;