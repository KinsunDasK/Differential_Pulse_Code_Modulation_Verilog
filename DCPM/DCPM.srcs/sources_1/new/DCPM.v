module DPCM_Encoder (
    input clk,
    input rst,
    input [7:0] sin, 
    output reg [7:0] dout
);
    reg [7:0] prs = 8'd0; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prs <= 8'd0;
            dout <= 8'd0;
        end else begin
            dout <= sin - prs;
            prs <= sin;
        end
    end
endmodule


module DPCM_Decoder (
    input clk,
    input rst,
    input [7:0] din,
    output reg [7:0] sout
);
    reg [7:0] prs =8'd0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prs <= 8'd0;
            sout <= 8'd0;
        end else begin
            sout <= prs + din; 
            prs <= sout;          
        end
    end
endmodule