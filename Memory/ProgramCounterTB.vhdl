library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter_tb is
end program_counter_tb;

architecture behavioural of program_counter_tb is

	signal clk, load, increment, reset : std_logic;
	signal input, output : std_logic_vector(15 downto 0);
	
	begin
	
		UUT : entity work.program_counter port map(
			clk => clk,
			load => load,
			increment => increment,
			reset => reset,
			
			input => input,
			output => output
			);
			
	clk_process : process
	begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
	end process;
	
	stimuli : process
	begin
		
		--test if load, increment and reset = 0 then nothing happens within the pc
		load <= '0';
		increment <= '0';
		reset <= '0';
		
		input <= x"1234";
		wait for 10 ns;
		
		--test if load = 1 then the input is loaded into the pc
		load <= '1';
		wait for 10 ns;
		
		--test if increment = 1 then pc increments
		load <= '0';
		increment <= '1';
		wait for 10 ns;
		
		--test if the pc can reset
		reset <= '1';
		increment <= '0';
		wait for 10 ns;
		
		--test new value can be loaded after reset
		reset <= '0';
		input <= x"349F";
		load <= '1';
		wait for 10 ns;
		
		wait;
	end process;
	
end behavioural;