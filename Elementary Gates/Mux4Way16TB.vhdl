library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4Way16_tb is
end Mux4Way16_tb;

architecture behavioural of Mux4Way16_tb is
	
	signal a_i, b_i, c_i, d_i, y_o : std_logic_vector(15 downto 0);
	signal sel : std_logic_vector(1 downto 0);
	
	begin
	UUT : entity work.Mux4Way16 port map(
		a_i => a_i, b_i => b_i, c_i => c_i, d_i => d_i, sel => sel, y_o => y_o
		);
		
	process begin
	
		-- Test y_o when sel is 0b00, then 0b01, then 0b10, then 0b11
		a_i <= x"000F";
		b_i <= x"00F0";
		c_i <= x"0F00";
		d_i <= x"F000";
		
		sel <= "00";
		wait for 1 ns;
		
		assert (y_o = x"000F")
			report "SEL 00 failed, output should be a_i"
			severity error;
			
		sel <= "01";
		wait for 1 ns;
		
		assert (y_o = x"00F0")
			report "SEL 01 failed, output should be b_i"
			severity error;
			
		sel <= "10";
		wait for 1 ns;
		
		assert (y_o = x"0F00")
			report "SEL 10 failed, output should be c_i"
			severity error;
			
		sel <= "11";
		wait for 1 ns;
		
		assert (y_o = x"F000")
			report "SEL 11 failed, output should be d_i"
			severity error;
			
		-- Test y_o when sel is 0b00, then 0b01, then 0b10, then 0b11 when all inuts are 0xFFFF
		a_i <= x"FFFF";
		b_i <= x"FFFF";
		c_i <= x"FFFF";
		d_i <= x"FFFF";
		
		sel <= "00";
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 00 failed when all inputs are 0xFFFF, output should be a_i"
			severity error;
			
		sel <= "01";
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 01 failed when all inputs are 0xFFFF, output should be b_i"
			severity error;
			
		sel <= "10";
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 10 failed when all inputs are 0xFFFF, output should be c_i"
			severity error;
			
		sel <= "11";
		wait for 1 ns;
		
		assert (y_o = x"FFFF")
			report "SEL 11 failed when all inputs are 0xFFFF, output should be d_i"
			severity error;	
			
		-- Test y_o when sel is 0b00, then 0b01, then 0b10, then 0b11 when all inuts are 0x0000
		a_i <= x"0000";
		b_i <= x"0000";
		c_i <= x"0000";
		d_i <= x"0000";
		
		sel <= "00";
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 00 failed when all inputs are 0x0000, output should be a_i"
			severity error;
			
		sel <= "01";
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 01 failed when all inputs are 0x0000, output should be b_i"
			severity error;
			
		sel <= "10";
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 10 failed when all inputs are 0x0000, output should be c_i"
			severity error;
			
		sel <= "11";
		wait for 1 ns;
		
		assert (y_o = x"0000")
			report "SEL 11 failed when all inputs are 0x0000, output should be d_i"
			severity error;	
			
		report "All Tests Passed"
		severity note;
		
		wait;
	end process;
end behavioural;