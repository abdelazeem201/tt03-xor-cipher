module counter (
    input clk,
    input rst,
    input en,
    input [7:0] trigger_count,
    output pulse
);

reg [7:0] count;
wire [7:0] count_next;

always @(posedge clk, posedge rst) begin
    if (rst) begin
        count <= 8'b0;
    end else begin
        count <= count_next;
    end
end

assign pulse = (count == trigger_count) ? 1'b1 : 1'b0; 
assign count_next = (en) ? count + 1 : 0;


endmodule
