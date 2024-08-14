wb2lb dut (
  .clk          (clk      ),
  .rst          (reset    ),
  // Wishbone
  .wb_adr_i  (mst.wb_adr_i),
  .wb_dat_i  (mst.wb_dat_i),
  .wb_we_i   (mst.wb_we_i ),    
  .wb_stb_i  (mst.wb_stb_i),
  .wb_cyc_i  (mst.wb_cyc_i),
  .wb_sel_i  (mst.wb_sel_i),
  .wb_dat_o  (mst.wb_dat_o),
  .wb_ack_o  (mst.wb_ack_o),
  // Local Bus
  .wready    (wready      ),
  .waddr     (waddr       ),
  .wdata     (wdata       ),
  .wen       (wen         ),
  .wstrb     (wstrb       ),
  .rdata     (rdata       ),
  .rvalid    (rvalid      ),
  .raddr     (raddr       ),
  .ren       (ren         )
);

// Wishbone master
wb #(
  .ADDR_W(ADDR_W),
  .DATA_W(DATA_W),
  .STRB_W(STRB_W)
) mst (
  .clk(clk),
  .reset(reset)
);
