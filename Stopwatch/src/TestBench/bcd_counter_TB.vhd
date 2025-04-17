library ieee;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity bcd_counter_tb is
end bcd_counter_tb;

architecture TB_ARCHITECTURE of bcd_counter_tb is
	-- Component declaration of the tested unit
	component bcd_counter
	port(
		clock : in STD_LOGIC;
		reset : in STD_LOGIC;
		enable : in STD_LOGIC;
		n0 : out STD_LOGIC_VECTOR(3 downto 0);
		n1 : out STD_LOGIC_VECTOR(3 downto 0);
		n2 : out STD_LOGIC_VECTOR(3 downto 0);
		n3 : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clock : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal enable : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal n0 : STD_LOGIC_VECTOR(3 downto 0);
	signal n1 : STD_LOGIC_VECTOR(3 downto 0);
	signal n2 : STD_LOGIC_VECTOR(3 downto 0);
	signal n3 : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...
	signal clock_period :  time := 10 ms;
begin

	-- Unit Under Test port map
	UUT : bcd_counter
		port map (
			clock => clock,
			reset => reset,
			enable => enable,
			n0 => n0,
			n1 => n1,
			n2 => n2,
			n3 => n3
		);

	-- Add your stimulus here ...
clock_process: process
begin
	clock <= '1'; wait for clock_period/2;
	clock <= '0'; wait for clock_period/2;
end process;

Stimulus_process: process
begin	
	reset<= '0';
	enable <= '0'; wait for 1000 * clock_period;
	enable <= '1'; wait for 1000 * clock_period;
	reset<= '1'; wait for 250 * clock_period;
	enable <= '0'; wait for 250 * clock_period;
	enable <= '1'; wait for 250 * clock_period;
	reset <= '0'; wait for 250 * clock_period;
	wait;
end process; 

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_bcd_counter of bcd_counter_tb is
	for TB_ARCHITECTURE
		for UUT : bcd_counter
			use entity work.bcd_counter(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_bcd_counter;

