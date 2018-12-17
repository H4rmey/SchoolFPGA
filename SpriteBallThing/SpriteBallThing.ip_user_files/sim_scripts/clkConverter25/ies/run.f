-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../SpriteBallThing.srcs/sources_1/ip/clkConverter25/clkConverter25_clk_wiz.v" \
  "../../../../SpriteBallThing.srcs/sources_1/ip/clkConverter25/clkConverter25.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

