library ieee;
use ieee.STD_LOGIC_SIGNED.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity controller_tb is
end controller_tb;

architecture TB_ARCHITECTURE of controller_tb is
	-- Component declaration of the tested unit
	component controller
	port(
		reset : in STD_LOGIC;
		clock : in STD_LOGIC;
		input : in STD_LOGIC;
		brst : out STD_LOGIC;
		bgo : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal reset : STD_LOGIC;
	signal clock : STD_LOGIC;
	signal input : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal brst : STD_LOGIC;
	signal bgo : STD_LOGIC;

	-- Add your code here ...

	constant clock_period : time := 20 ns;
begin

	-- Unit Under Test port map
	UUT : controller
		port map (
			reset => reset,
			clock => clock,
			input => input,
			brst => brst,
			bgo => bgo
		);

	-- Add your stimulus here ...
clock_process: process
begin
	clock <= '1'; wait for clock_period/2;
	clock <= '0'; wait for clock_period/2;
end process;

Stimulus_process: process
begin	 
	reset <= '1'; wait for 3 ns;
	
	input <= '0'; wait for 100 ns;
	input <= '1'; wait for 100 ns;
	input <= '0'; wait for 100 ns;
	input <= '1'; wait for 100 ns;
	input <= '0'; wait for 100 ns;
	input <= '1'; wait for 100 ns;
	input <= '0'; wait for 100 ns;
	reset <= '0'; wait for 100 ns;
	reset <= '1'; wait for 100 ns;
	wait;
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_controller of controller_tb is
	for TB_ARCHITECTURE
		for UUT : controller
			use entity work.controller(controller_arch);
		end for;
	end for;
end TESTBENCH_FOR_controller;

