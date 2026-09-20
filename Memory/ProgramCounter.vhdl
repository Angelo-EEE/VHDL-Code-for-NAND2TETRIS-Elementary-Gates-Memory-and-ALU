library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter is
	port(
		clk : in std_logic;
		load : in std_logic;
		increment : in std_logic;
		reset : in std_logic;
		
		input : in std_logic_vector(15 downto 0);
		output : out std_logic_vector(15 downto 0)
		);
end program_counter;

architecture rtl of program_counter is

	signal pc_reg : std_logic_vector(15 downto 0);
	begin
	
	process (clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				pc_reg <= x"0000";
			
			else if load = '1' then
				pc_reg <= input;
			
			else if increment = '1' then
				pc_reg <= std_logic_vector(unsigned(pc_reg) + 1);
				
			end if;
			end if;
			end if;
		end if;
		
		end process;
		
		output <= pc_reg;

end rtl;