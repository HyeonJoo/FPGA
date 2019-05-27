library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Nemerically controlled oscillator

entity nco is
port(	CLK_IN		: in std_logic;
		RST			: in std_logic;
		N			: in std_logic_vector(15 downto 0);
		CLK_OUT		: out std_logic);
end nco;

architecture BEHAVE of nco is
signal nco_register : std_logic_vector(15 downto 0);
begin
	process(CLK_IN, RST)
	begin
		if RST = '1' then
			nco_register <= (others => '0');
		elsif CLK_IN = '1' and CLK_IN'event then
			nco_register <= nco_register + N;
		end if;
	end process;

	CLK_OUT <= nco_register(15);
	
end BEHAVE;
