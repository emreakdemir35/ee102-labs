# Constraint file sets which input/output in the VHDL code connects to which pin in FPGA.
# Three characters after PACKAGE_PIN gives the FPGA pin which is also written next to all LEDs/Switches on the board.
# The second line (IOSTANDARD LVCMOS33) sets the voltage standard for the pins which is constant and always the same for BASYS3.
set_property PACKAGE_PIN W5 [get_ports clk]  
    set_property IOSTANDARD LVCMOS33 [get_ports clk]  


set_property PACKAGE_PIN V17 [get_ports {i_SW[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_SW[0]}]
set_property PACKAGE_PIN V16 [get_ports {i_SW[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_SW[1]}]
set_property PACKAGE_PIN W16 [get_ports {i_SW[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_SW[2]}]
set_property PACKAGE_PIN W17 [get_ports {i_SW[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_SW[3]}]
set_property PACKAGE_PIN W15 [get_ports {i_SW[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_SW[4]}]
set_property PACKAGE_PIN V15 [get_ports {i_SW[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_SW[5]}]
set_property PACKAGE_PIN W14 [get_ports {i_SW[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_SW[6]}]
set_property PACKAGE_PIN W13 [get_ports {i_SW[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_SW[7]}]
 

# LEDs
set_property PACKAGE_PIN L1 [get_ports {o_LED[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[4]}]
set_property PACKAGE_PIN P1 [get_ports {o_LED[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[3]}]
set_property PACKAGE_PIN N3 [get_ports {o_LED[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[2]}]
set_property PACKAGE_PIN P3 [get_ports {o_LED[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[1]}]
set_property PACKAGE_PIN U3 [get_ports {o_LED[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[0]}]