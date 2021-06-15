set_property SRC_FILE_INFO {cfile:/home/njrmar003/riscv/forked_pulpissimo/pulpissimo/fpga/pulpissimo-arty/ips/xilinx_clk_mngr/xilinx_clk_mngr.gen/sources_1/ip/xilinx_clk_mngr/xilinx_clk_mngr.xdc rfile:../ips/xilinx_clk_mngr/xilinx_clk_mngr.gen/sources_1/ip/xilinx_clk_mngr/xilinx_clk_mngr.xdc id:1 order:EARLY scoped_inst:i_pulpissimo/soc_domain_i/pulp_soc_i/i_clk_rst_gen/i_fpga_clk_gen/i_clk_manager/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/njrmar003/riscv/forked_pulpissimo/pulpissimo/fpga/pulpissimo-arty/ips/xilinx_slow_clk_mngr/xilinx_slow_clk_mngr.gen/sources_1/ip/xilinx_slow_clk_mngr/xilinx_slow_clk_mngr.xdc rfile:../ips/xilinx_slow_clk_mngr/xilinx_slow_clk_mngr.gen/sources_1/ip/xilinx_slow_clk_mngr/xilinx_slow_clk_mngr.xdc id:2 order:EARLY scoped_inst:i_pulpissimo/safe_domain_i/i_slow_clk_gen/i_slow_clk_mngr/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/njrmar003/riscv/forked_pulpissimo/pulpissimo/fpga/pulpissimo-arty/constraints/arty.xdc rfile:../constraints/arty.xdc id:3} [current_design]
current_instance i_pulpissimo/soc_domain_i/pulp_soc_i/i_clk_rst_gen/i_fpga_clk_gen/i_clk_manager/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.05
current_instance
current_instance i_pulpissimo/safe_domain_i/i_slow_clk_gen/i_slow_clk_mngr/inst
set_property src_info {type:SCOPED_XDC file:2 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.05
current_instance
set_property src_info {type:XDC file:3 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_case_analysis 0 i_pulpissimo/safe_domain_i/cam_pclk_o
set_property src_info {type:XDC file:3 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_case_analysis 0 i_pulpissimo/safe_domain_i/i2s_slave_sck_o
set_property src_info {type:XDC file:3 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter tck 1.000
set_property src_info {type:XDC file:3 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins i_pulpissimo/soc_domain_i/pulp_soc_i/i_dmi_jtag/i_dmi_cdc/i_cdc_resp/i_src/data_src_q_reg*/C] -to [get_pins i_pulpissimo/soc_domain_i/pulp_soc_i/i_dmi_jtag/i_dmi_cdc/i_cdc_resp/i_dst/data_dst_q_reg*/D] 20.000
set_property src_info {type:XDC file:3 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins i_pulpissimo/soc_domain_i/pulp_soc_i/i_dmi_jtag/i_dmi_cdc/i_cdc_resp/i_src/req_src_q_reg/C] -to [get_pins i_pulpissimo/soc_domain_i/pulp_soc_i/i_dmi_jtag/i_dmi_cdc/i_cdc_resp/i_dst/req_dst_q_reg/D] 20.000
set_property src_info {type:XDC file:3 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins i_pulpissimo/soc_domain_i/pulp_soc_i/i_dmi_jtag/i_dmi_cdc/i_cdc_req/i_dst/ack_dst_q_reg/C] -to [get_pins i_pulpissimo/soc_domain_i/pulp_soc_i/i_dmi_jtag/i_dmi_cdc/i_cdc_req/i_src/ack_src_q_reg/D] 20.000
