-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Stopwatch
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ECE441_final\Stopwatch\compile\stopwatch.vhd
-- Generated   : Tue Apr 15 00:22:03 2025
-- From        : c:\My_Designs\ECE441_final\Stopwatch\src\stopwatch.bde
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

entity stopwatch is
  port(
       CLOCK_50 : in STD_LOGIC;
       KEY0 : in STD_LOGIC;
       KEY3 : in STD_LOGIC;
       HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
       HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
       HEX2 : out STD_LOGIC_VECTOR(6 downto 0);
       HEX3 : out STD_LOGIC_VECTOR(6 downto 0)
  );
end stopwatch;

architecture stopwatch of stopwatch is

begin

end stopwatch;
