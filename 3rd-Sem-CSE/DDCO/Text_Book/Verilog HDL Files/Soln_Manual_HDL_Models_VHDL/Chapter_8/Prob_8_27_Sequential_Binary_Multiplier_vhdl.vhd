Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Unsigned.all;
Library Synopsys;
use Synopsys.attributes.all;

entity Prob_8_27_Sequential_Binary_Multiplier_vhdl is
		generic (dp_width: integer := 5; BC_size: integer := 3); 	-- Width of datapath, counter
 	port (Product: out Std_Logic_vector (2*dp_width downto  0);
 			Ready:	 out Std_Logic;
 			Multiplicand, Multiplier: in Std_Logic_vector (dp_width -1 downto 0);
 			Start, clock, reset_b: in Std_Logic);
 end Prob_8_27_Sequential_Binary_Multiplier_vhdl; 

  architecture Behavioral of Prob_8_27_Sequential_Binary_Multiplier_vhdl is
  	type  State_type is (S_idle, S_add, S_shift);
		attribute enum_encoding of State_type: type is "001 010 100";	-- one-hot
        
  	signal 	state, next_state: State_type;
  	signal 	A, B, Q: Std_Logic_vector (dp_width - 1  downto 0);		-- Sized for datapath
	signal 	C: Std_Logic;						 
  	signal	P: integer; -- Std_Logic_vector (BC_size- 1 downto 0);	
	signal 	Load_regs, Decr_P, Add_regs, Shift_regs: Std_Logic;
	signal 	Sum: Std_Logic_Vector (dp_width downto 0);
	signal	Zero: Std_Logic;
begin
-- Miscellaneous combinational logic
		Ready <= '1' when (state = S_idle) else '0';		-- controller status

 	Product <= C & A & Q;
	Sum <= ('0' & A) + ('0' & B);	-- Forms Sum from combinational logic
	
	process (P) begin
		if P = 0 then Zero <= '1'; else Zero <= '0'; end if;
	end process;
		
-- control unit

  	process (clock, reset_b)begin
    		if (reset_b = '0') then state <= S_idle; 
			elsif clock'event and clock = '1' then state <= next_state;
			end if;
	end process;
	
  process (state, Start, Q(0), Zero) begin
    	next_state <= S_idle;
    	Load_regs <= '0';
   	Decr_P <= '0';
    	Add_regs <= '0';
   	Shift_regs <= '0';
    	case (state) is
      	when S_idle =>	if (Start = '1') then
								next_state <= S_add; 
								Load_regs <= '1'; 
							end if;
      	when S_add =>	next_state <= S_shift; 
							Decr_P <= '1'; 
							if (Q(0) = '1') then Add_regs <= '1'; 
							end if;
      	when S_shift =>	Shift_regs <= '1'; 
									if (Zero = '1') then next_state <= S_idle; 
									else next_state <= S_add; end if;
      	when others =>		next_state <= S_idle;
		end case;
  end process;

-- datapath unit

		process (clock) begin
			if (clock'event and clock = '1') then
				if (Load_regs = '1') then
      				P <= dp_width;
      				for k in dp_width-1 downto 0 loop A(k) <= '0'; end loop;
      				C <= '0';
      				B <= Multiplicand;
      				Q <= Multiplier;
    			elsif Add_regs = '1' then --Sum <= ('0' & A) + ('0' & B);
						C <= Sum(dp_width);
						A <= Sum(dp_width-1 downto 0);
				elsif (Shift_regs = '1') then  
					C <= '0';
					A <= C & A(dp_width-1 downto 1) ;
					Q <= A(0) & Q(dp_width-1 downto 1);
  			end if;
			end if;
		end process;
end Behavioral; 

