module spi_tb;

reg clk = 0;
reg start;
reg [7:0] data_in;

wire mosi;
wire sclk;
wire ss;
wire done;

spi_master uut(
.clk(clk),
.start(start),
.data_in(data_in),
.mosi(mosi),
.sclk(sclk),
.ss(ss),
.done(done)
);

always #5 clk = ~clk;

initial
begin

start = 0;
data_in = 8'b11001010;

#10 start = 1;
#10 start = 0;

#200 $finish;

end

endmodule