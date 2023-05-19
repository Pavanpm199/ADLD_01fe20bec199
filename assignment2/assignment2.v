`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 17:42:38
// Design Name: 
// Module Name: assignment2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module assignment2(
input clk,
input reset,
input start,
input coin5,
input coin10,
input [1:0]product,
output reg issue_prod,
output reg not_available,
output reg [1:0]change5
    );
    
  
localparam idle = 3'b000,
           s0   = 3'b001, // select product
           s1   = 3'b010, // coin insertion
           s2   = 3'b011; // give product and change
          // s3   = 3'b100; // 
  
reg [2:0]state;

reg [5:0] amount;
reg [5:0] prod_cost[0:3]; // cost of each product in a reg bank
reg [2:0] prod_count[0:3]; // count of each product in a reg bank



always@(posedge clk)
begin
if(reset)
begin
        state <= idle; 
        issue_prod <= 1'b0;
        change5 <= 1'b0;
        amount <= 6'b000000;
end     
else 
begin
case(state)
    idle:begin
        if(start)begin
            state <= s0;
            issue_prod <= 1'b0;
            change5 <= 1'b0;
            amount <= 6'b000000;
        end
        else state <= idle; 
    end
    
    s0:begin
        issue_prod <= 1'b0;
        if(prod_count[product] > 3'b000)
            begin
                state <= s1;
                not_available <= 1'b0;
                prod_count[product] <= prod_count[product] - 1'b1;
            end
            else begin
                not_available <= 1'b1;
                state <= s0;
                end
        end
    
    s1:begin
        if(amount < prod_cost[product] && coin5 && coin10)
        begin
            state  <= s1;
        end
        else if(amount < prod_cost[product])
        begin
            amount <= amount + (coin5*5 + coin10*10);
            state  <= s1;
            issue_prod <= 1'b0;
        end
        else begin 
            state <= s2;
            issue_prod <= 1'b0;
            amount <= amount - prod_cost[product];
            end
    end
    
    s2:begin            
           issue_prod <= 1'b1;
           change5 <= (amount[0]==1'b1)?2'b01:2'b00;
           if(start)
            state <= s0;
           else
            state <= idle;
    end
    default:begin
       state <= idle;
       issue_prod <= 1'b0;
       change5 <= 1'b0;
       not_available <= 1'b0; 
    
    end
endcase
end
end
endmodule
