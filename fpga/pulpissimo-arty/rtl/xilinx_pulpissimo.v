//-----------------------------------------------------------------------------
// Title         : PULPissimo Verilog Wrapper
//-----------------------------------------------------------------------------
// File          : xilinx_pulpissimo.v
// Author        : Manuel Eggimann  <meggimann@iis.ee.ethz.ch>
// Created       : 21.05.2019
//-----------------------------------------------------------------------------
// Description :
// Verilog Wrapper of PULPissimo to use the module within Xilinx IP integrator.
//-----------------------------------------------------------------------------
// Copyright (C) 2013-2019 ETH Zurich, University of Bologna
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//-----------------------------------------------------------------------------

// Edited by Mark Njoroge
// Porting to Arty-A7 100T

module xilinx_pulpissimo
  (
   //input wire  ref_clk_p,
   //input wire  ref_clk_n,
   input wire sys_clk,  //system clock, gotten from nexys 4 xdc file.
	
   inout wire  pad_spim_sdio0,
   inout wire  pad_spim_sdio1,
   inout wire  pad_spim_sdio2,
   inout wire  pad_spim_sdio3,
   inout wire  pad_spim_csn0,
   inout wire  pad_spim_sck,

   inout wire  pad_uart_rx, //Mapped to uart_rx
   inout wire  pad_uart_tx, //Mapped to uart_tx

   inout wire  led0_o, //Mapped to spim_csn1
   inout wire  led1_o, //Mapped to cam_pclk
   inout wire  led2_o, //Mapped to cam_hsync
   inout wire  led3_o, //Mapped to cam_data0

   inout wire  switch0_i, //Mapped to cam_data1
   inout wire  switch1_i, //Mapped to cam_data2

   inout wire  btn0_i, //Mapped to cam_data3
   inout wire  btn1_i, //Mapped to cam_data4
   inout wire  btn2_i, //Mapped to cam_data5
   inout wire  btn3_i, //Mapped to cam_data6
   inout wire  switch3_i, //Mapped to cam_data7

	//don't need OLED SCreen
//   inout wire  oled_spim_sck_o, //Mapped to spim_sck
//   inout wire  oled_spim_mosi_o, //Mapped to spim_sdio0
//   inout wire  oled_rst_o, //Mapped to i2s0_sck
//   inout wire  oled_dc_o, //Mapped to i2s0_ws
//   inout wire  oled_vbat_o, // Mapped to i2s0_sdi
//   inout wire  oled_vdd_o, // Mapped to i2s1_sdi
   
   inout wire  pad_i2s0_sck,
   inout wire  pad_i2s0_ws,
   inout wire  pad_i2s0_sdi,
   inout wire  pad_i2s1_sdi,

   inout wire  sdio_reset_o, //Reset signal for SD card need to be driven low to
                             //power the onboard sd-card. Mapped to cam_vsync.
   inout wire  pad_sdio_clk,
   inout wire  pad_sdio_cmd,
   inout wire  pad_sdio_data0,
   inout wire  pad_sdio_data1,
   inout wire  pad_sdio_data2,
   inout wire  pad_sdio_data3,

   inout wire  pad_i2c0_sda,
   inout wire  pad_i2c0_scl,

   input wire  pad_reset_n,
   inout wire  pad_bootsel,

   input wire  pad_jtag_tck,
   input wire  pad_jtag_tdi,
   output wire pad_jtag_tdo,
   input wire  pad_jtag_tms
   //input wire  pad_jtag_trst
 );

  localparam CORE_TYPE = 0; // 0 for RISCY, 1 for IBEX RV32IMC (formerly ZERORISCY), 2 for IBEX RV32EC (formerly MICRORISCY)
  localparam USE_FPU   = 1;
  localparam USE_HWPE = 0;

  wire        ref_clk;
  wire        tck_int;

  // Fake SD Card stuff
 // wire  sdio_reset_o; //Reset signal for SD card need to be driven low to
                             //power the onboard sd-card. Mapped to cam_vsync.
  //wire  pad_sdio_clk;
  //wire  pad_sdio_cmd;
  //wire  pad_sdio_data0;
  //wire  pad_sdio_data1;
  //wire  pad_sdio_data2;
  //wire  pad_sdio_data3;

  //Differential to single ended clock conversion, genesys version
  //IBUFGDS
  //  #(
   //   .IOSTANDARD("LVDS"),
   //   .DIFF_TERM("FALSE"),
   //   .IBUF_LOW_PWR("FALSE"))
//  i_sysclk_iobuf
  //  (
  //   .I(ref_clk_p),
  //   .IB(ref_clk_n),
  //   .O(ref_clk)
  //   );

  // Input clock buffer, nexys4ddr version. hopefully compatitable with Arty 100T
  IBUFG
    #(
      .IOSTANDARD("LVCMOS33"),
      .IBUF_LOW_PWR("FALSE"))
  i_sysclk_iobuf
    (
     .I(sys_clk),
     .O(ref_clk)
     );

	//JTAG TCK clock buffer (dedicated route is false in constraints)
	IBUF i_tck_iobuf (
		  .I(pad_jtag_tck),
		  .O(tck_int)
		);


  pulpissimo
    #(.CORE_TYPE(CORE_TYPE),
      .USE_FPU(USE_FPU),
      .USE_HWPE(USE_HWPE)
      ) i_pulpissimo
      (
       .pad_spim_sdio0(pad_spim_sdio0),
       .pad_spim_sdio1(pad_spim_sdio1),
       .pad_spim_sdio2(pad_spim_sdio2),
       .pad_spim_sdio3(pad_spim_sdio3),
       .pad_spim_csn0(pad_spim_csn0),
       .pad_spim_csn1(led0_o),
       .pad_spim_sck(pad_spim_sck),
       .pad_uart_rx(pad_uart_rx),
       .pad_uart_tx(pad_uart_tx),
       .pad_cam_pclk(led1_o),
       .pad_cam_hsync(led2_o),
       .pad_cam_data0(led3_o),
       .pad_cam_data1(switch0_i),
       .pad_cam_data2(switch1_i),
       .pad_cam_data3(btn0_i),
       .pad_cam_data4(btn1_i),
       .pad_cam_data5(btn2_i),
       .pad_cam_data6(btn3_i),
       .pad_cam_data7(switch3_i),
       .pad_cam_vsync(sdio_reset_o),
       .pad_sdio_clk(pad_sdio_clk),
       .pad_sdio_cmd(pad_sdio_cmd),
       .pad_sdio_data0(pad_sdio_data0),
       .pad_sdio_data1(pad_sdio_data1),
       .pad_sdio_data2(pad_sdio_data2),
       .pad_sdio_data3(pad_sdio_data3),
       .pad_i2c0_sda(pad_i2c0_sda),
       .pad_i2c0_scl(pad_i2c0_scl),
       .pad_i2s0_sck(pad_i2s0_sck),
       .pad_i2s0_ws(pad_i2s0_ws),
       .pad_i2s0_sdi(pad_i2s0_sdi),
       .pad_i2s1_sdi(pad_i2s1_sdi),
       .pad_reset_n(pad_reset_n),
       .pad_jtag_tck(tck_int),
       .pad_jtag_tdi(pad_jtag_tdi),
       .pad_jtag_tdo(pad_jtag_tdo),
       .pad_jtag_tms(pad_jtag_tms),
       //.pad_jtag_trst(pad_jtag_trst),
       .pad_jtag_trst(1'b1),
       .pad_xtal_in(ref_clk),
       .pad_bootsel()
       );

endmodule
