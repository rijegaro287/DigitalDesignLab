onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath_tb/dut/clk
add wave -noupdate /datapath_tb/dut/rst
add wave -noupdate /datapath_tb/dut/inst_mem/memory
add wave -noupdate /datapath_tb/dut/data_mem/memory
add wave -noupdate /datapath_tb/dut/reg_file/registers
add wave -noupdate /datapath_tb/dut/pc_src
add wave -noupdate /datapath_tb/dut/mem_to_reg
add wave -noupdate /datapath_tb/dut/mem_write
add wave -noupdate /datapath_tb/dut/alu_control
add wave -noupdate /datapath_tb/dut/alu_src
add wave -noupdate /datapath_tb/dut/reg_write
add wave -noupdate /datapath_tb/dut/reg_src
add wave -noupdate /datapath_tb/dut/pc
add wave -noupdate /datapath_tb/dut/pc_next
add wave -noupdate /datapath_tb/dut/instruction
add wave -noupdate /datapath_tb/dut/rn
add wave -noupdate /datapath_tb/dut/rm
add wave -noupdate /datapath_tb/dut/rd
add wave -noupdate /datapath_tb/dut/reg_addr_1
add wave -noupdate /datapath_tb/dut/reg_addr_2
add wave -noupdate /datapath_tb/dut/reg_data_1
add wave -noupdate /datapath_tb/dut/reg_data_2
add wave -noupdate /datapath_tb/dut/immediate
add wave -noupdate /datapath_tb/dut/alu_src_b
add wave -noupdate /datapath_tb/dut/alu_result
add wave -noupdate /datapath_tb/dut/result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {283 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 294
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {345 ns}
