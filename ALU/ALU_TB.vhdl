library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_tb is
end ALU_tb;

architecture behavioural of ALU_tb is
	
	--16-bit signed x and y input, and 16-bit signed output
	signal x_i, y_i : std_logic_vector(15 downto 0) := x"0000";
	signal alu_o : std_logic_vector(15 downto 0);
	
	--control bit inputs and control bit outputs
	signal zx_i, nx_i, zy_i, ny_i, f_i, no_i : std_logic := '0';
	signal zr_o, ng_o : std_logic;
	
	type test_inputs is record -- lays out a table for the different inputs and their decriptions that will be used for testing
		x : std_logic_vector(15 downto 0);
		y : std_logic_vector(15 downto 0);
		descr : string(1 to 23);
	end record;
		
	type input_array is array (natural range<>) of test_inputs; -- an array for the different variations of inputs that will be used in testing
	constant input_variations : input_array := (
		(x"0000", x"0000", "All Zeros              "),
		(x"FFFF", x"FFFF", "-1/All Ones            "),
		(x"AAAA", x"5555", "Alternating bit pattern"),
		(x"7FFF", x"0001", "Posotive Overflow      "),
		(x"8000", x"FFFF", "Negative Overflow      "),
		(x"FA31", x"00FF", "Positive and Negative  "),
		(x"1432", x"0F14", "Both Positive          "),
		(x"827A", x"F352", "Both Negative          ")
		);
	
	--Procedure to obtain expected ALU results
	procedure get_expected (
		signal x, y : in std_logic_vector(15 downto 0);
		signal zx, nx, zy, ny, f, no : in std_logic;
		
		variable out_exp : out signed(15 downto 0);
		variable zr_exp, ng_exp : out std_logic
		) is
			variable x_temp, y_temp, out_temp : signed(15 downto 0); --temporary variables to be used to assign changing signals
		begin
		--x signal coditioning
			if zx = '1' then x_temp := x"0000";
				else x_temp := signed(x);
			end if;
			
			if nx = '1' then x_temp := not x_temp;
			end if;
	
		--y signal conditioning
			if zy = '1' then y_temp := x"0000";
				else y_temp := signed(y);
			end if;
			
			if ny = '1' then y_temp := not y_temp;
			end if;
			
		--determine add or and operation
			if f = '1' then out_temp := x_temp + y_temp;
				else out_temp := x_temp and y_temp;
			end if;
		
		--output inverse operation
			if no = '1' then out_temp := not out_temp;
			end if;
			
		--assign expected outputs
			out_exp := out_temp;
			
			if out_temp = x"0000" then zr_exp := '1';
				else zr_exp := '0';
			end if;
			
			ng_exp := out_temp(15);
			
	end procedure;
			
	begin
	
	UUT : entity work.ALU port map(
		x_i => x_i, y_i => y_i,
		alu_o => alu_o,
		
		zx_i => zx_i,
		nx_i => nx_i,
		zy_i => zy_i,
		ny_i => ny_i,
		f_i => f_i,
		no_i => no_i,
		
		zr_o => zr_o,
		ng_o => ng_o
		);
		
	verification : process
		variable ctrl_vector : unsigned(5 downto 0); --variable for control bits to determine operation of ALU
		variable out_exp  : signed(15 downto 0);
        variable zr_exp   : std_logic;
        variable ng_exp   : std_logic;
		
		begin
			report "Starting Hack ALU Verification...";

			--outer loop to iterate over x and y input variations from input_variations array
			for v in input_variations'range loop
				x_i <= input_variations(v).x;
				y_i <= input_variations(v).y;

				--inner loop to cycle through all control bit combinations
				for i in 0 to 63 loop
					ctrl_vector := to_unsigned(i, 6);

					-- assign individual control signals from vector bits
					zx_i <= ctrl_vector(5);
					nx_i <= ctrl_vector(4);
					zy_i <= ctrl_vector(3);
					ny_i <= ctrl_vector(2);
					f_i  <= ctrl_vector(1);
					no_i <= ctrl_vector(0);

					wait for 10 ns;

					--compute expected result rom the procedure
					get_expected(x_i, y_i, zx_i, nx_i, zy_i, ny_i, f_i, no_i, out_exp, zr_exp, ng_exp);

					--ALU output check
					assert (signed(alu_o) = out_exp)
						report "ERROR for ALU Out: " & input_variations(v).descr &
							   " Ctrl Index: " & integer'image(i) & -- integer'image converts integer to string
							   " Expected Out: " & integer'image(to_integer(out_exp)) & -- converts to signed vector to integer to string
							   " ALU Out: " & integer'image(to_integer(signed(alu_o)))
						severity error;

					--zr check
					assert (zr_o = zr_exp)
						report "ERROR for zr out: Expected Out: " & std_logic'image(zr_exp) &
							   " zr Out: " & std_logic'image(zr_o)
						severity ERROR;

					--ng check
					assert (ng_o = ng_exp)
						report "ERROR for ng Out: Expected: " & std_logic'image(ng_exp) &
							   " ng Out: " & std_logic'image(ng_o)
						severity ERROR;

				end loop;
			end loop;

			report "All tests passed."
				severity note;
				
		wait;
	end process;
end behavioural;