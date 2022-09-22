## Generated SDC file "ALU.out.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

## DATE    "Wed Oct 14 19:42:11 2020"

##
## DEVICE  "5CSEBA6U19C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 100.000 -waveform { 0.000 4.000 } [get_ports {clk*}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -setup 0.180  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -setup 0.180  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -setup 0.180  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -setup 0.180  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -hold 0.080  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {a[0]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {a[0]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {a[1]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {a[1]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {a[2]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {a[2]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {a[3]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {a[3]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {a[4]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {a[4]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {a[5]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {a[5]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {a[6]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {a[6]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {b[0]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {b[0]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {b[1]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {b[1]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {b[2]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {b[2]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {b[3]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {b[3]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {b[4]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {b[4]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {b[5]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {b[5]}]
set_input_delay -add_delay -max -clock [get_clocks {clk}]  3.000 [get_ports {b[6]}]
set_input_delay -add_delay -min -clock [get_clocks {clk}]  2.000 [get_ports {b[6]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {_carry}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {_carry}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {negative}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {negative}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {overflow}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {overflow}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {resultado[0]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {resultado[0]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {resultado[1]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {resultado[1]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {resultado[2]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {resultado[2]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {resultado[3]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {resultado[3]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {resultado[4]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {resultado[4]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {resultado[5]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {resultado[5]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {resultado[6]}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {resultado[6]}]
set_output_delay -add_delay -max -clock [get_clocks {clk}]  2.000 [get_ports {zero}]
set_output_delay -add_delay -min -clock [get_clocks {clk}]  1.000 [get_ports {zero}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

