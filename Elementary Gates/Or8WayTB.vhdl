library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; -- allows for vectors in this instance to be converted into integers for calculations in the for loop

entity Or_8Way_tb is
end Or_8Way_tb;

architecture test of Or_8Way_tb is
	
	signal a_i, b_i, c_i, d_i, e_i, f_i, g_i, h_i, y : std_logic;
	
	begin
	
		UUT : entity work.Or_8Way port map(
			a_i => a_i, b_i => b_i, c_i => c_i, d_i => d_i, e_i => e_i, f_i => f_i, g_i => g_i, h_i => h_i, y => y
			);
		
		process
		
			variable inputs : unsigned (7 downto 0); -- creates variable named inputs that is 8 bits and unsigned
			
		begin
			
			for i in 0 to 255 loop --for loop to make input sequentially go from 0000 0000 to 1111 1111
				inputs := to_unsigned(i, 8);
				
				a_i <= inputs(7);
				b_i <= inputs(6);
				c_i <= inputs(5);
				d_i <= inputs(4);
				e_i <= inputs(3);
				f_i <= inputs(2);
				g_i <= inputs(1);
				h_i <= inputs(0);
				
				wait for 10 ns;
				
				--Test output is 0 when all inputs are 0
				if i = 0 then
					assert (y = '0')
					report "Failed. y should be 0 for input 0x0000"
					severity error;
					
				--Test output is 1 when any of the inputs are 1
					else
						assert (y = '1')
						report "Failed. y should be 1 when any input is 1"
						severity error;
				
				end if;
				
				report "All tests passed" severity note;
			
			end loop;
			
		wait;
		end process;
end test;