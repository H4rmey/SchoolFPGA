set_property SRC_FILE_INFO {cfile:c:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/SpriteBallThing/SpriteBallThing.srcs/sources_1/ip/clkConverter/clkConverter.xdc rfile:../../../SpriteBallThing.srcs/sources_1/ip/clkConverter/clkConverter.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clkIn]] 0.1
