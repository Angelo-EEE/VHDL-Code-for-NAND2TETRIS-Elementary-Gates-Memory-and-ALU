library IEEE;
use IEEE.std_logic_1164.all;

entity Or_8Way is
	port(
		a_i, b_i, c_i, d_i, e_i, f_i, g_i, h_i : in std_logic;
		y : out std_logic
		);
end Or_8Way;

architecture rtl of Or_8Way is
-- declare intermediate signals in different stages 
	signal a_inv, b_inv, c_inv, d_inv, e_inv, f_inv, g_inv, h_inv : std_logic;
	signal st1_0, st1_1, st1_2, st1_3 : std_logic;
	signal st1_0_inv, st1_1_inv, st1_2_inv, st1_3_inv : std_logic;
	signal st2_0, st2_1 : std_logic;
	signal st2_0_inv, st2_1_inv : std_logic;
	
	begin
		a_inv <= a_i nand a_i;
		b_inv <= b_i nand b_i;
		c_inv <= c_i nand c_i;
		d_inv <= d_i nand d_i;
		e_inv <= e_i nand e_i;
		f_inv <= f_i nand f_i;
		g_inv <= g_i nand g_i;
		h_inv <= h_i nand h_i;
		
		st1_0 <= a_inv nand b_inv;
		st1_1 <= c_inv nand d_inv;
		st1_2 <= e_inv nand f_inv;
		st1_3 <= g_inv nand h_inv;
		
		st1_0_inv <= st1_0 nand st1_0;
		st1_1_inv <= st1_1 nand st1_1;
		st1_2_inv <= st1_2 nand st1_2;
		st1_3_inv <= st1_3 nand st1_3;
		
		st2_0 <= st1_0_inv nand st1_1_inv;
		st2_1 <= st1_2_inv nand st1_3_inv;
		
		st2_0_inv <= st2_0 nand st2_0;
		st2_1_inv <= st2_1 nand st2_1;
		
		y <= st2_0_inv nand st2_1_inv;
		
end rtl;