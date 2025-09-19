library IEEE;
use IEEE.Std_Logic_1164.all;
--use IEEE.Std_Logic_arith.all;
Library Synopsys;
use Synopsys.attributes.all;


entity Prob_8_25b_Controller_vhdl is
	generic (dp_width: integer := 5; BC_size: integer := 3);
 	port (Ready, Valid, Load_regs, Clr_Q_C, Decr_P, Add_regs, Shift_regs: out Std_Logic;   
  		   Start, Empty_data, Empty_m, Zero, Q0, clock, reset_b: in Std_Logic);
end Prob_8_25b_Controller_vhdl;

architecture Behavioral of Prob_8_25b_Controller_vhdl is		-- one-hot
	type State_type is (S_idle, S_add, S_shift);
	attribute enum_encoding of State_type: type is "001 010 100";
	signal state, next_state: State_type;
	
begin

-- State transitions	
	process  (clock, reset_b) begin
    	if (reset_b = '0') then state <= S_idle; 
		elsif clock'event and clock = '1' then state <= next_state; end if;
	end process;

-- Mealy Output
	Valid <= '1' when state = S_shift and Zero = '1' else '0';

-- Next state logic	
	process (state, Start, Empty_data, Empty_m, Q0, Zero) begin
   		next_state 	<= S_idle;
    		Ready 			<= '0';
		Load_regs 	<= '0';
		Clr_Q_C 		<= '0';
    		Decr_P 		<= '0';
    		Add_regs 		<= '0';
    		Shift_regs 		<= '0';
			
    	case (state) is
      	when S_idle =>	Ready <= '1';
							if Start = '0' then next_state <= S_idle; 
							elsif Empty_data = '1' then Clr_Q_C <= '1'; next_state <= S_idle; 
							else Load_regs <= '1'; next_state <= S_add; 
							end if;
					
      	when S_add =>	Decr_P <= '1';
							if Empty_m = '1' then next_state <= S_idle;
							elsif Q0 = '1' then Add_regs <= '1'; next_state <= S_shift;
							else next_state <= S_shift;
							end if;
							
									
      	when S_shift =>	Shift_regs <= '1';
							if Zero = '1' then next_state <= S_idle;
							else next_state <= S_add; 
							end if; 
									
		when others =>	next_state <= S_idle;
    	end case;
	end process;
end Behavioral;
