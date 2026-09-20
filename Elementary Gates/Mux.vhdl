library IEEE;
use IEEE.std_logic_1164.all;


entity MUX is
	port(
		a_i, b_i, sel: in std_logic;
		z_o 	   			: out std_logic
		);
end MUX;


architecture rtl of MUX is
	signal sel_inv, st1_0, st1_1 :std_logic;
	
	begin
		sel_inv <= sel nand sel;
		st1_0 <= a_i nand sel_inv;
		st1_1 <= b_i nand sel;
		z_o <= st1_0 nand st1_1;
end rtl;