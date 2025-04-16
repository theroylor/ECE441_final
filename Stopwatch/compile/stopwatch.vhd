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
-- Generated   : Wed Apr 16 18:19:38 2025
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

---- Component declarations -----

component BCD_counter
  port(
       clock : in STD_LOGIC;
       reset : in STD_LOGIC;
       enable : in STD_LOGIC;
       n0 : out STD_LOGIC_VECTOR(3 downto 0);
       n1 : out STD_LOGIC_VECTOR(3 downto 0);
       n2 : out STD_LOGIC_VECTOR(3 downto 0);
       n3 : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component Clock_Gen
  generic(
       clk_divisor : INTEGER := 500000
  );
  port(
       reset : in STD_LOGIC;
       clock : in STD_LOGIC;
       clock_100 : out STD_LOGIC
  );
end component;
component Controller
  port(
       reset : in STD_LOGIC;
       clock : in STD_LOGIC;
       input : in STD_LOGIC;
       brst : out STD_LOGIC;
       bgo : out STD_LOGIC
  );
end component;
component sevenseg
  port(
       a : in STD_LOGIC_VECTOR(3 downto 0);
       y : out STD_LOGIC_VECTOR(6 downto 0)
  );
end component;

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

----  Component instantiations  ----

U1 : Controller
  port map(
       reset => reset,
       clock => clock,
       input => input,
       brst => brst,
       bgo => bgo
  );

reset <= not(Key0);

U2 : sevenseg
  port map(
       a => n0,
       y => HEX0
  );

U3 : sevenseg
  port map(
       a => n1,
       y => HEX1
  );

U4 : sevenseg
  port map(
       a => n2,
       y => HEX2
  );

U5 : sevenseg
  port map(
       a => n3,
       y => HEX3
  );

U6 : BCD_counter
  port map(
       clock => clk_100,
       reset => brst,
       enable => bgo,
       n0 => n0,
       n1 => n1,
       n2 => n2,
       n3 => n3
  );

U7 : Clock_Gen
  port map(
       reset => reset,
       clock => clock,
       clock_100 => clk_100
  );


---- Terminal assignment ----

    -- Inputs terminals
	clock <= Clock_50;
	input <= Key3;


end stopwatch;
