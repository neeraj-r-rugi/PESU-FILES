library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Arith.all;

entity Prob_8_24_vhdl is		
		generic (dp_width: integer := 5);
		port (Product: out Std_Logic_vector(2*dp_width downto 0);	
			Ready: out bit;
			Multiplicand, Multiplier: in Std_Logic_vector(dp_width -1 downto 0);
			Start, clock, reset_b: in bit);
end Prob_8_24_vhdl;

architecture Partitioned of Prob_8_24_vhdl is
  	signal Load_regs, Decr_P, Add_regs, Shift_regs, Zero, Q0: bit;	
	component Controller  
		generic (dp_width, BC_width: integer);
		port (Ready: out bit;  
				Load_regs, Decr_P, Add_regs, Shift_regs: out bit;   
				Start, Zero, Q0, clock, reset_b: in bit); 
	end component;
	
	component Datapath 	
		generic (dp_width, BC_width: integer);
		port (Product: out Std_Logic_Vector (2*dp_width downto 0);	-- (2*dp_width-1 downto 0);
				Q0, Zero: out bit;
				Multiplicand, Multiplier: in Std_Logic_vector (dp_width-1 downto 0);
				Start, Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b: in bit);
		end component;
	begin
M0: Controller 
	generic map (dp_width => 5, BC_width => 3) 
	port map (Ready, Load_regs, Decr_P, Add_regs, Shift_regs, Start, Zero, Q0, clock, reset_b); 

M1: Datapath 
	generic map (dp_width => 5, BC_width => 3) 
	port map (Product, Q0, Zero, Multiplicand, Multiplier, Start, Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b);
end Partitioned;

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Arith.all;
library Synopsys;
use Synopsys.attributes.all;	-- used for one-hot encoding of states 

entity Controller is
	generic (dp_width, BC_width: integer);
	port (Ready, Load_regs, Decr_P, Add_regs, Shift_regs: out bit;  
				Start, Zero, Q0, clock, reset_b: in bit);
end Controller;

architecture Behavioral of Controller is
  type State_type is (S_idle, S_add, s_shift);
  attribute enum_encoding of State_type: type is "001 010 100";	-- one-hot

  signal state, next_state: State_type;

begin
  	Ready <= '1' when (state = S_idle) else '0';	 
 
  	process  (clock, reset_b) begin
    		if (reset_b = '0') then state <= S_idle; else state <= next_state; end if;
		end process;

  	process  (state, Start, Q0, Zero) begin
    		next_state <= S_idle;
    		Load_regs <= '0';
    		Decr_P <= '0';
    		Add_regs <= '0';
    		Shift_regs <= '0';
    		case (state) is
      			when S_idle =>		if (Start = '1') then next_state <= S_add; Load_regs <= '1'; end if;
      			when S_add =>		next_state <= S_shift; Decr_P <= '1'; if (Q0 = '1') then Add_regs <= '1'; end if;
      			when S_shift =>	Shift_regs <= '1';  if (zero = '1') then next_state <= S_idle; 
											else next_state <= S_add; end if;
					when others  =>	next_state <= S_idle;
			end case;
		end process;
end Behavioral;

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Arith.all;
use IEEE.Std_Logic_unsigned.all;

entity Datapath is	
	generic (dp_width, BC_width: integer);
  	port (	Product: buffer Std_Logic_vector (2*dp_width downto 0);
				Q0: out Std_Logic;
				Zero: out Bit;
    			Multiplicand, Multiplier: in Std_Logic_vector (dp_width - 1 downto 0);
				Start, Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b: in bit);begin
end Datapath;
architecture Behavioral of Datapath is 
 	signal 	C: Std_Logic;	
  	signal	A, B, Q: Std_Logic_vector (dp_width - 1 downto 0);		-- Sized for datapath
	signal 	P: integer;
	signal S: Std_Logic_vector (dp_width downto 0);
 --	signal 	P: Std_Logic_vector (BC_width -1 downto 0);			-- Bit counter
begin	
 
  	Q0 <= Q(0);	
 	Product <= C & A & Q;	
	
	process(P) begin			-- Check for empty P (Bit counter)
		if P = 0 then Zero <= '1'; else Zero <= '0'; end if;
	end process;	

  	process   (clock, reset_b) begin
    	if (reset_b = '0') then	
       	C <= '0';      	
			for k in 0 to dp_width-1 loop							
      		B(k) <= '0';							
      		A(k) <= '0';
      		Q(k) <= '0';
			end loop;  
		elsif clock'event and clock = '1' then 
			if (Load_regs = '1') then
				P <= dp_width;
				C <= '0';				
				B <= Multiplicand;
				Q <= Multiplier;
				for k in 0 to dp_width-1 loop						
					A(k) <= '0';
				end loop;end if; 	
			if (Add_regs = '1') then 
				S <= ('0' & A) + ('0' & B);   
				C <= S(dp_width); 
				A <= S(dp_width-1 downto 0); 
			end if;
			
			if (Shift_regs = '1') then
				Q <= A(0) & Q(dp_width-1 downto 1);
				A <= C & A(dp_width -1 downto 1);
				C <= '0';
			end if;
			if (Decr_P = '1') then P <= P -1; end if;
		end if;
  	end process;
end Behavioral;
