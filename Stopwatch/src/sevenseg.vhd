library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_signed.all;

entity Controller is 
	port (
		n: in STD_LOGIC_vector(3 downto 0);
		: in STD_LOGIC;
		input: in STD_LOGIC;
		brst: out STD_LOGIC;
		bgo: out STD_LOGIC
);
end Controller;