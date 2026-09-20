library IEEE;
use IEEE.std_logic_1164.all;


entity MUX16 is
	port(
		a_i, b_i: in std_logic_vector(15 downto 0);
		sel     : in  std_logic;
		z_o 	  : out std_logic_vector(15 downto 0)
		);
end MUX16;


architecture rtl of MUX16 is
	signal sel_inv : std_logic;
	signal st1_0, st1_1: std_logic_vector(15 downto 0);

	begin
		sel_inv <= sel nand sel;
		st1_0 	<= a_i nand (a_i'range => sel_inv); 
		st1_1	<= b_i nand (b_i'range => sel); 
		z_o 	<= st1_0 nand st1_1;
end rtl; 