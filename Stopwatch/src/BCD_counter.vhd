library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_signed.all;	  
use ieee.numeric_std.all;

entity BCD_counter is 
	port (
	clock: in STD_LOGIC;
	reset: in STD_LOGIC;
	enable: in STD_LOGIC;
	n0: out STD_LOGIC_vector(3 downto 0);
	n1: out STD_LOGIC_vector(3 downto 0);
	n2: out STD_LOGIC_vector(3 downto 0);
	n3: out STD_LOGIC_vector(3 downto 0)
);
end BCD_counter; 

architecture behavioral of BCD_counter is
signal count : integer range 0 to 10E3;
begin
count_process:process(clock,reset,enable)	
begin
if reset = '1' then
	count <= 0;
elsif clock = '1' and clock'event and enable = '1' then
	if count = 10E3 then
		count <= 0;
	else
	count <= count +1;
	end if;
end if;
end process;
output_process:process (count)
begin
	n0 <= std_logic_vector(to_unsigned((count/1E0) mod 10, 4));	
	n1 <= std_logic_vector(to_unsigned((count/1E1) mod 10, 4));
	n2 <= std_logic_vector(to_unsigned((count/1E2) mod 10, 4));
	n3 <= std_logic_vector(to_unsigned((count/1E3) mod 10, 4));
end process;
end architecture;