vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../03_sine_wave.gen/sources_1/ip/vio_1/hdl/verilog" "+incdir+../../../../03_sine_wave.gen/sources_1/ip/vio_1/hdl" \
"D:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"D:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../03_sine_wave.gen/sources_1/ip/vio_1/hdl/verilog" "+incdir+../../../../03_sine_wave.gen/sources_1/ip/vio_1/hdl" \
"../../../../03_sine_wave.gen/sources_1/ip/vio_1/sim/vio_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

