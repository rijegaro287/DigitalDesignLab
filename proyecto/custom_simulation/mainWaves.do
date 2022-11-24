onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /main_tb/dut/clk
add wave -noupdate /main_tb/dut/rst
add wave -noupdate /main_tb/dut/cond
add wave -noupdate /main_tb/dut/op
add wave -noupdate /main_tb/dut/funct
add wave -noupdate /main_tb/dut/rd
add wave -noupdate /main_tb/dut/alu_flags
add wave -noupdate /main_tb/dut/pc_src
add wave -noupdate /main_tb/dut/mem_to_reg
add wave -noupdate /main_tb/dut/mem_write
add wave -noupdate /main_tb/dut/alu_control
add wave -noupdate /main_tb/dut/alu_src
add wave -noupdate /main_tb/dut/reg_write
add wave -noupdate /main_tb/dut/reg_src
add wave -noupdate /main_tb/dut/datapath/inst_mem/memory
add wave -noupdate /main_tb/dut/datapath/data_mem/memory
add wave -noupdate /main_tb/dut/datapath/reg_file/registers
add wave -noupdate /main_tb/dut/datapath/pc
add wave -noupdate /main_tb/dut/datapath/pc_next
add wave -noupdate /main_tb/dut/datapath/rn
add wave -noupdate /main_tb/dut/datapath/rm
add wave -noupdate /main_tb/dut/datapath/rd
add wave -noupdate /main_tb/dut/datapath/reg_addr_1
add wave -noupdate /main_tb/dut/datapath/reg_addr_2
add wave -noupdate /main_tb/dut/datapath/reg_data_1
add wave -noupdate /main_tb/dut/datapath/reg_data_2
add wave -noupdate /main_tb/dut/datapath/immediate
add wave -noupdate /main_tb/dut/datapath/alu_result
add wave -noupdate /main_tb/dut/datapath/result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {201 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 387
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
WaveRestoreZoom {0 ns} {158 ns}
