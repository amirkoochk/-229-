module predictor(input wire request, result, clk, taken, output reg prediction);

parameter WIDTH = 3; 
reg [WIDTH-1:0] counter = 0;

always @(posedge clk) begin
    if (taken) begin
        if (counter < {{WIDTH}}'d7) 
            counter <= counter + {{WIDTH}}'d1; 
    end else begin
        if (counter > {{WIDTH}}'d0)
            counter <= counter - {{WIDTH}}'d1; 
    end
    
    if (counter > {{WIDTH}}'d3) 
        prediction <= 1'b1;
    else
        prediction <= 1'b0;
end
endmodule
