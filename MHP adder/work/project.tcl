set projDir "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/planAhead"
set projName "MHP adder"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/mojo_top_0.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/reset_conditioner_1.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/multi_LED_digit_2.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/logic_3.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/counter_4.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/avr_interface_5.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/avr detector_6.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/fsm_tester_7.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/counter_8.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/led_digit_9.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/decoder_10.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/cclk_detector_11.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/spi_slave_12.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/uart_rx_13.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/uart_tx_14.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
