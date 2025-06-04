transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+waveform_generator_tb  -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.waveform_generator_tb xil_defaultlib.glbl

do {waveform_generator_tb.udo}

run 1000ns

endsim

quit -force
