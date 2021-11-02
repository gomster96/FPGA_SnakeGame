// rand_num_generator.v
// created by : Meher Krishna Patel
// date : 22-Dec-16
// Feedback polynomial : x^3 + x^2 + 1
// maximum length : 2^3 - 1 = 7
// if parameter value is changed,
// then choose the correct Feedback polynomial i.e. change 'feedback_value' pattern


module rand_num_generator
#(
    parameter N = 5
)

(
    input wire clk, reset, 
    output wire [N:0] q
);

reg [N:0] r_reg;
wire [N:0] r_next;
wire feedback_value;
                        
always @(posedge clk, posedge reset)
begin 
    if (reset)
        begin
        
        r_reg <= 1;  

        
        end     
    else if (clk == 1'b1)
        r_reg <= r_next;
end


assign feedback_value = r_reg[5] ^ r_reg[3] ^ r_reg[0];


assign r_next = {feedback_value, r_reg[N:1]};
assign q = r_reg;
endmodule