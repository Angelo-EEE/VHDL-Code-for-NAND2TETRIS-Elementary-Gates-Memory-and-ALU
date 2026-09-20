library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8Way16 is
	port(
		a_i, b_i, c_i, d_i, e_i, f_i, g_i, h_i : in std_logic_vector(15 downto 0);
		sel : in std_logic_vector(2 downto 0);
		y_o : out std_logic_vector(15 downto 0)
		);
end Mux8Way16;

architecture rtl of Mux8Way16 is

	signal sel_inv : std_logic_vector(2 downto 0);
	--stage 1 signals
	signal st1_0, st1_1, st1_2, st1_3, st1_4, st1_5, st1_6, st1_7 : std_logic_vector(15 downto 0);	
	--stage 2 signals
	signal st2_0, st2_1, st2_2, st2_3 : std_logic_vector(15 downto 0);
	--stage 3 signals
	signal st3_0, st3_1, st3_2, st3_3 : std_logic_vector(15 downto 0);
	--stage 4 signals
	signal st4_0, st4_1 : std_logic_vector(15 downto 0);
	--stage 5 signals
	signal st5_0, st5_1 : std_logic_vector(15 downto 0);
	
	begin
		
		sel_inv <= sel nand sel;
		
		--stage 1
		st1_0 <= a_i nand (a_i'range => sel_inv(0));
		st1_1 <= b_i nand (b_i'range => sel(0));
		st1_2 <= c_i nand (c_i'range => sel_inv(0));
		st1_3 <= d_i nand (d_i'range => sel(0));
		st1_4 <= e_i nand (e_i'range => sel_inv(0));
		st1_5 <= f_i nand (f_i'range => sel(0));
		st1_6 <= g_i nand (g_i'range => sel_inv(0));
		st1_7 <= h_i nand (h_i'range => sel(0));
		
		--stage 2
		st2_0 <= st1_0 nand st1_1;
		st2_1 <= st1_2 nand st1_3;
		st2_2 <= st1_4 nand st1_5;
		st2_3 <= st1_6 nand st1_7;
		
		--stage 3
		st3_0 <= st2_0 nand (st2_0'range => sel_inv(1));
		st3_1 <= st2_1 nand (st2_1'range => sel(1));
		st3_2 <= st2_2 nand (st2_2'range => sel_inv(1));
		st3_3 <= st2_3 nand (st2_3'range => sel(1));
		
		--stage 4
		st4_0 <= st3_0 nand st3_1;
		st4_1 <= st3_2 nand st3_3;
		
		--stage 5
		st5_0 <= st4_0 nand (st4_0'range => sel_inv(2));
		st5_1 <= st4_1 nand (st4_1'range => sel(2));
		
		--output
		y_o <= st5_0 nand st5_1;
		
end rtl;