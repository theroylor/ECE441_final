SetActiveLib -work
comp -include "$dsn\compile\stopwatch.vhd" 
comp -include "$dsn\src\TestBench\stopwatch_TB.vhd" 
asim +access +r TESTBENCH_FOR_stopwatch 
wave 
wave -noreg Key0
wave -noreg Clock_50
wave -noreg Key3
wave -noreg Hex0
wave -noreg Hex1
wave -noreg Hex2
wave -noreg Hex3
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\stopwatch_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_stopwatch 
