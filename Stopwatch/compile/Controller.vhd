-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : 
-- Author      : troyx001
-- Company     : old Dominion University
--
-------------------------------------------------------------------------------
--
-- File        : F:/Neros/Documents/GitHub/ECE441_final/Stopwatch/compile/Controller.vhd
-- Generated   : Thu Apr 17 14:10:47 2025
-- From        : F:/Neros/Documents/GitHub/ECE441_final/Stopwatch/src/Controller.asf
-- By          : Active-HDL 12 FSM Code Generator ver. 6.0
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_signed.all;

entity Controller is 
	port (
		reset: in STD_LOGIC;
		clock: in STD_LOGIC;
		input: in STD_LOGIC;
		brst: out STD_LOGIC;
		bgo: out STD_LOGIC
);
end Controller;

architecture Controller_arch of Controller is

-- BINARY ENCODED state machine: Sreg0
attribute ENUM_ENCODING: string;
type Sreg0_type is (
	S1, S2, S3, S4
);
attribute ENUM_ENCODING of Sreg0_type: type is
	"00 " &		-- S1
	"01 " &		-- S2
	"10 " &		-- S3
	"11" ;		-- S4

signal Sreg0, NextState_Sreg0: Sreg0_type;

begin

-- FSM coverage pragmas
-- Aldec enum Machine_Sreg0 CURRENT=Sreg0
-- Aldec enum Machine_Sreg0 NEXT=NextState_Sreg0
-- Aldec enum Machine_Sreg0 INITIAL_STATE=S1
-- Aldec enum Machine_Sreg0 STATES=S2,S3,S4
-- Aldec enum Machine_Sreg0 TRANS=S1->S1,S1->S2,S2->S2,S2->S3,S3->S3,S3->S4,S4->S1,S4->S4

-- User statements

-- Diagram ACTION

----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (input, Sreg0)
begin
	NextState_Sreg0 <= Sreg0;
	-- Set default values for outputs and signals
	brst <= '0';
	bgo <= '0';
	case Sreg0 is
		when S1 =>
			brst <= '1';
			case input is
				when '1' =>
					NextState_Sreg0 <= S2;
				when others =>
					NextState_Sreg0 <= S1;
			end case;
		when S2 =>
			brst <= '1';
			case input is
				when '0' =>
					NextState_Sreg0 <= S3;
				when others =>
					NextState_Sreg0 <= S2;
			end case;
		when S3 =>
			bgo <= '1';
			case input is
				when '1' =>
					NextState_Sreg0 <= S4;
				when others =>
					NextState_Sreg0 <= S3;
			end case;
		when S4 =>
			case input is
				when '0' =>
					NextState_Sreg0 <= S1;
				when others =>
					NextState_Sreg0 <= S4;
			end case;
--vhdl_cover_off
		when others =>
			null;
--vhdl_cover_on
	end case;
end process;

------------------------------------
-- Current State Logic (sequential)
------------------------------------
Sreg0_CurrentState: process (clock)
begin
	if clock'event and clock = '1' then
		if reset = '0' then
			Sreg0 <= S1;
		else
			Sreg0 <= NextState_Sreg0;
		end if;
	end if;
end process;

end Controller_arch;
