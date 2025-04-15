interface mem_intf(input logic clk,reset);
  logic [7:0] datain;
  logic [7:0]dataout;
  logic we;
  logic [7:0]addr;
  logic clk;
  
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
    input dataout;//driver ke liye ye input ki tarah kaam karega kyonki to provide further response that it generate an errror 
    output  datain; //ye interface pe dalega isliye ye outpue hoga
    output  addr;
    output we;
  endclocking
  
   clocking monitor_cb @(posedge clk);
    default input #1 output #1;
    input datain;//ye sampling karega toh ye interface se data uthaega kewal
    input dataout;
    input addr;
     input we;

  endclocking
  
  modport DRIVER (clocking driver_cb,input clk,reset);
    modport MONITOR (clocking monitor_cb,input clk,reset);
      
endinterface
