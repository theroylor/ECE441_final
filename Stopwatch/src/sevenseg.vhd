library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_signed.all;

entity sevenseg is 
	port (
		a: in STD_LOGIC_vector(3 downto 0);
		y: out STD_LOGIC_vector(6 downto 0)
);
end sevenseg; 

architecture behavioral of sevenseg is
begin
	process(a)
	begin
	    case a is
	        when x"0" => 
				y <= not "0111111";
	        when x"1" => 
				y <= not "0000110";
	        when x"2" => 
				y <= not "1011011";
	        when x"3" => 
				y <= not "1001111";
	        when x"4" => 
				y <= not "1100110";
	        when x"5" => 
				y <= not "1101101";
	        when x"6" => 
				y <= not "1111101";
	        when x"7" => 
				y <= not "0000111";
	        when x"8" => 
				y <= not "1111111";
	        when x"9" => 
				y <= not "1101111";
	        when x"a" => 
				y <= not "1110111";
	        when x"b" => 
				y <= not "1111100";
	        when x"c" => 
				y <= not "0111001";
	        when x"d" => 
				y <= not "1011110";
	        when x"e" => 
			y <= not "1111001";
	        when x"f" => 
				y <= not "1110001";
	        when others => 
				y <= not "0000000";
	    end case;  
	end process;
end architecture;