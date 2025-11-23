Library IEEE;
use IEEE.Std_Logic_1164.all;



entity Prob_8_29h_Controller_vhdl is
	port (x, y, E, F, clock, reset_b: in Std_Logic);
end Prob_8_29h_Controller_vhdl;

architecture Behavioral of Prob_8_29h_Controller_vhdl is
	constant  S_0: Std_Logic_vector (2 downto 0) :=  "000";
	constant  S_1: Std_Logic_vector (2 downto 0) :=  "001";
	constant  S_2: Std_Logic_vector (2 downto 0) :=  "010";
	constant  S_3: Std_Logic_vector (2 downto 0) :=  "011";
	constant  S_4: Std_Logic_vector (2 downto 0) :=  "100";
	constant  S_5: Std_Logic_vector (2 downto 0) :=  "101";
	constant  S_6: Std_Logic_vector (2 downto 0) :=  "110";
	constant  S_7: Std_Logic_vector (2 downto 0) :=  "111";
	signal state, next_state: Std_Logic_vector (2 downto 0);
begin

	process (clock, reset_b)  begin
    		if (reset_b = '0') then state <= S_0; 
		elsif clock'event and clock = '1' then state <= next_state; 
		end if;
	end process;
	
	process (state, x, y, E, F) begin
		next_state <= S_0;
    		case (state) is
      		when S_0 =>	if (x = '1') then next_state <= S_1;
								elsif y = '1' then next_state <= S_2; 
								else next_state <= S_0; end if;
      		when S_1 =>	 	next_state <= S_2;  
      		when S_2 =>	if (F = '1') then next_state <= S_3; 
								else next_state <= S_4; end if;
      		when S_4 =>	 	if (E = '1') then next_state <= S_5; 
								else next_state <= S_6; end if;      		
				when S_3 =>	next_state <= S_0; 
				when S_5 =>	next_state <= S_0; 
      		when S_6 =>	next_state <= S_7;				
				when S_7 =>	next_state <= S_0;
      		when others =>	next_state <= S_0;
    		end case;
  	end process;
end Behavioral;
 
