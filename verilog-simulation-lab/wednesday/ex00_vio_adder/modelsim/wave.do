onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_adder32/a
add wave -noupdate -radix unsigned /tb_adder32/b
add wave -noupdate -color Gold -radix unsigned -childformat {{{/tb_adder32/result[32]} -radix unsigned} {{/tb_adder32/result[31]} -radix unsigned} {{/tb_adder32/result[30]} -radix unsigned} {{/tb_adder32/result[29]} -radix unsigned} {{/tb_adder32/result[28]} -radix unsigned} {{/tb_adder32/result[27]} -radix unsigned} {{/tb_adder32/result[26]} -radix unsigned} {{/tb_adder32/result[25]} -radix unsigned} {{/tb_adder32/result[24]} -radix unsigned} {{/tb_adder32/result[23]} -radix unsigned} {{/tb_adder32/result[22]} -radix unsigned} {{/tb_adder32/result[21]} -radix unsigned} {{/tb_adder32/result[20]} -radix unsigned} {{/tb_adder32/result[19]} -radix unsigned} {{/tb_adder32/result[18]} -radix unsigned} {{/tb_adder32/result[17]} -radix unsigned} {{/tb_adder32/result[16]} -radix unsigned} {{/tb_adder32/result[15]} -radix unsigned} {{/tb_adder32/result[14]} -radix unsigned} {{/tb_adder32/result[13]} -radix unsigned} {{/tb_adder32/result[12]} -radix unsigned} {{/tb_adder32/result[11]} -radix unsigned} {{/tb_adder32/result[10]} -radix unsigned} {{/tb_adder32/result[9]} -radix unsigned} {{/tb_adder32/result[8]} -radix unsigned} {{/tb_adder32/result[7]} -radix unsigned} {{/tb_adder32/result[6]} -radix unsigned} {{/tb_adder32/result[5]} -radix unsigned} {{/tb_adder32/result[4]} -radix unsigned} {{/tb_adder32/result[3]} -radix unsigned} {{/tb_adder32/result[2]} -radix unsigned} {{/tb_adder32/result[1]} -radix unsigned} {{/tb_adder32/result[0]} -radix unsigned}} -subitemconfig {{/tb_adder32/result[32]} {-color Gold -radix unsigned} {/tb_adder32/result[31]} {-color Gold -radix unsigned} {/tb_adder32/result[30]} {-color Gold -radix unsigned} {/tb_adder32/result[29]} {-color Gold -radix unsigned} {/tb_adder32/result[28]} {-color Gold -radix unsigned} {/tb_adder32/result[27]} {-color Gold -radix unsigned} {/tb_adder32/result[26]} {-color Gold -radix unsigned} {/tb_adder32/result[25]} {-color Gold -radix unsigned} {/tb_adder32/result[24]} {-color Gold -radix unsigned} {/tb_adder32/result[23]} {-color Gold -radix unsigned} {/tb_adder32/result[22]} {-color Gold -radix unsigned} {/tb_adder32/result[21]} {-color Gold -radix unsigned} {/tb_adder32/result[20]} {-color Gold -radix unsigned} {/tb_adder32/result[19]} {-color Gold -radix unsigned} {/tb_adder32/result[18]} {-color Gold -radix unsigned} {/tb_adder32/result[17]} {-color Gold -radix unsigned} {/tb_adder32/result[16]} {-color Gold -radix unsigned} {/tb_adder32/result[15]} {-color Gold -radix unsigned} {/tb_adder32/result[14]} {-color Gold -radix unsigned} {/tb_adder32/result[13]} {-color Gold -radix unsigned} {/tb_adder32/result[12]} {-color Gold -radix unsigned} {/tb_adder32/result[11]} {-color Gold -radix unsigned} {/tb_adder32/result[10]} {-color Gold -radix unsigned} {/tb_adder32/result[9]} {-color Gold -radix unsigned} {/tb_adder32/result[8]} {-color Gold -radix unsigned} {/tb_adder32/result[7]} {-color Gold -radix unsigned} {/tb_adder32/result[6]} {-color Gold -radix unsigned} {/tb_adder32/result[5]} {-color Gold -radix unsigned} {/tb_adder32/result[4]} {-color Gold -radix unsigned} {/tb_adder32/result[3]} {-color Gold -radix unsigned} {/tb_adder32/result[2]} {-color Gold -radix unsigned} {/tb_adder32/result[1]} {-color Gold -radix unsigned} {/tb_adder32/result[0]} {-color Gold -radix unsigned}} /tb_adder32/result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {247000 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {73500 ps}
