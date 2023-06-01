module predictor(input wire request, result, clk, taken, output reg prediction);

  // Initialize saturation counter
  reg [1:0] saturation_counter = 2'B11;
  
  // Output prediction when request is 1
  always @(posedge clk) begin
    if (request == 1) begin
      prediction <= saturation_counter < 2'd2 ? 1 : 0;
    end
  end
  
  // Update saturation counter when result is 1 and taken is high
  always @(posedge clk) begin
    if (result == 1 && taken) begin
      if (saturation_counter < 2'd3) begin
        saturation_counter <= saturation_counter + 1;
      end
    end else begin
      saturation_counter <= saturation_counter > 0 ? saturation_counter - 1 : 0;
    end
  end

endmodule
