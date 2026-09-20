library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4Way16 is
	port(
		a_i, b_i, c_i, d_i : in std_logic_vector(15 downto 0);
		sel : in std_logic_vector(1 downto 0);
		y_o : out std_logic_vector(15 downto 0)
		);
end Mux4Way16;


architecture rtl of Mux4Way16 is
	
	signal sel_inv : std_logic_vector(1 downto 0);
	signal st1_0, st1_1, st1_2, st1_3, st2_0, st2_1, st3_0, st3_1 : std_logic_vector(15 downto 0);
	
	begin
	
		sel_inv <= sel nand sel;
		
		--stage 1
		st1_0 <= a_i nand (a_i'range => sel_inv(0));
		st1_1 <= b_i nand (b_i'range => sel(0));
		st1_2 <= c_i nand (c_i'range => sel_inv(0));
		st1_3 <= d_i nand (d_i'range => sel(0));
		
		--stage 2
		st2_0 <= st1_0 nand st1_1;
		st2_1 <= st1_2 nand st1_3;
		
		--stage 3
		st3_0 <= st2_0 nand (st2_0'range => sel_inv(1));
		st3_1 <= st2_1 nand (st2_1'range => sel(1));
		
		--output
		y_o <= st3_0 nand st3_1;
end rtl;