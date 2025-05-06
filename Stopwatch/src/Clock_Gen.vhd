-------------------------------------------------------------------------------
--
-- Title       : Clock_Gen
-- Design      : Stopwatch
-- Author      : troyx001
-- Company     : old Dominion University
--
-------------------------------------------------------------------------------
--
-- File        : F:\Neros\Documents\GitHub\ECE441_final\Stopwatch\src\Clock_Gen.vhd
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
--{entity {Clock_Gen} architecture {Clock_Gen}}

library IEEE;
use IEEE.std_logic_1164.all;

entity Clock_Gen is  
	generic(
		in_hz : integer := 50E6;
		out_hz : integer := 100
	);
	 port(
		 reset : in STD_LOGIC;
		 clock : in STD_LOGIC;
		 clk_100 : out STD_LOGIC
	     );
end Clock_Gen;

--}} End of automatically maintained section

architecture behavior of Clock_Gen is
constant max_count : integer := in_hz / out_hz / 2 -1;
signal count : integer range 0 to max_count; 
signal out_clk : std_logic := '0';


begin

	-- enter your statements here -- 
	process ( reset, clock)
	begin
		if (reset = '0') then  
			out_clk <= '0';
			count <= 0;
		elsif (clock'event and clock = '1') then 
			if (count < max_count) then
				count <= count + 1;
			else
				count <= 0;
				out_clk <= not out_clk;
			end if;
		end if;
	end process;

clk_100 <= out_clk;	   

end behavior;
