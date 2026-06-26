transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../02_sine_wave.gen/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../02_sine_wave.gen/sources_1/ip/vio_0/hdl" -l xil_defaultlib \
"../../../../02_sine_wave.gen/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

