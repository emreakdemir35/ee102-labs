vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../Arbitrary_Waveform_Generator_2.gen/sources_1/ip/clk_wiz_0" \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib  -93  \
"c:/Users/Emre Akdemir/Desktop/EE102 Labs/EE102 Lab6/Arbitrary_Waveform_Generator_2/Arbitrary_Waveform_Generator_2.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../Arbitrary_Waveform_Generator_2.srcs/sources_1/new/main_module.vhd" \
"../../../Arbitrary_Waveform_Generator_2.srcs/sim_1/new/testbench.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

