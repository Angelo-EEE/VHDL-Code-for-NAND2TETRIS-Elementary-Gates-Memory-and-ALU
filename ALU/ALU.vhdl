---------------------------------------------------------------------------
-- code for Hack ALU.                                                    --
--                                                                       --
-- 16 bit ALU with 6 input control bits and 2 output control bits.       --
-- The input control bits control what the ALU does in consecutive order --
--                                                                       --
-- if zx, then x = 0x0000,                                               --
-- if nx, then x = !x,                                                   --
-- if zy, then y = 0x0000,                                               --
-- if ny then y = !y,                                                    --
-- if f, then out = x + y else, out = x and y,                           --
-- if no, then out = ! out.                                              --
--                                                                       --
-- if out is zero then zr = 1,                                           --
-- if out is negative then ng = 1.                                       --
---------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
	port(
		--16-bit x and y input, and 16-bit output for the ALU
		x_i, y_i : in std_logic_vector(15 downto 0);
		alu_o : out std_logic_vector(15 downto 0);
		--control bit inputs and control bit outputs
		zx_i, nx_i, zy_i, ny_i, f_i, no_i : in std_logic;
		zr_o, ng_o : out std_logic
		);
end ALU;

architecture structural of ALU is

	--all inetermediate wires/signals within the ALU
	 signal xMux_w, yMux_w, xAndy_w, xAddy_w, fMux_w, noMux_w : std_logic_vector(15 downto 0);
	 
	 --wires for intermediate signals leading to zr
	 signal zr_lsb, zr_msb, zrInv_w : std_logic;
	 
	 --0x0000 and 0xFFFF signals for the Mux4Way16 inputs
	 signal const_0000 : std_logic_vector(15 downto 0) := x"0000";
	 signal const_FFFF : std_logic_vector(15 downto 0) := x"FFFF";
	 
	 --!x and !y
	 signal x_inv, y_inv : std_logic_vector(15 downto 0);
	 
	 --declare sel x and sel y signals so that they can be concatenated
	 signal sel_x_w, sel_y_w : std_logic_vector(1 downto 0);
	 
	 --!fMux_w
	 signal fMux_inv_w : std_logic_vector(15 downto 0);
	 
	 --
	 signal xAddy_signed : signed(15 downto 0);
	 
	--component declaration
	component or_gate is
		port(
		a_i , b_i  : in std_logic;
		q_o 	   : out std_logic
		);
	end component or_gate;
	
	component and16_gate is
		port(
		a_i, b_i : in std_logic_vector(15 downto 0);
		q_o 	 : out std_logic_vector(15 downto 0)
		);
	end component and16_gate;

	component Or_8Way is
		port(
		a_i, b_i, c_i, d_i, e_i, f_i, g_i, h_i : in std_logic;
		y : out std_logic
		);
	end component Or_8Way;
	
	component  MUX16 is
		port(
		a_i, b_i: in std_logic_vector(15 downto 0);
		sel     : in  std_logic;
		z_o 	: out std_logic_vector(15 downto 0)
		);
	end component MUX16;

	component Mux4Way16 is 
		port(
		a_i, b_i, c_i, d_i : in std_logic_vector(15 downto 0);
		sel : in std_logic_vector(1 downto 0);
		y_o : out std_logic_vector(15 downto 0)
		);
	end component Mux4Way16;
	
	component adder_16bit is
		port(
		a_i, b_i : in signed(15 downto 0);
		carry_i  : in std_logic;
		
		sum : out signed(15 downto 0);
		carry_o : out std_logic
		);
	end component adder_16bit;

	begin
	
	--assign x_inv and y_inv
	x_inv <= x_i nand x_i;
	y_inv <= y_i nand y_i;
	
	--assign fMux_inv_w
	fMux_inv_w <= fMux_w nand fMux_w;
	
	--concatenate sel bits for both of the 4 to 1 MUXes
	sel_x_w <= zx_i & nx_i;
	sel_y_w <= zy_i & ny_i;
	
	--Mux4Way16 to control the x input. If zx then x = 0x0000. If nx then x + !x.
	Mux4Way16_x : Mux4Way16 port map(
		a_i => x_i , b_i => x_inv, c_i=> const_0000, d_i => const_FFFF, sel => sel_x_w, y_o => xMux_w
		);
	
	--Mux4Way16 to control the y input. If zy then y = 0x0000. If ny then y + !x.	
	Mux4Way16_y : Mux4Way16 port map(
		a_i => y_i , b_i => y_inv, c_i=> const_0000, d_i => const_FFFF, sel => sel_y_w, y_o => yMux_w
		);
		
	--x and y logic operation
	xAndy : and16_gate port map(
		a_i => xMux_w, b_i => yMux_w, q_o => xAndy_w
		);
		
	--16 bit adder of x + y. convert inputs to signed numbers
	Adder : adder_16bit port map(
		a_i => signed(xMux_w), b_i => signed(yMux_w), sum => xAddy_signed, carry_i => '0'
		);
	
	--convert adder output back to std_logic_vector
	xAddy_w <= std_logic_vector(xAddy_signed);
	
	--Mux16 to control if x and y or x + y signal is chosen
	fMux : Mux16 port map(
		a_i => xAndy_w, b_i => xAddy_w, sel => f_i, z_o => fMux_w
		);
		
	--Mux 16. If no, then output = !fMux_w
	noMux : Mux16 port map(
		a_i => fMux_w, b_i => fMux_inv_w, sel => no_i, z_o => noMux_w
		);
		
	--ALU output = noMux_w signal
	alu_o <= noMux_w;
	
	--zr control bit output logic
	Or8WayLSB : Or_8Way port map(
		a_i => noMux_w(0),
		b_i => noMux_w(1),
		c_i => noMux_w(2),
		d_i => noMux_w(3),
		e_i => noMux_w(4),
		f_i => noMux_w(5),
		g_i => noMux_w(6),
		h_i => noMux_w(7),
		y => zr_lsb
		);
		
	Or8WayMSB : Or_8Way port map(
		a_i => noMux_w(8),
		b_i => noMux_w(9),
		c_i => noMux_w(10),
		d_i => noMux_w(11),
		e_i => noMux_w(12),
		f_i => noMux_w(13),
		g_i => noMux_w(14),
		h_i => noMux_w(15),
		y => zr_msb
		);
		
	zrInv_Or : or_gate port map(
		a_i => zr_lsb, b_i => zr_msb, q_o => zrInv_w
		);
		
	zr_o <= zrInv_w nand zrInv_w;
	
	-- ng control bit for negative number
	ng_o <= noMux_w(15);
	
end structural;