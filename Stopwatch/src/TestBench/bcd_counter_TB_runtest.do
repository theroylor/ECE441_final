SetActiveLib -work
comp -include "$dsn\src\BCD_counter.vhd" 
comp -include "$dsn\src\TestBench\bcd_counter_TB.vhd" 
asim +access +r TESTBENCH_FOR_bcd_counter 
wave 
wave -noreg clock
wave -noreg reset
wave -noreg enable
wave -noreg n0
wave -noreg n1
wave -noreg n2
wave -noreg n3
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\bcd_counter_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_bcd_counter 
