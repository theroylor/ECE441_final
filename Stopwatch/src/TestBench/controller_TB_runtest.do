SetActiveLib -work
comp -include "$dsn\compile\Controller.vhd" 
comp -include "$dsn\src\TestBench\controller_TB.vhd" 
asim +access +r TESTBENCH_FOR_controller 
wave 
wave -noreg reset
wave -noreg clock
wave -noreg input
wave -noreg brst
wave -noreg bgo
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\controller_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_controller 
