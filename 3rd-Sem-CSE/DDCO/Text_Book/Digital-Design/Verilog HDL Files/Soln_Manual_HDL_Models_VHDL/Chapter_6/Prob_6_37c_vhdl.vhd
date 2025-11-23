library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Prob_6_37c_vhdl is	-- Counter_FSM 
	port (Count: out Std_Logic_Vector (3 downto 0); clock, reset:in Std_Logic);
end Prob_6_37c_vhdl;

architecture State_Machine of Prob_6_37c_vhdl is
	type State_type is (s0, s1, s2, s3, s4, s5, s6);
	signal state, next_state: State_type;
begin
  	process (clock, reset) begin
    		if (reset = '1') then state <= s0; 
		elsif clock'event and clock = '1' then state <= next_state;
		end if;
	end process;
	
  	process (state) begin
  		Count <= "0000";
		next_state <= s0;
    		case (state) is
        		when s0 =>			next_state <= s1; Count <= "0000"; 
        		when s1 =>			next_state <= s2; Count <= "0001"; 
        		when s2 =>			next_state <= s3; Count <= "0011"; 
        		when s3 =>			next_state <= s4; Count <= "0111"; 
        		when s4 =>			next_state <= s5; Count <= "0110"; 
       		 when s5 =>			next_state <= s6; Count <= "0100"; 
        		when others =>		next_state <= s0; Count <= "0000"; 
     		end case;
  	end process; 
end State_Machine;

