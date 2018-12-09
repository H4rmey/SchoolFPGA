# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_param synth.incrementalSynthesisCache C:/Users/hammi/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-9456-DESKTOP-7MRF67A/incrSyn
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.cache/wt [current_project]
set_property parent.project_path C:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/new/SpriteRender.vhd
  C:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/imports/Desktop/vga.vhd
  C:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/new/main.vhd
}
read_ip -quiet c:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/ip/clkConverter_1/clkConverter.xci
set_property used_in_implementation false [get_files -all c:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/ip/clkConverter_1/clkConverter_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/ip/clkConverter_1/clkConverter.xdc]
set_property used_in_implementation false [get_files -all c:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/sources_1/ip/clkConverter_1/clkConverter_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/constrs_1/new/vga_output.xdc
set_property used_in_implementation false [get_files C:/Users/hammi/OneDrive/Documenten/bitbucket/SchoolFPGA/BounceSquare/BounceSquare.srcs/constrs_1/new/vga_output.xdc]


synth_design -top main -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef main.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb"
