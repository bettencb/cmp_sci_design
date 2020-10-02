// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Mon Jun 17 20:35:29 2013
// ============================================================================

`define ENABLE_HPS

module ghrd_top(

      
      ///////// ADC /////////
      inout              ADC_CS_N,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

      ///////// AUD /////////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,

      ///////// DRAM /////////
      output      [12:0] DRAM_ADDR,
      output      [1:0]  DRAM_BA,
      output             DRAM_CAS_N,
      output             DRAM_CKE,
      output             DRAM_CLK,
      output             DRAM_CS_N,
      inout       [15:0] DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_RAS_N,
      output             DRAM_UDQM,
      output             DRAM_WE_N,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// FPGA /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO /////////
      inout     [35:0]         GPIO_0,
      inout     [35:0]         GPIO_1,
 

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

      ///////// IRDA /////////
      input              IRDA_RXD,
      output             IRDA_TXD,

      ///////// KEY /////////
      input       [3:0]  KEY,

      ///////// LEDR /////////
      output      [9:0]  LEDR,

      ///////// PS2 /////////
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,

      ///////// SW /////////
      input       [9:0]  SW,

      ///////// TD /////////
      input              TD_CLK27,
      input      [7:0]  TD_DATA,
      input             TD_HS,
      output             TD_RESET_N,
      input             TD_VS,


      ///////// VGA /////////
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS
);



// internal wires and registers declaration
  wire [3:0]  fpga_debounced_buttons;
  wire [9:0]  fpga_led_internal;
  wire        hps_fpga_reset_n;
  wire [2:0]  hps_reset_req;
  wire        hps_cold_reset;
  wire        hps_warm_reset;
  wire        hps_debug_reset;
  wire [27:0] stm_hw_events;

// connection of internal logics
  assign stm_hw_events    = {{3{1'b0}},SW, fpga_led_internal, fpga_debounced_buttons};



    soc_system u0 (
        .memory_mem_a                          ( HPS_DDR3_ADDR),                          //          memory.mem_a
        .memory_mem_ba                         ( HPS_DDR3_BA),                         //                .mem_ba
        .memory_mem_ck                         ( HPS_DDR3_CK_P),                         //                .mem_ck
        .memory_mem_ck_n                       ( HPS_DDR3_CK_N),                       //                .mem_ck_n
        .memory_mem_cke                        ( HPS_DDR3_CKE),                        //                .mem_cke
        .memory_mem_cs_n                       ( HPS_DDR3_CS_N),                       //                .mem_cs_n
        .memory_mem_ras_n                      ( HPS_DDR3_RAS_N),                      //                .mem_ras_n
        .memory_mem_cas_n                      ( HPS_DDR3_CAS_N),                      //                .mem_cas_n
        .memory_mem_we_n                       ( HPS_DDR3_WE_N),                       //                .mem_we_n
        .memory_mem_reset_n                    ( HPS_DDR3_RESET_N),                    //                .mem_reset_n
        .memory_mem_dq                         ( HPS_DDR3_DQ),                         //                .mem_dq
        .memory_mem_dqs                        ( HPS_DDR3_DQS_P),                        //                .mem_dqs
        .memory_mem_dqs_n                      ( HPS_DDR3_DQS_N),                      //                .mem_dqs_n
        .memory_mem_odt                        ( HPS_DDR3_ODT),                        //                .mem_odt
        .memory_mem_dm                         ( HPS_DDR3_DM),                         //                .mem_dm
        .memory_oct_rzqin                      ( HPS_DDR3_RZQ),                      //                .oct_rzqin
       		
	    .hps_0_hps_io_hps_io_emac1_inst_TX_CLK ( HPS_ENET_GTX_CLK), //                   hps_0_hps_io.hps_io_emac1_inst_TX_CLK
        .hps_0_hps_io_hps_io_emac1_inst_TXD0   ( HPS_ENET_TX_DATA[0] ),   //                               .hps_io_emac1_inst_TXD0
        .hps_0_hps_io_hps_io_emac1_inst_TXD1   ( HPS_ENET_TX_DATA[1] ),   //                               .hps_io_emac1_inst_TXD1
        .hps_0_hps_io_hps_io_emac1_inst_TXD2   ( HPS_ENET_TX_DATA[2] ),   //                               .hps_io_emac1_inst_TXD2
        .hps_0_hps_io_hps_io_emac1_inst_TXD3   ( HPS_ENET_TX_DATA[3] ),   //                               .hps_io_emac1_inst_TXD3
        .hps_0_hps_io_hps_io_emac1_inst_RXD0   ( HPS_ENET_RX_DATA[0] ),   //                               .hps_io_emac1_inst_RXD0
        .hps_0_hps_io_hps_io_emac1_inst_MDIO   ( HPS_ENET_MDIO ),   //                               .hps_io_emac1_inst_MDIO
        .hps_0_hps_io_hps_io_emac1_inst_MDC    ( HPS_ENET_MDC  ),    //                               .hps_io_emac1_inst_MDC
        .hps_0_hps_io_hps_io_emac1_inst_RX_CTL ( HPS_ENET_RX_DV), //                               .hps_io_emac1_inst_RX_CTL
        .hps_0_hps_io_hps_io_emac1_inst_TX_CTL ( HPS_ENET_TX_EN), //                               .hps_io_emac1_inst_TX_CTL
        .hps_0_hps_io_hps_io_emac1_inst_RX_CLK ( HPS_ENET_RX_CLK), //                               .hps_io_emac1_inst_RX_CLK
        .hps_0_hps_io_hps_io_emac1_inst_RXD1   ( HPS_ENET_RX_DATA[1] ),   //                               .hps_io_emac1_inst_RXD1
        .hps_0_hps_io_hps_io_emac1_inst_RXD2   ( HPS_ENET_RX_DATA[2] ),   //                               .hps_io_emac1_inst_RXD2
        .hps_0_hps_io_hps_io_emac1_inst_RXD3   ( HPS_ENET_RX_DATA[3] ),   //                               .hps_io_emac1_inst_RXD3
        
		  
		.hps_0_hps_io_hps_io_qspi_inst_IO0     ( HPS_FLASH_DATA[0]    ),     //                               .hps_io_qspi_inst_IO0
        .hps_0_hps_io_hps_io_qspi_inst_IO1     ( HPS_FLASH_DATA[1]    ),     //                               .hps_io_qspi_inst_IO1
        .hps_0_hps_io_hps_io_qspi_inst_IO2     ( HPS_FLASH_DATA[2]    ),     //                               .hps_io_qspi_inst_IO2
        .hps_0_hps_io_hps_io_qspi_inst_IO3     ( HPS_FLASH_DATA[3]    ),     //                               .hps_io_qspi_inst_IO3
        .hps_0_hps_io_hps_io_qspi_inst_SS0     ( HPS_FLASH_NCSO    ),     //                               .hps_io_qspi_inst_SS0
        .hps_0_hps_io_hps_io_qspi_inst_CLK     ( HPS_FLASH_DCLK    ),     //                               .hps_io_qspi_inst_CLK
        
		  .hps_0_hps_io_hps_io_sdio_inst_CMD     ( HPS_SD_CMD    ),     //                               .hps_io_sdio_inst_CMD
        .hps_0_hps_io_hps_io_sdio_inst_D0      ( HPS_SD_DATA[0]     ),      //                               .hps_io_sdio_inst_D0
        .hps_0_hps_io_hps_io_sdio_inst_D1      ( HPS_SD_DATA[1]     ),      //                               .hps_io_sdio_inst_D1
        .hps_0_hps_io_hps_io_sdio_inst_CLK     ( HPS_SD_CLK   ),     //                               .hps_io_sdio_inst_CLK
        .hps_0_hps_io_hps_io_sdio_inst_D2      ( HPS_SD_DATA[2]     ),      //                               .hps_io_sdio_inst_D2
        .hps_0_hps_io_hps_io_sdio_inst_D3      ( HPS_SD_DATA[3]     ),      //                               .hps_io_sdio_inst_D3
        		  
		  .hps_0_hps_io_hps_io_usb1_inst_D0      ( HPS_USB_DATA[0]    ),      //                               .hps_io_usb1_inst_D0
        .hps_0_hps_io_hps_io_usb1_inst_D1      ( HPS_USB_DATA[1]    ),      //                               .hps_io_usb1_inst_D1
        .hps_0_hps_io_hps_io_usb1_inst_D2      ( HPS_USB_DATA[2]    ),      //                               .hps_io_usb1_inst_D2
        .hps_0_hps_io_hps_io_usb1_inst_D3      ( HPS_USB_DATA[3]    ),      //                               .hps_io_usb1_inst_D3
        .hps_0_hps_io_hps_io_usb1_inst_D4      ( HPS_USB_DATA[4]    ),      //                               .hps_io_usb1_inst_D4
        .hps_0_hps_io_hps_io_usb1_inst_D5      ( HPS_USB_DATA[5]    ),      //                               .hps_io_usb1_inst_D5
        .hps_0_hps_io_hps_io_usb1_inst_D6      ( HPS_USB_DATA[6]    ),      //                               .hps_io_usb1_inst_D6
        .hps_0_hps_io_hps_io_usb1_inst_D7      ( HPS_USB_DATA[7]    ),      //                               .hps_io_usb1_inst_D7
        .hps_0_hps_io_hps_io_usb1_inst_CLK     ( HPS_USB_CLKOUT    ),     //                               .hps_io_usb1_inst_CLK
        .hps_0_hps_io_hps_io_usb1_inst_STP     ( HPS_USB_STP    ),     //                               .hps_io_usb1_inst_STP
        .hps_0_hps_io_hps_io_usb1_inst_DIR     ( HPS_USB_DIR    ),     //                               .hps_io_usb1_inst_DIR
        .hps_0_hps_io_hps_io_usb1_inst_NXT     ( HPS_USB_NXT    ),     //                               .hps_io_usb1_inst_NXT
        		  
		  .hps_0_hps_io_hps_io_spim1_inst_CLK    ( HPS_SPIM_CLK  ),    //                               .hps_io_spim1_inst_CLK
        .hps_0_hps_io_hps_io_spim1_inst_MOSI   ( HPS_SPIM_MOSI ),   //                               .hps_io_spim1_inst_MOSI
        .hps_0_hps_io_hps_io_spim1_inst_MISO   ( HPS_SPIM_MISO ),   //                               .hps_io_spim1_inst_MISO
        .hps_0_hps_io_hps_io_spim1_inst_SS0    ( HPS_SPIM_SS ),    //                               .hps_io_spim1_inst_SS0
      		
		  .hps_0_hps_io_hps_io_uart0_inst_RX     ( HPS_UART_RX    ),     //                               .hps_io_uart0_inst_RX
        .hps_0_hps_io_hps_io_uart0_inst_TX     ( HPS_UART_TX    ),     //                               .hps_io_uart0_inst_TX
		
		  .hps_0_hps_io_hps_io_i2c0_inst_SDA     ( HPS_I2C1_SDAT    ),     //                               .hps_io_i2c0_inst_SDA
        .hps_0_hps_io_hps_io_i2c0_inst_SCL     ( HPS_I2C1_SCLK    ),     //                               .hps_io_i2c0_inst_SCL
		
		  .hps_0_hps_io_hps_io_i2c1_inst_SDA     ( HPS_I2C2_SDAT    ),     //                               .hps_io_i2c1_inst_SDA
        .hps_0_hps_io_hps_io_i2c1_inst_SCL     ( HPS_I2C2_SCLK    ),     //                               .hps_io_i2c1_inst_SCL
        
		  .hps_0_hps_io_hps_io_gpio_inst_GPIO09  ( HPS_CONV_USB_N),  //                               .hps_io_gpio_inst_GPIO09
        .hps_0_hps_io_hps_io_gpio_inst_GPIO35  ( HPS_ENET_INT_N),  //                               .hps_io_gpio_inst_GPIO35
        .hps_0_hps_io_hps_io_gpio_inst_GPIO40  ( HPS_LTC_GPIO),  //                               .hps_io_gpio_inst_GPIO40
        //.hps_0_hps_io_hps_io_gpio_inst_GPIO41  ( HPS_GPIO[1]),  //                               .hps_io_gpio_inst_GPIO41
        .hps_0_hps_io_hps_io_gpio_inst_GPIO48  ( HPS_I2C_CONTROL),  //                               .hps_io_gpio_inst_GPIO48
        .hps_0_hps_io_hps_io_gpio_inst_GPIO53  ( HPS_LED),  //                               .hps_io_gpio_inst_GPIO53
        .hps_0_hps_io_hps_io_gpio_inst_GPIO54  ( HPS_KEY),  //                               .hps_io_gpio_inst_GPIO54
        .hps_0_hps_io_hps_io_gpio_inst_GPIO61  ( HPS_GSENSOR_INT),  //                               .hps_io_gpio_inst_GPIO61
		  .hps_0_f2h_stm_hw_events_stm_hwevents  (stm_hw_events),   //        hps_0_f2h_stm_hw_events.stm_hwevents
        .clk_clk                               (CLOCK_50),                               //                            clk.clk
        .reset_reset_n                         (hps_fpga_reset_n),                         //                          reset.reset_n
		  .hps_0_h2f_reset_reset_n               (hps_fpga_reset_n),               //                hps_0_h2f_reset.reset_n
        .hps_0_f2h_warm_reset_req_reset_n      (~hps_warm_reset),      //       hps_0_f2h_warm_reset_req.reset_n
        .hps_0_f2h_debug_reset_req_reset_n     (~hps_debug_reset),     //      hps_0_f2h_debug_reset_req.reset_n
        .hps_0_f2h_cold_reset_req_reset_n      (~hps_cold_reset),       //       hps_0_f2h_cold_reset_req.reset_n
		  
		  // From the soc_system instatiation

		  .pio_a_external_connection_export        (a_pio),        //      pio_a_external_connection.export
        .pio_b_external_connection_export        (b_pio),        //      pio_b_external_connection.export
        .pio_prod_external_connection_export     (p_pio),     //   pio_prod_external_connection.export
        .pio_sum_external_connection_export      (s_pio),      //    pio_sum_external_connection.export
        //.reset_reset_n                           (reset_n),                          //                            clk.clk
        .clk_24_external_connection_export     (timer_count),     //     clk_24_external_connection.export
        .fpctrl_pio_external_connection_export (ctrl_reg) // fpctrl_pio_external_connection.export
		  );

			
/*
Added the part above @From the soc_system instatiation down to mult at bottom
*/			

// Define control register from PIO
	wire [9:0]  ctrl_reg;
	wire  ctrl_reset;
	wire  ctrl_enable;
	wire  ctrl_load;
	wire  ctrl_shift;
	
	assign ctrl_reset = ctrl_reg[0];
	assign ctrl_enable = ctrl_reg[1];
	assign ctrl_load = ctrl_reg[2];
	assign ctrl_shift = ctrl_reg[3];  // Also does a load of current values for a and b
	

// Define a and b buses from PIOs
	wire [31:0] a_pio, b_pio;
	
// Define a and b 2-d arrays (8 elements)
	reg [31:0] a [7:0];
	reg [31:0] b [7:0];
	
// Define edge version of ctrl_shift, since this will be used an active high enable for shifting
//   Making this a positive edge since there would very likely be numerous clock cycles where the
//	 the ctrl_shift bit would be high.  So need to prevent multiple shifts when only shift is intended.

	reg ctrl_shift_prev;
	wire ctrl_shift_posedge;
	
	always@(posedge CLOCK_50 or negedge hps_fpga_reset_n)
		if(~hps_fpga_reset_n)
			ctrl_shift_prev = 1'b0;
		else
			ctrl_shift_prev = ctrl_shift;
	
	assign ctrl_shift_posedge = ctrl_shift & ~ctrl_shift_prev;
	
// Define 2-d array loading and shifting

	integer i;
	
	always@(posedge CLOCK_50 or negedge hps_fpga_reset_n)
		if(~hps_fpga_reset_n)
			for(i=0; i < 8; i=i+1)
				begin
					a[i] = 32'd0;
					b[i] = 32'd0;
				end
		else
		  if(ctrl_shift_posedge)
		  begin
			for(i=7; i > 0; i=i-1)
				begin
					a[i] = a[i-1];
					b[i] = b[i-1];
				end
			
			a[0] = a_pio;
			b[0] = b_pio;
		  end
		  
		  
			
// Define the products and sums
	
	wire [31:0] p0, p1, p2, p3, p4, p5, p6, p7;

	wire [31:0] sum_01, sum_23, sum_45, sum_67, sum_p1, sum_p2, s_pio;
	
	
// Instantiate the multipliers (showing just the first 2)

mult mult0(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(a[0]),      //      a.a
		.b(b[0]),      //      b.b
		.q(p0)       //      q.q
	);
	
mult mult1(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(a[1]),      //      a.a
		.b(b[1]),      //      b.b
		.q(p1)       //      q.q
	);
	
	
mult mult2(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(a[2]),      //      a.a
		.b(b[2]),      //      b.b
		.q(p2)       //      q.q
	);
	
mult mult3(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(a[3]),      //      a.a
		.b(b[3]),      //      b.b
		.q(p3)       //      q.q
	);
	
mult mult4(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(a[4]),      //      a.a
		.b(b[4]),      //      b.b
		.q(p4)       //      q.q
	);
	
mult mult5(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(a[5]),      //      a.a
		.b(b[5]),      //      b.b
		.q(p5)       //      q.q
	);
	
mult mult6(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(a[6]),      //      a.a
		.b(b[6]),      //      b.b
		.q(p6)       //      q.q
	);
	
mult mult7(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(a[7]),      //      a.a
		.b(b[7]),      //      b.b
		.q(p7)       //      q.q
	);
	
				
// Instantiate the adders (showng just a few...)

 add add01(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(p0),      //      a.a
		.b(p1),      //      b.b
		.q(sum_01)       //      q.q
	);
	
 add add02(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(p2),      //      a.a
		.b(p3),      //      b.b
		.q(sum_23)       //      q.q
	);
	
 add add03(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(p4),      //      a.a
		.b(p5),      //      b.b
		.q(sum_45)       //      q.q
	);
	
 add add04(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(p6),      //      a.a
		.b(p7),      //      b.b
		.q(sum_67)       //      q.q
	);
	

	
add addp1(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(sum_01),      //      a.a
		.b(sum_23),      //      b.b
		.q(sum_p1)       //      q.q
	);
add addp2(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(sum_45),      //      a.a
		.b(sum_67),      //      b.b
		.q(sum_p2)       //      q.q
	);

add add_final(
		.clk (CLOCK_50),    //    clk.clk
		.areset(~hps_fpga_reset_n), // areset.reset
		.a(sum_p1),      //      a.a
		.b(sum_p2),      //      b.b
		.q(p_pio)       //      q.q
	);
		 
	 
  // 24-bit Timer Counter signals
  
	wire [23:0]	timer_count; 		// 24-bit timer count value
	
	// Instanatiate the 24-bit timer counter
	ctr_24 counter (.clk(CLOCK_50), .ar(ctrl_reset), .en(ctrl_enable), .q(timer_count));
	

// Source/Probe megawizard instance
hps_reset hps_reset_inst (
  .source_clk (CLOCK_50),
  .source     (hps_reset_req)
);

altera_edge_detector pulse_cold_reset (
  .clk       (CLOCK_50),
  .rst_n     (hps_fpga_reset_n),
  .signal_in (hps_reset_req[0]),
  .pulse_out (hps_cold_reset)
);
  defparam pulse_cold_reset.PULSE_EXT = 6;
  defparam pulse_cold_reset.EDGE_TYPE = 1;
  defparam pulse_cold_reset.IGNORE_RST_WHILE_BUSY = 1;

altera_edge_detector pulse_warm_reset (
  .clk       (CLOCK_50),
  .rst_n     (hps_fpga_reset_n),
  .signal_in (hps_reset_req[1]),
  .pulse_out (hps_warm_reset)
);
  defparam pulse_warm_reset.PULSE_EXT = 2;
  defparam pulse_warm_reset.EDGE_TYPE = 1;
  defparam pulse_warm_reset.IGNORE_RST_WHILE_BUSY = 1;
  
altera_edge_detector pulse_debug_reset (
  .clk       (CLOCK_50),
  .rst_n     (hps_fpga_reset_n),
  .signal_in (hps_reset_req[2]),
  .pulse_out (hps_debug_reset)
);
  defparam pulse_debug_reset.PULSE_EXT = 32;
  defparam pulse_debug_reset.EDGE_TYPE = 1;
  defparam pulse_debug_reset.IGNORE_RST_WHILE_BUSY = 1;
  
endmodule