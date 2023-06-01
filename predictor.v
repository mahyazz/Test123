module predictor(input wire request, result, clk, taken, output reg prediction);
    reg [1:0] ph = 2'b11;

    always @(posedge clk, posedge request) begin
        if (request)
            prediction = ph[1];
    end

    always @(posedge clk, posedge result) begin
        if (result) begin
            if (taken && ph != 3)
                ph = ph + 1; 
            else if (!taken && ph != 0)
                ph = ph - 1;
        end
    end
endmodule
