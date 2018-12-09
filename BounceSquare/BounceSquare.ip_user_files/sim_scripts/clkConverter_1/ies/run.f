-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../BounceSquare.srcs/sources_1/ip/clkConverter_1/clkConverter_clk_wiz.v" \
  "../../../../BounceSquare.srcs/sources_1/ip/clkConverter_1/clkConverter.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

