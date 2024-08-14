interface wb #(
  parameter ADDR_W = 16,
  parameter DATA_W = 32,
  parameter STRB_W = DATA_W/8
) (
  // synthesis translate_off
  input clk,
  input reset
  // synthesis translate_on
);
  logic  [ADDR_W-1:0] wb_adr_i  ; 
  logic  [DATA_W-1:0] wb_dat_i  ; 
  logic               wb_we_i   ; 
  logic               wb_stb_i  ; 
  logic               wb_cyc_i  ; 
  logic  [STRB_W-1:0] wb_sel_i  ; 
  logic  [DATA_W-1:0] wb_dat_o  ; 
  logic               wb_ack_o  ; 

 task write(
    input logic [ADDR_W-1:0] addr,
    input logic [DATA_W-1:0] data,
    input logic [STRB_W-1:0] strb = {STRB_W{1'b1}}
  );
    @(posedge clk);
    wb_adr_i = addr;
    wb_dat_i = data;
    wb_sel_i = strb;
    wb_we_i  = 1;
    wb_stb_i = 1;
    wb_cyc_i = 1;
    do @(posedge clk);
    while (!wb_ack_o);
    wb_adr_i = 0;
    wb_dat_i = 0;
    wb_sel_i = 0;
    wb_we_i  = 0;
    wb_stb_i = 0;
    wb_cyc_i = 0;
  endtask : write


  task read(
    input logic [ADDR_W-1:0] addr,
    output logic [DATA_W-1:0] data
  );
    @(posedge clk);
    wb_adr_i = addr;
    wb_we_i  = 0;
    wb_stb_i = 1;
    wb_cyc_i = 1;
    do @(posedge clk);
    while (!wb_ack_o);
    wb_adr_i = 0;
    wb_we_i  = 0;
    wb_stb_i = 0;
    wb_cyc_i = 0;
    data = readdata;
  endtask : read

endinterface
