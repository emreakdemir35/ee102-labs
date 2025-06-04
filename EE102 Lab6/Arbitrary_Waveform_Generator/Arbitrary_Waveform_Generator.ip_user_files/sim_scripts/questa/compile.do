vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../Arbitrary_Waveform_Generator.gen/sources_1/ip/clk_wiz_0_1" \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../Arbitrary_Waveform_Generator.gen/sources_1/ip/clk_wiz_0_1/clk_wiz_0_sim_netlist.vhdl" \
"../../../Arbitrary_Waveform_Generator.srcs/sources_1/new/clock_main.vhd" \
"../../../Arbitrary_Waveform_Generator.srcs/sim_1/new/testbench.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

