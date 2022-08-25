transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/aux {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/aux/bcd_deco.sv}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/full_adder_tb.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/adder_4bits_to_7seg_tb.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/adder_4bits_tb.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/adder_4bits_to_7seg.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/adder_4bits.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/full_adder.vhd}

vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/laboratorio_1/problema_2/src/adder_4bits_to_7seg_tb.vhd}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  adder_4bits_to_7seg_tb

add wave *
view structure
view signals
run -all
