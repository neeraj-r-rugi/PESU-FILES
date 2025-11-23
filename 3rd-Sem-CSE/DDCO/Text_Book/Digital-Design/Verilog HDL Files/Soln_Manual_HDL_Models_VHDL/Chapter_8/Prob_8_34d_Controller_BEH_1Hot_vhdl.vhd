-- One-Hot Control unit
Library IEEE;
use IEEE.Std_Logic_1164.all;
Library Synopsys;
use Synopsys.attributes.all;

entity Prob_8_34d_Controller_BEH_1Hot_vhdl is
	port (Ready: out Std_Logic; Load_regs, Incr_R2, Shift_left: out Std_Logic; 
			Start, Zero, E, clock, reset_b: in Std_Logic);
end Prob_8_34d_Controller_BEH_1Hot_vhdl;

architecture Behavioral of Prob_8_34d_Controller_BEH_1Hot_vhdl is
	type State_type is (S_idle, S_1, S_2, S_3);
	attribute enum_encoding of State_type: type is "0001 0010 0100 1000";
	signal state, next_state: State_type;

begin
	Ready <= '1' when (state = S_idle) else '0';
 	Incr_R2 <= '1' when (state = S_1) else '0';
 	Shift_left <= '1' when (state = S_2) else '0';

	process (clock, reset_b) begin
    		if (reset_b = '0') then state <= S_idle;
    		elsif clock'event and clock = '1' then  state <= next_state; end if;
	end process;
	process (state, Start, Zero, E) begin
    		Load_regs <= '0';
    		case (state) is
      		when S_idle =>	if (Start = '1') then Load_regs <= '1'; next_state <= S_1;  
 							else next_state <= S_idle; end if;

      		when S_1 =>	if (Zero = '1') then next_state <= S_idle; 
							else next_state <= S_2; end if;
	
      		when S_2 =>	next_state <= S_3;
      
			when S_3 =>	if (E = '1') then next_state <= S_1; 
							else next_state <= S_2; end if;
			when others => next_state <= S_idle;
		end case;
	end process;
end Behavioral;

