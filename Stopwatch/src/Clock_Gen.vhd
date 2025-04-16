library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_signed.all;

entity Clock_Gen is 
	port (
		reset: in STD_LOGIC;
		clock: in STD_LOGIC;  
		clock_100: out std_logic
);
end Clock_Gen; 

architecture behavioral of Clock_Gen is
signal count: integer range 0 to 50000000 :=0;
signal flag : std_logic;
signal clk_out: std_logic :='0';
begin
process(reset, clock)
begin
  	if(reset = '1') then
		  count <= 0;
		  clock_100 <= '0';
		  flag <= '0' ;
	elsif (clock'event and clock ='1') then
		if count = 50000000 then
			count <= 0;
			flag <= '1';
		else
			count <= count + 1;
			flag <= '0';
		end if;
	end if;
end process;

process(flag) 
begin
if (flag = '1') then
	clk_out <= not clk_out;
end if;	  
end process;

clock_100 <= clk_out;
end architecture;