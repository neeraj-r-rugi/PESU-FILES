
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;
use IEEE.Std_Logic_unsigned.all;
entity Prob_8_28_Sequential_Binary_Multiplier_vhdl is 
 	generic (dp_width: integer := 5; BC_size: integer := 3);
	port (Product: out Std_Logic_vector (2*dp_width downto 0); 
		Ready: out Std_Logic;
		Multiplicand, Multiplier: in Std_Logic_vector (dp_width -1 downto 0); 
		Start, clock, reset_b: in Std_Logic);
end Prob_8_28_Sequential_Binary_Multiplier_vhdl;
	
architecture Structural of Prob_8_28_Sequential_Binary_Multiplier_vhdl is
		signal Load_regs, Decr_P, Add_regs, Shift_regs, Q0, Zero: Std_Logic;
		
		component Controller 
			generic (dp_width, BC_size: integer);
			port (Ready, Load_regs, Decr_P, Add_regs, Shift_regs: out Std_Logic;   
	 			Start, Zero, Q0, clock, reset_b: in Std_Logic);
		end component;

		component Datapath 
			generic (dp_width, BC_size: integer);
			port (Product: out Std_Logic_vector (2*dp_width downto 0); 
				Q0, Zero: out Std_Logic; 
				Multiplicand, Multiplier: in Std_Logic_vector (dp_width - 1 downto 0);
				Start, Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b: in Std_Logic);
		end component;
begin
  M0: Controller generic map (dp_width => 5, BC_size => 3)
					port map(Ready, Load_regs, Decr_P, Add_regs, Shift_regs, Start, Zero, Q0, clock, reset_b);
					
  M1: Datapath generic map (dp_width => 5, BC_size => 3)
					port map (Product, Q0, Zero, Multiplicand, Multiplier, Start, Load_regs, Decr_P, Add_regs, 
					Shift_regs, clock, reset_b);	
end Structural; 


library ieee;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Controller is
		generic (dp_width: integer := 5; BC_size: integer := 3);
		port (Ready, Load_regs, Decr_P, Add_regs, Shift_regs: out Std_Logic;   
	 			Start, Zero, Q0, clock, reset_b: in Std_Logic);
end Controller;

architecture Structural of Controller is
-- One-Hot C	ontrol unit (See Fig. 8.18)
		signal G0, G1, G2,D0, w1, w2, D1, w3, w4, Set, Start_b, Zero_b: Std_Logic;
		component D_FF_S port (Q: out Std_Logic; D, C, Set: in Std_Logic);
		end component;

		component D_FF port (Q: out Std_Logic; D, C, Clear_b: in Std_Logic);
		end component;

		component or2_gate port (y: out Std_Logic; xin1, xin2: in Std_Logic);
		end component;

		component and2_gate port(y: out Std_Logic; xin1, xin2: in Std_Logic);
		end component;

		component not_gate port(y: out Std_Logic; xin: in Std_Logic);
		end component;

begin
		M_0: D_FF_S port map (G0, D0, clock, Set);
		M_1:D_FF port map (G1, D1, clock, reset_b);
		M_2: D_FF port map (G2, G1, clock, reset_b);
		G_1: or2_gate port map (D0, w1, w2);
		G_2: and2_gate port map (w1, G0, Start_b);
		G_3: and2_gate port map (w2, Zero, G2);
		G_4: not_gate port map (Start_b, Start);
		G_5: not_gate port map (Zero_b, Zero);
		G_6: or2_gate port map (D1, w3, w4);
		G_7: and2_gate port map (w3, Start, G0);
		G_8: and2_gate port map (w4, Zero_b, G2);
		G_9: and2_gate port map (Load_regs, G0, Start);
		G_10: and2_gate port map (Add_regs, Q0, G1);
		G_11:  not_gate port map (Set, reset_b);

		Ready <= G0;  
		Decr_P <= G1;
		Shift_regs <= G2;
end  Structural;

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;
--use IEEE.Std_Logic_arith.all;
entity Datapath is
		generic (dp_width: integer := 5; BC_size: integer := 3);
		port (Product:	buffer Std_Logic_vector (2*dp_width downto 0); 
			Q0, Zero: out Std_Logic; 
			Multiplicand, Multiplier: in Std_Logic_vector (dp_width - 1 downto 0);
			Start, Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b: in Std_Logic);
end Datapath;

architecture Behavioral of Datapath is
		signal	A, B, Q: Std_Logic_vector (dp_width-1 downto 0);		-- Sized for datapath
		signal	C: Std_Logic;
		signal P: integer;	--Std_Logic_vector (BC_size - 1 downto 0);
		--signal S: Std_Logic_vector (dp_width downto 0);
		signal Sum: Std_Logic_vector (dp_width downto 0);
begin	
		Product <= C & A & Q;
  -- Status signals
		Zero <= '1' when P = 0 else '0';		-- counter is zero
		Q0 <= Q(0);

		process (clock) begin
         if(clock'event and clock = '1') then
				if (Load_regs = '1') then
      			P <= dp_width;
      			for k in dp_width-1 downto 0 loop A(k) <= '0'; end loop;
      			C <= '0';
      			B <= Multiplicand;
      			Q <= Multiplier;
				end if;
				if Add_regs = '1' then 
					--S <= ('0' & A) + ('0' & B) + S(2*dp_width);
					--(C & A) <= ('0' & A) + ('0' & B) + C;
					C <= Sum(dp_width);
					A <= Sum(dp_width-1 downto 0);							
				end if;
				if Shift_regs = '1' then 
					C <= '0'; 
					A <= C & A(dp_width-1 downto 1);
					Q <= A(0) & Q(dp_width-1 downto 1);
				end if;								
				if Decr_P = '1' then 
					P <= P -1;	
				end if;
			end if;
		end process;
end Behavioral; 

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;

entity D_FF is
		port (Q: out Std_Logic; D, C, Clear_b: in Std_Logic);
end D_FF;
	
architecture Behavioral of D_FF is
begin	   

		process (C) begin
			if C'event and C = '1' then
				if(Clear_b = '0') then Q <= '0'; 
				else Q <= D;
				end if;
			end if;
		end process;
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;
entity D_FF_S is
	 port (Q: out Std_Logic; D, C, Set: in Std_Logic);
end D_FF_S;

architecture Behavioral of D_FF_S is
begin	   

		process (C) begin
			if C'event and C = '1' then
				if(Set = '0') then Q <= '1'; 
				else Q <= D;
				end if;
			end if;
		end process;
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;

entity or2_gate is
  port (y: out Std_Logic; xin1, xin2: in Std_Logic);
end or2_gate;

architecture Behavioral of or2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;
entity and2_gate is
  port (y: out Std_Logic; xin1, xin2: in Std_Logic);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_unsigned.all;

entity not_gate is
  port (y: out Std_Logic; xin: in Std_Logic);
end not_gate;

architecture Behavioral of not_gate is
begin
	y <= not xin;
end Behavioral;

