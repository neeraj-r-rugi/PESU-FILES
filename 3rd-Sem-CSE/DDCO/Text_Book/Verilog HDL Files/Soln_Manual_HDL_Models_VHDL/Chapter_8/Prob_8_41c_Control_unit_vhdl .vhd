Library IEEE;
use IEEE.Std_Logic_1164.all;

entity Prob_8_41c_Control_unit_vhdl is
	port (Clr_P1_P0, Ld_P1_P0, Ld_R0: out Std_Logic; En, Ld, clock, rst: in Std_Logic);
end Prob_8_41c_Control_unit_vhdl;

	
	
architecture Behavioral of Prob_8_41c_Control_unit_vhdl is
	constant S_idle: 	Std_Logic_vector 	(3 downto 0)   := "0001";
	constant S_1: 		Std_Logic_vector 	(3 downto 0)  	:= "0010"; 
	constant S_full:	Std_Logic_vector 	(3 downto 0)   := "0100";
	constant S_wait: 	Std_Logic_vector 	(3 downto 0) 	:= "1000";

	signal state, next_state: Std_Logic_vector (3 downto 0);
begin
	process (clock) begin
   		if clock'event and clock = '1' then
				if rst = '1' then state <= S_idle;
				else state <= next_state;
				end if;
			end if;			
	end process;
	
  	process (state, Ld, En) begin
    	Clr_P1_P0 	<= '0';				 Assign by exception
Ld_P1_P0 	<= '0';
		Ld_R0 		<= '0';
		next_state 	<= S_idle;
   
		case (state) is
      		when S_idle =>	if (En = '1') then 
									Ld_P1_P0 <= 1; 
									next_state <= S_1; 
									else next_state <= S_idle;
									end if;
									
      		when S_1 =>		Ld_P1_P0 <= 1; 
									next_state <= S_full;  

     		 	when S_full =>	if Ld = '0' then next_state <= S_wait; 
									else   
										Ld_R0 <= 1;
										if En = '1' then 
											Ld_P1_P0 <= 1; 					
											next_state <= S_1;  
										else 
											Clr_P1_P0 <= 1; 
											next_state <= S_idle;  
										end if;
									end if;

      		when S_wait =>	if Ld = '0' then next_state <= S_wait;
									else  
										Ld_R0 <= 1;
										if En = '1' then 
											Ld_P1_P0 <= 1; 
			next_state <= S_1;  
										else 
											Clr_P1_P0 <= 1; 
											next_state <= S_idle;   
										end if;
									end if;

      		when others =>	next_state <= S_idle;
    	end case;
  	end process;
end Behavioral;



