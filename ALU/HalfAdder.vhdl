Library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	port(
		a_i, b_i 	   : in std_logic;
		sum, carry_o : out std_logic
		);
end half_adder;

architecture behavioural of half_adder is
	--Component declaration from top level work file (includes previously built gates)
	component xor_gate 
		port(
			a_i, b_i : in std_logic;
			q_o      : out std_logic
		);
	end component xor_gate;
	
	
	component and_gate
		port(
			a_i, b_i : in std_logic;
			q_o      : out std_logic
		);
	end component and_gate;
	
	-- Define how behavioural works by mapping connections between top-level ports and component instance ports
	begin
		xor_gate_inst : xor_gate port map(
			a_i => a_i, b_i => b_i, q_o => sum
			);
			
		and_gate_inst : and_gate port map(
			a_i => a_i, b_i => b_i, q_o => carry_o
			);
		
end behavioural;