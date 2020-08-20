//TEST-BENCH FOR TRAFFIC-LIGHT CONTROLLER 
//Created by : ASHOK KUMAR
//Date  :14-06-2020

module tlc_tb();
  reg clk,rst;
  wire [2:0]N_S,E_W;
  
  tlc t1(.clk(clk),.rst(rst),.N_S(N_S),.E_W(E_W));

always #5 clk=~clk;

initial begin
  clk=0;rst=0;
  #20 rst=1;
  #10000 rst=0;
  #20 $finish;
end
endmodule
  
  
