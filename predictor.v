module predictor(
  input wire request,
  input wire result,
  input wire clk,
  input wire taken,
  output reg prediction
);

  reg previous_result;
  reg [2:0] counter;
 
  always @(posedge clk) begin
    if (request) begin
      if (result != previous_result) begin
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
   
    if (counter >= 2)
      prediction <= 1'b1;
    else if (counter <= 1)
      prediction <= 1'b0;
     
    previous_result <= result;
  end

endmodule
