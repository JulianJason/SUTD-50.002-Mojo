set projDir "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/planAhead"
set projName "MHP adder"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/mojo_top_0.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/reset_conditioner_1.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/button_conditioner_2.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/button_conditioner_2.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/edge_detector_4.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/edge_detector_4.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/multi_LED_digit_6.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/logic_7.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/counter_8.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/avr_interface_9.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/avr detector_10.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/fsm_tester_11.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/pipeline_12.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/pipeline_12.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/counter_14.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/led_digit_15.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/decoder_16.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/cclk_detector_17.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/spi_slave_18.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/uart_rx_19.v" "D:/GitHub/SUTD-50.002-Mojo/MHP adder/work/verilog/uart_tx_20.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/GitHub/SUTD-50.002-Mojo/MHP\ adder/constraint/adder_in_out.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
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
