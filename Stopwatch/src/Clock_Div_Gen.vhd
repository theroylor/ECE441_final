library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_signed.all;

entity Clock_Div_Gen is 
	generic(
		hz_in : integer := 50E6;
		hz_out : integer := 100
	);
	port (
		reset: in STD_LOGIC;
		clock: in STD_LOGIC;  
		clock_100: out std_logic
	);
end Clock_Div_Gen; 

architecture behavioral of Clock_Div_Gen is	

constant max_count : integer := hz_in / hz_out / 2 - 1;
signal count: integer range 0 to max_count :=0;
signal clk_out: std_logic :='0';   

begin
	process(reset, clock)
	begin
	  	if(reset = '0') then
			  count <= 0;
			  clk_out <= '0';
		elsif (clock'event and clock ='1') then
			if count < max_count then	
				count <= count + 1;
				clk_out <= not clk_out;
			else
				count <= 0;	
			end if;
		end if;
	end process;

clock_100 <= clk_out; 

end architecture;