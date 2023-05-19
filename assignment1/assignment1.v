module assignment1(front,back,reset,clk,password,password_status,car_count);
input front;
input back;
input reset;
input clk;
input [3:0]password;
output reg password_status; // 1 -> correct    0 -> incorrect
output reg [3:0]car_count;

reg [1:0]state,next_state;

parameter s0=0,s1=1,s2=2;  //  s0 -> Car enter s1 -> Enter password  s2 -> car into the parking 


///////////////////////////////// reset logic
always@(posedge clk) 
begin
	if (reset)
	begin
		state <= s0;
		car_count <= 4'b0000;	
	end	
	else
		state <= next_state;
	end


//////////////////////////////// next state decoder + output decoder
always@(*)
begin
	case(state)
	s0 : begin
		    if(front) next_state = s1;
		    else next_state = s0;
	    end
	s1 : begin
	    if(password == 4'b1010)
		begin
		   password_status = 1'b1;
		   next_state = s2;
		end
	    else 
		begin
		   password_status = 1'b0;
		   next_state = s1;		   
		
		end
	    end
	s2 : begin
	     if(back)
	     begin
		car_count = car_count + 1'b1;   ////// To count the number of cars entered
		next_state = s0;
	     end
	    else
		begin
		next_state = s2;
		end
	     end
	default : begin
		next_state = s0;
		password_status = 1'b0;
		car_count = 4'b0000;
	end
	endcase
end

endmodule 
