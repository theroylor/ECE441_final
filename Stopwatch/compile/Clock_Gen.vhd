-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Stopwatch
-- Author      : troyx001
-- Company     : old Dominion University
--
-------------------------------------------------------------------------------
--
-- File        : F:\Neros\Documents\GitHub\ECE441_final\Stopwatch\compile\Clock_Gen.vhd
-- Generated   : Thu Apr 17 14:32:02 2025
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity Clock_Gen is
  port(
       reset : in STD_LOGIC;
       clock : in STD_LOGIC;
       clock_100 : out STD_LOGIC
  );
end Clock_Gen;

architecture Clock_Gen of Clock_Gen is

---- Component declarations -----

component Clock_Div_Gen
  generic(
       hz_in : INTEGER := 50000000;
       hz_out : INTEGER := 100
  );
  port(
       reset : in STD_LOGIC;
       clock : in STD_LOGIC;
       clock_100 : out STD_LOGIC
  );
end component;

begin

----  Component instantiations  ----

U1 : Clock_Div_Gen
  port map(
       reset => reset,
       clock => clock,
       clock_100 => clock_100
  );


end Clock_Gen;
