-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Stopwatch
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : F:\Neros\Documents\GitHub\ECE441_final\Stopwatch\compile\Clock_Gen.vhd
-- Generated   : Tue Apr 22 18:09:34 2025
-- From        : F:\Neros\Documents\GitHub\ECE441_final\Stopwatch\src\Clock_Gen.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;

entity Clock_Gen is
  port(
       reset : in STD_LOGIC;
       clock : in STD_LOGIC;
       clk_100 : out STD_LOGIC
  );
end Clock_Gen;

architecture Clock_Gen of Clock_Gen is

---- Component declarations -----

component clk_div_gen
  generic(
       in_hz : INTEGER := 50000000;
       out_hz : INTEGER := 100
  );
  port(
       reset : in STD_LOGIC;
       clock : in STD_LOGIC;
       clk_100 : out STD_LOGIC
  );
end component;

begin

----  Component instantiations  ----

U1 : clk_div_gen
  port map(
       reset => reset,
       clock => clock,
       clk_100 => clk_100
  );


end Clock_Gen;
