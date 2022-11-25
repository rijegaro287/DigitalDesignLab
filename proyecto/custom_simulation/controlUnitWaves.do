onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_unit_tb/dut/clk
add wave -noupdate /control_unit_tb/dut/cond
add wave -noupdate /control_unit_tb/dut/op
add wave -noupdate /control_unit_tb/dut/funct
add wave -noupdate /control_unit_tb/dut/rd
add wave -noupdate /control_unit_tb/dut/alu_flags
add wave -noupdate /control_unit_tb/dut/pc_src
add wave -noupdate /control_unit_tb/dut/mem_to_reg
add wave -noupdate /control_unit_tb/dut/mem_write
add wave -noupdate /control_unit_tb/dut/alu_control
add wave -noupdate /control_unit_tb/dut/alu_src
add wave -noupdate /control_unit_tb/dut/reg_write
add wave -noupdate /control_unit_tb/dut/reg_src
add wave -noupdate /control_unit_tb/dut/cond_logic/cond_ex
add wave -noupdate /control_unit_tb/dut/flag_w
add wave -noupdate /control_unit_tb/dut/cond_logic/flags
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 321
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
WaveRestoreZoom {0 ns} {200 ns}
