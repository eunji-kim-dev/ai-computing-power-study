onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_led_shift/clk
add wave -noupdate -radix hexadecimal /tb_led_shift/led
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
WaveRestoreZoom {999323600 ps} {1000035600 ps}
