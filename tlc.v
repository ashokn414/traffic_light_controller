//TRAFFIC-LIGHT CONTROLLER 
//Created by : ASHOK KUMAR
//Date  :14-06-2020

module tlc(
  input clk,rst,
  output reg[2:0]N_S,E_W);
  
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
reg [2:0] cs,ns;

wire [5:0]count;
counter #(42) c1(.clk(clk),.rst(rst),.clr(1'b0),.en(1'b1),.count(count));

always @(posedge clk or negedge rst)
begin
if (rst==1'b0)  cs<=s0;
else            cs<=ns;
end

always @(count or cs)
begin
case(cs)
s0:begin
   if(count<6'd15)  ns<=s0;
   else      ns<=s1;
   end
s1:begin
   if(count<6'd18)  ns<=s1;
   else      ns<=s2;
   end
s2:begin
   if(count<6'd21)  ns<=s2;
   else      ns<=s3;
   end
s3:begin
   if(count<6'd36)  ns<=s3;
   else      ns<=s4;
   end
s4:begin
   if(count<6'd39)  ns<=s4;
   else      ns<=s5;
   end
s5:begin
   if(count<6'd42)  ns<=s5;
   else      ns<=s0;
   end
endcase
end

always @(cs)
begin
case(cs)
s0:begin
   N_S=3'b001;//green
   E_W=3'b100;//red
   end
s1:begin
   N_S=3'b010;//yellow
   E_W=3'b100;//red
   end
s2:begin
   N_S=3'b100;//red
   E_W=3'b100;//red
   end
s3:begin
   N_S=3'b100;//red
   E_W=3'b001;//green
   end
s4:begin
   N_S=3'b100;//red
   E_W=3'b010;//yellow
   end
s5:begin
   N_S=3'b100;//red
   E_W=3'b100;//red
   end  
endcase
end

endmodule
