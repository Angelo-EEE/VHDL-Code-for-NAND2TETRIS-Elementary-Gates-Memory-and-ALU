library IEEE;
use IEEE.std_logic_1164.all;

entity Dmux8Way is
	port(
		sel   : in std_logic_vector(2 downto 0);
		input : in std_logic;
		a_o, b_o, c_o, d_o, e_o, f_o, g_o, h_o : out std_logic
		);
end Dmux8Way;

architecture rtl of Dmux8Way is
	
	signal sel_inv : std_logic_vector(2 downto 0);
	
	--stage 1 signals
	signal st1_0, st1_1, st1_0_inv, st1_1_inv : std_logic;
	
	--stage 2 signals
	signal st2_0, st2_1, st2_2, st2_3, st2_0_inv, st2_1_inv, st2_2_inv, st2_3_inv : std_logic;
	
	--stage 3 signals
	signal st3_0, st3_1, st3_2, st3_3, st3_4, st3_5, st3_6, st3_7 : std_logic;
	
	begin
		sel_inv <= sel nand sel;
		
		--stage 1
		st1_0 <= input nand sel_inv(2);
		st1_1 <= input nand sel(2);
		
		st1_0_inv <= st1_0 nand st1_0;
		st1_1_inv <= st1_1 nand st1_1;
		
		--stage 2
		st2_0 <= st1_0_inv nand sel_inv(1);
		st2_1 <= st1_0_inv nand sel(1);
		st2_2 <= st1_1_inv nand sel_inv(1);
		st2_3 <= st1_1_inv nand sel(1);
		
		st2_0_inv <= st2_0 nand st2_0;
		st2_1_inv <= st2_1 nand st2_1;
		st2_2_inv <= st2_2 nand st2_2;
		st2_3_inv <= st2_3 nand st2_3;
		
		--stage 3
		st3_0 <= st2_0_inv nand sel_inv(0);
		st3_1 <= st2_0_inv nand sel(0);
		st3_2 <= st2_1_inv nand sel_inv(0);
		st3_3 <= st2_1_inv nand sel(0);
		st3_4 <= st2_2_inv nand sel_inv(0);
		st3_5 <= st2_2_inv nand sel(0);
		st3_6 <= st2_3_inv nand sel_inv(0);
		st3_7 <= st2_3_inv nand sel(0);
		
		--outputs
		a_o <= st3_0 nand st3_0;
		b_o <= st3_1 nand st3_1;
		c_o <= st3_2 nand st3_2;
		d_o <= st3_3 nand st3_3;
		e_o <= st3_4 nand st3_4;
		f_o <= st3_5 nand st3_5;
		g_o <= st3_6 nand st3_6;
		h_o <= st3_7 nand st3_7;
		
end rtl;