module mem_counter_tb;
reg rst,clk,dir,ld,c,rw,enable;
reg [5:0]address;
reg [3:0]din;
wire [3:0]count;
wire [3:0]data;
mem_counter dut (.rst(rst),.clk(clk),.dir(dir),.c(c),.din(din),.count(count),.rw(rw),.ld(ld),.enable(enable),.address(address),.data(data));
always #5 clk=~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,mem_counter_tb);
rst<=1;clk<=0;ld=0;dir=0;din<=4'h8;c<=0;
address<=6'h13;enable<=1;rw<=0;
#10 rst<=0;rw<=1;
#10 ld<=1;
#5 dir<=1;
#5 c<=1;
#100 c<=0;
#100 $finish;
end
endmodule
