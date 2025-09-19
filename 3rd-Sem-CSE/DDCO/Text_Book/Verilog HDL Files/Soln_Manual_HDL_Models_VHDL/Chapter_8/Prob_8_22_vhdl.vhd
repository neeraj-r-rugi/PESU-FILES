Library IEEE;
use IEEE.Std_Logic_1164.all;

entity Prob_8_22_vhdl is
	generic (m_size: integer := 9);
	port (Product: out Std_Logic_vector (2*m_size -1 downto 0);
 		Ready: out Std_Logic; 
 		Multiplicand, Multiplier: in Std_Logic_vector (m_size -1 downto 0);
		Start, clock, reset_b: in Std_Logic);
end Prob_8_22_vhdl;

architecture Structural of Prob_8_22_vhdl  is 
	signal A, Q: Std_Logic_vector (m_size -1 downto 0);
	signal Q0, Zero, Load_regs, Decr_P, Add_regs, Shift_regs: Std_Logic;
	component Datapath_Unit 
		generic (m_size,  BC_size: integer); 
		port (	A, Q: out Std_Logic_vector (m_size -1 downto 0);
 				Q0, Zero: out Std_Logic; 
				Multiplicand, Multiplier: in Std_Logic_vector (m_size -1 downto 0); 
				Load_regs, Decr_P,  Add_regs, Shift_regs, clock, reset_b: in Std_Logic);
	 end component;

	component Control_Unit 
		port (Ready, Decr_P, Load_regs, Add_regs, Shift_regs: out Std_Logic; Start, Q0, Zero, clock, reset_b: in std_Logic);
	end component;

begin
		Product <= A & Q;

M0: Datapath_Unit generic map (m_size => 9, BC_size => 3)
port map (A, Q, Q0, Zero, Multiplicand, Multiplier, Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b);

M1: Control_Unit port map (Ready, Decr_P, Load_regs, Add_regs, Shift_regs, Start, Q0, Zero, clock, reset_b);
end Structural;

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Datapath_Unit is
	generic (m_size ,  BC_size: integer); 
		port (A: buffer Unsigned (m_size -1 downto 0); Q: buffer Unsigned (m_size-1 downto 0);
 			Q0, Zero: out Std_Logic;
				Multiplicand, Multiplier: in Unsigned (m_size -1 downto 0);   
				Load_regs, Decr_P,  Add_regs, Shift_regs, clock, reset_b: in Std_Logic);
end DataPath_Unit;

architecture Behavioral of Datapath_Unit is
  	signal C: Std_Logic;
	signal P: integer;	
 	signal B: Unsigned (m_size-1 downto 0);
	signal sum: Unsigned (m_size downto 0);
begin
		
	Q0 <= Q(0);
 	Zero <= '1' when (P = 0) else '0';
	Sum <= ('0' & A) + ('0' & B); 
	process (clock, reset_b) begin
   		if (reset_b = '0') then
   			for k in 0 to m_size-1 loop A(k) <= '0'; end loop;
	   		for k in 0 to m_size-1 loop B(k) <= '0'; ebnd loop;
	   		for k in 0 to m_size-1 lobop Q(k) <= '0'; end loop;
				C <= '0';
				P <= m_size;
			elsif clock'event and clock = '1' then 
    			if (Load_regs = '1') then 
      			for k in 0 to m_size-1 loop A(k) <= '0'; end loop;
      			C <= '0';
      			Q <= Multiplier;
      			B <= Multiplicand;
      			P <= m_size;
			end if;  
    			if (Decr_P = '1') then P <= P -1; end if;
				
   			if (Add_regs = '1') then 
				C <= Sum(m_size);
				A <= Sum (m_size-1 downto 0);									
			end if;
				
    			if (Shift_regs = '1')  then
					C <= '0';
					A <= C & A(m_size-1 downto 1);
					Q <= A(0) & Q(m_size-1 downto 1); 
			end if;
  		end if;
	end process;
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;
 
entity Control_Unit is
	port (Ready, Decr_P, Load_regs, Add_regs, Shift_regs: out Std_Logic; Start, Q0, Zero,clock, reset_b: in Std_Logic);
end Control_Unit;

architecture Behavioral of Control_Unit is
  	signal state, next_state: Std_Logic_vector (1 downto 0);
	constant	S_idle: Std_Logic_vector (1 downto 0) := "00";
	constant	S_loaded: Std_Logic_vector (1 downto 0) := "01";
	constant	S_sum: Std_Logic_vector (1 downto 0) := "10";
	constant	S_shifted: Std_Logic_vector (1 downto 0) := "11";

begin
	Ready <= '1' when (state = S_idle) else '0';
	Decr_P <= '1' when (state = S_loaded) else '0';

	process (clock, reset_b) begin
		if (reset_b = '0') then state <= S_idle; 
		elsif clock'event and clock = '1' then state <= next_state; end if; 
	end process;
	
	process (state, Start, Q0, Zero) begin
    		next_state <= S_idle;
     		Load_regs <= '0';
    		Add_regs <= '0';
    		Shift_regs <= '0';
    		case (state) is
      		when S_idle =>	if (Start = '0') then next_state <= S_idle; 
								else next_state <= S_loaded; Load_regs <= '1'; 
								end if;

     			when S_loaded =>	if (Q0 = '1') then next_state <= S_sum; Add_regs <= '1'; 
									else next_state <= S_shifted; Shift_regs <= '1'; end if;
      
				when S_sum =>	next_state <= S_shifted; Shift_regs <= '1'; 

      			when S_shifted =>	if (Zero = '1') then next_state <= S_idle; 					
									else next_state <= S_loaded; end if;
    		end case;
  	end process;
end Behavioral;

