module DPCM_tb;
    reg clk, rst;
    reg [7:0] sin;
    wire [7:0] dout;
    wire [7:0] sout;


    DPCM_Encoder encoder (.clk(clk), .rst(rst), .sin(sin), .dout(dout));

 
    DPCM_Decoder decoder (.clk(clk), .rst(rst), .din(dout), .sout(sout));


    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        sin = 8'd0;

        #10 rst = 0;

        #10 sin = 8'd10;
        #10 sin = 8'd20;
        #10 sin = 8'd30;
        #10 sin = 8'd25;
        #10 sin = 8'd15;
        #10 sin = 8'd5;  
        #10 sin = 8'd0;   

        #20 $finish;
    end

    initial begin
        $monitor("Time = %0t | Sample In = %d | Diff Out = %d | Sample Out = %d", $time, sin, dout, sout);
    end
endmodule
