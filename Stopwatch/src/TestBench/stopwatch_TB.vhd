library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity stopwatch_tb is
end stopwatch_tb;

architecture TB_ARCHITECTURE of stopwatch_tb is
	-- Component declaration of the tested unit
	component stopwatch
	port(
		Key0 : in STD_LOGIC;
		Clock_50 : in STD_LOGIC;
		Key3 : in STD_LOGIC;
		Hex0 : out STD_LOGIC_VECTOR(6 downto 0);
		Hex1 : out STD_LOGIC_VECTOR(6 downto 0);
		Hex2 : out STD_LOGIC_VECTOR(6 downto 0);
		Hex3 : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Key0 : STD_LOGIC;
	signal Clock_50 : STD_LOGIC;
	signal Key3 : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Hex0 : STD_LOGIC_VECTOR(6 downto 0);
	signal Hex1 : STD_LOGIC_VECTOR(6 downto 0);
	signal Hex2 : STD_LOGIC_VECTOR(6 downto 0);
	signal Hex3 : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...
	constant clock_period : time := 20 ns;
begin

	-- Unit Under Test port map
	UUT : stopwatch
		port map (
			Key0 => Key0,
			Clock_50 => Clock_50,
			Key3 => Key3,
			Hex0 => Hex0,
			Hex1 => Hex1,
			Hex2 => Hex2,
			Hex3 => Hex3
		);

	-- Add your stimulus here ... 
	
clock_process: process
begin
	Clock_50 <= '1'; wait for clock_period/2;
	Clock_50 <= '0'; wait for clock_period/2;
end process;

Stimulus_process: process
begin	 
	Key0 <= '1'; wait for 3 ns;
	
	Key3 <= '0'; wait for 100 ms;
	Key3 <= '1'; wait for 100 ms;
	Key3 <= '0'; wait for 100 ms;
	Key3 <= '1'; wait for 100 ms;
	Key3 <= '0'; wait for 100 ms;
	Key3 <= '1'; wait for 100 ms;
	Key3 <= '0'; wait for 100 ms;
	Key3 <= '1'; wait for 100 ms;
	wait;
end process;

	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_stopwatch of stopwatch_tb is
	for TB_ARCHITECTURE
		for UUT : stopwatch
			use entity work.stopwatch(stopwatch);
		end for;
	end for;
end TESTBENCH_FOR_stopwatch;

