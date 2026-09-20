library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity incrementer16_tb is
end incrementer16_tb;

architecture behavioural of incrementer16_tb is

    signal a_i : signed(15 downto 0);
    signal q_o : signed(15 downto 0);

	begin

		UUT : entity work.incrementer16
			port map (
				a_i => a_i,
				q_o => q_o
			);

		process begin

		-- Test 1: Increment 0 to 1
		a_i <= x"0000";
		wait for 10 ns;
		assert (q_o = x"0001")
			report "Test 1 failed"
			severity error;

		-- Test 2: Increment 1 to 2
		a_i <= x"0001";
		wait for 10 ns;
		assert (q_o = x"0002")
			report "Test 2 failed"
			severity error;

		-- Test 3: Increment 10 to 11
		a_i <= x"000A";
		wait for 10 ns;
		assert (q_o = x"000B")
			report "Test 3 failed"
			severity error;

		-- Test 4: Increment -1 to 0
		a_i <= x"FFFF";
		wait for 10 ns;
		assert (q_o = x"0000")
			report "Test 4 failed"
			severity error;

		-- Test 5: Increment -10 to -9
		a_i <= x"FFF6";
		wait for 10 ns;
		assert q_o = x"FFF7"
			report ("Test 5 failed")
			severity error;

		-- Test 6: Overflow from maximum positive value
		-- 32767 + 1 = -32768
		a_i <= x"7FFF";
		wait for 10 ns;
		assert (q_o = x"8000")
			report "Test 6 failed"
			severity error;

		-- Test 7: Increment minimum negative value
		-- -32768 + 1 = -32767
		a_i <= x"8000";
		wait for 10 ns;
		assert (q_o = x"8001")
			report "Test 7 failed"
			severity error;

		report "All tests passed."
			severity note;

		wait;
	end process;
end behavioural;