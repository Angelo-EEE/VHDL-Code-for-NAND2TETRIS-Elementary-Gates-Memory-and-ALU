library ieee;
use ieee.std_logic_1164.all;

entity register16 is
	port(
		clk  : in std_logic;
		d_i  : in std_logic_vector(15 downto 0);
		load : in std_logic;
		q_o  : out std_logic_vector(15 downto 0)
		);
		
end register16;

architecture rtl of register16 is
	
	signal reg : std_logic_vector(15 downto 0); -- internal register signal to store registered value as a state and keep output logic of register seperate
	
	begin
	
	process (clk)
	begin
	
		if rising_edge(clk) then
			if load = '1' then	
				reg <= d_i;
			end if;
		end if;
	end process;
	
	q_o <= reg; -- q output is always driven to be the value stored inside of the register
	
end rtl;