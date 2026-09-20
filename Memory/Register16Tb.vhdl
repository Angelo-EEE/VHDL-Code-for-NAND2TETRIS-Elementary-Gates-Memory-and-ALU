library ieee;
use ieee.std_logic_1164.all;

entity register16_tb is
end entity;

architecture behavioural of register16_tb is
	
	signal clk : std_logic;
	signal load : std_logic;
	signal d_i, q_o : std_logic_vector(15 downto 0);
	
	begin
	UUT : entity work.register16 port map(
		clk => clk,
		load => load,
		d_i => d_i,
		q_o => q_o
		);
		
	clk_process : process
	begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
	end process;
	
	stimulus : process
	begin
		
		--load a value into the register
        d_i <= x"1234";
        load <= '1';

        wait for 10 ns;


        --check value is held when load = 0
        load <= '0';
        d_i <= x"ABCD";

        wait for 10 ns;


        --check if the register can load another value
        load <= '1';

        wait for 10 ns;
		
		wait;
	end process;
end behavioural;