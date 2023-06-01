module predictor(
  input wire request,
  input wire result,
  input wire clk,
  input wire taken,
  output reg prediction
);

  reg [1:0] counter = 2'b11;
 
  always @(posedge clk) begin
    if (result) begin
        if (taken) begin
          if (counter < 3)
            counter <= counter + 1;
        end
        else begin
          if (counter > 0)
            counter <= counter - 1;
        end
      end
  end

  always @(posedge clk) begin
    if (request) begin
      prediciton <= counter[1];
    end
  end

endmodule
