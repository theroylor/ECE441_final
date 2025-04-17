-------------------------------------------------------------------------------
--
-- Title       : clk_div_gen
-- Design      : Stopwatch
-- Author      : troyx001
-- Company     : old Dominion University
--
-------------------------------------------------------------------------------
--
-- File        : F:\Neros\Documents\GitHub\ECE441_final\Stopwatch\src\clk_div_gen.vhd
-- Generated   : Thu Apr 17 16:41:31 2025
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {clk_div_gen} architecture {clk_div_gen}}

library IEEE;
use IEEE.std_logic_1164.all;

entity clk_div_gen is  
	generic(
		in_hz : integer := 50E6;
		out_hz : integer := 100
	);
	 port(
		 reset : in STD_LOGIC;
		 clock : in STD_LOGIC;
		 clk_100 : out STD_LOGIC
	     );
end clk_div_gen;

--}} End of automatically maintained section

architecture behavior of clk_div_gen is
constant max_count : integer := in_hz / out_hz / 2 - 1;
signal count : integer range 0 to max_count; 
signal out_clk : std_logic := '0';


begin

	-- enter your statements here -- 
	process ( reset, clock)
	begin
		if (reset = '0') then  
			out_clk <= '0';
		elsif (count < max_count) then
			count <= count + 1;
		else
			count <= 0;
			out_clk <= not out_clk;
		end if;
	end process;

clk_100 <= out_clk;	   

end behavior;
