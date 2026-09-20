library IEEE;
use IEEE.std_logic_1164.all;


entity DMUX is
	port(
		input, sel : in std_logic;
		a_o, b_o : out std_logic
		);
end DMUX;


architecture rtl of DMUX is
	signal sel_inv : std_logic;
	signal st1_0 : std_logic;
	signal st1_1 :std_logic;
	
	begin
		sel_inv <= sel nand sel;
		st1_0   <= input nand sel_inv;
		st1_1	<= input nand sel;
		a_o	    <= st1_0 nand st1_0;
		b_o	    <= st1_1 nand st1_1;
end rtl;