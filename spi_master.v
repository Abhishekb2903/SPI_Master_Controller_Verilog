module spi_master(
input clk,
input start,
input [7:0] data_in,
output reg mosi,
output reg sclk,
output reg ss,
output reg done
);

reg [3:0] state = 0;
reg [7:0] data;

always @(posedge clk)
begin

case(state)

0:
begin
ss <= 1;
sclk <= 0;
done <= 0;

if(start)
begin
ss <= 0;
data <= data_in;
state <= 1;
end
end

1: begin mosi <= data[7]; sclk <= 1; state <= 2; end
2: begin sclk <= 0; state <= 3; end

3: begin mosi <= data[6]; sclk <= 1; state <= 4; end
4: begin sclk <= 0; state <= 5; end

5: begin mosi <= data[5]; sclk <= 1; state <= 6; end
6: begin sclk <= 0; state <= 7; end

7: begin mosi <= data[4]; sclk <= 1; state <= 8; end
8: begin sclk <= 0; state <= 9; end

9: begin mosi <= data[3]; sclk <= 1; state <= 10; end
10: begin sclk <= 0; state <= 11; end

11: begin mosi <= data[2]; sclk <= 1; state <= 12; end
12: begin sclk <= 0; state <= 13; end

13: begin mosi <= data[1]; sclk <= 1; state <= 14; end
14: begin sclk <= 0; state <= 15; end

15: begin mosi <= data[0]; sclk <= 1; state <= 16; end
16: begin sclk <= 0; state <= 17; end

17:
begin
ss <= 1;
done <= 1;
state <= 0;
end

endcase

end

endmodule