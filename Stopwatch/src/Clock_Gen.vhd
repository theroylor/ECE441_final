library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_signed.all;

entity Clock_Gen is 
	generic(clk_divisor : integer := 5E5);
	port (
		reset: in STD_LOGIC;
		clock: in STD_LOGIC;  
		clock_100: out std_logic
);
end Clock_Gen; 

architecture behavioral of Clock_Gen is
signal count: integer range 0 to clk_divisor :=0;
signal clk_out: std_logic :='0';
begin
process(reset, clock)
begin
  	if(reset = '1') then
		  count <= 0;
		  clk_out <= '0';
	elsif (clock'event and clock ='1') then
		if count = clk_divisor then
			count <= 0;
			clk_out <= not clk_out;
		else
			count <= count + 1;
		end if;
	end if;
end process;

clock_100 <= clk_out;
end architecture;