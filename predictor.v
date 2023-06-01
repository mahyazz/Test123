module predictor(input wire request, result, clk, taken, output reg prediction);
    reg [1:0] ph = 2'b11;

    always @(posedge clk) begin
        if (request)
            prediction = (ph > 2'b01);
    end

    always @(posedge clk) begin
        if (result) begin
            if (taken && ph != 3)
                ph = ph + 1; 
            else if (!taken && ph != 0)
                ph = ph - 1;
        end
    end
endmodule
