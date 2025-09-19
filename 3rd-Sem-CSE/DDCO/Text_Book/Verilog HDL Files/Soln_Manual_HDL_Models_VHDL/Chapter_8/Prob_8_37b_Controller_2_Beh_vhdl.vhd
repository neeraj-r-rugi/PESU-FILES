Library IEEE;
use IEEE.Std_Logic_1164.all;

entity Prob_8_37b_Controller_2_Beh_vhdl is
	port (Ready: out Std_Logic; 
		Load_regs, Add_shift: out Std_Logic;
		Start, Zero, clock, reset_b: in Std_Logic);
end Prob_8_37b_Controller_2_Beh_vhdl;

architecture Behavioral of Prob_8_37b_Controller_2_Beh_vhdl is
	type State_type is (S_idle, S_running);
	signal state, next_state: State_type;	 

begin

	Ready <= '1' when state = S_idle else '0';

	process (clock, reset_b) begin
		if (reset_b = '0') then state <= S_idle;
    		elsif clock'event and clock = '1' then state <= next_state;
		end if;
	end process;
	
  	process (state, Start, Zero) begin
    		next_state <= S_idle;	
    		Load_regs <= '0';
    		Add_shift <= '0';

    		case (state)is
      		when S_idle =>	if (Start = '1') then 
										Load_regs <= '1'; 
										next_state <= S_running;
									end if;
									
				when S_running =>	if (Zero = '1') then next_state <= S_idle;
										else 
											Add_shift <='1'; 
											next_state <= S_running; 
										end if;
			end case;				 
  end process;	
end Behavioral;


