transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_1 {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_1/BCD_DECO.sv}

vlog -sv -work work +incdir+/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_1 {/home/rijegaro/Escritorio/taller_de_diseno_digital/RGatgens_ATrejos_digital_design_lab_2022/Laboratorio_1/problema_1/BCD_DECO_TB.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  BCD_DECO_TB

add wave *
view structure
view signals
run -all
