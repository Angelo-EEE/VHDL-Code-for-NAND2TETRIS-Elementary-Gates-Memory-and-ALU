library IEEE;
use IEEE.std_logic_1164.all;

entity Dmux4Way is
	port(
		sel   : in std_logic_vector(1 downto 0);
		input : in std_logic;
		a_o, b_o, c_o, d_o : out std_logic
		);
end Dmux4Way;

architecture rtl of Dmux4Way is

	signal sel_inv : std_logic_vector(1 downto 0);
	--stage 1 signals
	signal st1_0, st1_1, st1_0_inv, st1_1_inv : std_logic;
	--stage 2 signals
	signal st2_0, st2_1, st2_2, st2_3 : std_logic;
	
	begin
		sel_inv <= sel nand sel;
		
		--stage 1
		st1_0 <= input nand sel_inv(1);
		st1_1 <= input nand sel(1);
		
		st1_0_inv <= st1_0 nand st1_0;
		st1_1_inv <= st1_1 nand st1_1;
		
		--stage 2
		st2_0 <= st1_0_inv nand sel_inv(0);
		st2_1 <= st1_0_inv nand sel(0);
		st2_2 <= st1_1_inv nand sel_inv(0);
		st2_3 <= st1_1_inv nand sel(0);
		
		--outputs
		a_o <= st2_0 nand st2_0;
		b_o <= st2_1 nand st2_1;
		c_o <= st2_2 nand st2_2;
		d_o <= st2_3 nand st2_3;
		
end rtl;