-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Stopwatch
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : F:\Neros\Documents\GitHub\ECE441_final\Stopwatch\compile\stopwatch.vhd
-- Generated   : Thu Apr 17 14:33:28 2025
-- From        : F:\Neros\Documents\GitHub\ECE441_final\Stopwatch\src\stopwatch.bde
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
       Key0 : in STD_LOGIC;
       Clock_50 : in STD_LOGIC;
       Key3 : in STD_LOGIC;
       HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
       HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
       HEX2 : out STD_LOGIC_VECTOR(6 downto 0);
       HEX3 : out STD_LOGIC_VECTOR(6 downto 0)
  );
end stopwatch;

architecture stopwatch of stopwatch is

---- Signal declarations used on the diagram ----

signal bgo : STD_LOGIC;
signal brst : STD_LOGIC;
signal clk_100 : STD_LOGIC;
signal clock : STD_LOGIC;
signal input : STD_LOGIC;
signal reset : STD_LOGIC;
signal n0 : STD_LOGIC_VECTOR(3 downto 0);
signal n1 : STD_LOGIC_VECTOR(3 downto 0);
signal n2 : STD_LOGIC_VECTOR(3 downto 0);
signal n3 : STD_LOGIC_VECTOR(3 downto 0);

begin

---- Terminal assignment ----

    -- Inputs terminals
	clock <= Clock_50;
	reset <= Key0;
	input <= Key3;


end stopwatch;
