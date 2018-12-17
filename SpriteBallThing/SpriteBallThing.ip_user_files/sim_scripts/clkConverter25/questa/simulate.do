onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clkConverter25_opt

do {wave.do}

view wave
view structure
view signals

do {clkConverter25.udo}

run -all

quit -force
