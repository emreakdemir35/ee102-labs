transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../Arbitrary_Waveform_Generator_3.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  \
"../../../Arbitrary_Waveform_Generator_3.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.vhdl" \
"../../../Arbitrary_Waveform_Generator_3.srcs/sources_1/new/top_module.vhd" \
"../../../Arbitrary_Waveform_Generator_3.srcs/sim_1/new/testbench.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

