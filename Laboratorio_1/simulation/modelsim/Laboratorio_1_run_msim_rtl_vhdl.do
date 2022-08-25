transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_2/full_adder_tb.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_2/adder_4bits_tb.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_2/full_adder.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_2/adder_4bits.vhd}
vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_2/adder_4bits_to_7seg.vhd}

vcom -93 -work work {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_2/adder_4bits_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L cyclonev_hssi -L rtl_work -L work -voptargs="+acc"  adder_4bits_tb

add wave *
view structure
view signals
run -all
