module mem_counter (input clk,rst,c,dir,ld,enable,rw,input [5:0]address, input [3:0]din,output reg [3:0] data , output reg [3:0] count);
reg [3:0]mem [0:63];
always@(*) begin
if(enable) begin
if(rw)
data=mem[address];
else
mem[address]=din;
end
else
data=4'bz;
end
always @(posedge clk) begin
if(rst)
count<=4'b0000;
else if(ld) begin
if(dir) begin
if(c)
count<=count-1'b1;
else
count<=count+1'b1;
end
else
count<=data;
end
end
endmodule
