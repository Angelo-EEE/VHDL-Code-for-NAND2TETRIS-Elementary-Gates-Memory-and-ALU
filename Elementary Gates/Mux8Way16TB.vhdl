library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8Way16_tb is
end Mux8Way16_tb;

architecture behavioural of Mux8Way16_tb is
	
	signal a_i, b_i, c_i, d_i, e_i, f_i, g_i, h_i, y_o : std_logic_vector(15 downto 0);
	signal sel : std_logic_vector(2 downto 0);
	
	begin
		UUT : entity work.Mux8Way16 port map(
			a_i => a_i, b_i => b_i, c_i => c_i, d_i => d_i, e_i => e_i, f_i => f_i, g_i => g_i, h_i => h_i, sel => sel, y_o => y_o
			);
		
	process begin
		
		--test that the output is selected correctly
		a_i <= x"000F";
		b_i <= x"00F0";
		c_i <= x"00FF";
		d_i <= x"0F00";
		e_i <= x"0F0F";
		f_i <= x"0FF0";
		g_i <= x"0FFF";
		h_i <= x"F000";
		
		sel <= "000";
		
		wait for 1 ns;
		
		assert (y_o = x"000F")
			report "SEL 000 failed, output should be a_i"
			severity error;
		
		sel <= "001";
		
		wait for 1 ns;
		
		assert (y_o = x"00F0")
			report "SEL 001 failed, output should be b_i"
			severity error;
			
		sel <= "010";
		
		wait for 1 ns;
		
		assert (y_o = x"00FF")
			report "SEL 010 failed, output should be c_i"
			severity error;
			
		sel <= "011";
		
		wait for 1 ns;
		
		assert (y_o = x"0F00")
			report "SEL 011 failed, output should be d_i"
			severity error;
			
		sel <= "100";
		
		wait for 1 ns;
		
		assert (y_o = x"0F0F")
			report "SEL 100 failed, output should be e_i"
			severity error;
			
		sel <= "101";
		
		wait for 1 ns;
		
		assert (y_o = x"0FF0")
			report "SEL 101 failed, output should be f_i"
			severity error;
			
		sel <= "110";
		
		wait for 1 ns;
		
		assert (y_o = x"0FFF")
			report "SEL 000 failed, output should be g_i"
			severity error;
			
		sel <= "111";
		
		wait for 1 ns;
		
		assert (y_o = x"F000")
			report "SEL 111 failed, output should be h_i"
			severity error;
		
		
		--test when all inputs are 0xFFFF
		a_i <= x"FFFF";
		b_i <= x"FFFF";
		c_i <= x"FFFF";
		d_i <= x"FFFF";
		e_i <= x"FFFF";
		f_i <= x"FFFF";
		g_i <= x"FFFF";
		h_i <= x"FFFF";
		
		sel <= "000";
		
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 000 failed when all inputs are 0xFFFF, output should be a_i"
			severity error;
		
		sel <= "001";
		
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 001 failed when all inputs are 0xFFFF, output should be b_i"
			severity error;
			
		sel <= "010";
		
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 010 failed when all inputs are 0xFFF, output should be c_i"
			severity error;
			
		sel <= "011";
		
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 011 failed when all inputs are 0xFFFF, output should be d_i"
			severity error;
			
		sel <= "100";
		
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 100 failed when all inputs are 0xFFFF, output should be e_i"
			severity error;
			
		sel <= "101";
		
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 101 failed when all inputs are 0xFFFF, output should be f_i"
			severity error;
			
		sel <= "110";
		
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 000 failed when all inputs are 0xFFFF, output should be g_i"
			severity error;
			
		sel <= "111";
		
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 111 failed when all inputs are 0xFFFF, output should be h_i"
			severity error;
	
	
		--test when all inputs are 0x0000
		a_i <= x"0000";
		b_i <= x"0000";
		c_i <= x"0000";
		d_i <= x"0000";
		e_i <= x"0000";
		f_i <= x"0000";
		g_i <= x"0000";
		h_i <= x"0000";
		
		sel <= "000";
		
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 000 failed when all inputs are 0x0000, output should be 0x0000"
			severity error;
		
		sel <= "001";
		
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 001 failed when all inputs are 0x0000, output should be 0x0000"
			severity error;
			
		sel <= "010";
		
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 010 failed when all inputs are 0x0000, output should be 0x0000"
			severity error;
			
		sel <= "011";
		
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 011 failed when all inputs are 0x0000, output should be 0x0000"
			severity error;
			
		sel <= "100";
		
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 100 failed when all inputs are 0x0000, output should be 0x0000"
			severity error;
			
		sel <= "101";
		
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 101 failed when all inputs are 0x0000, output should be 0x0000"
			severity error;
			
		sel <= "110";
		
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 000 failed when all inputs are 0x0000, output should be 0x0000"
			severity error;
			
		sel <= "111";
		
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 111 failed when all inputs are 0x0000, output should be 0x0000"
			severity error;
			
		report "All tests passed"
		severity note;
		
		wait;
	end process;
end behavioural;