Library IEEE;
use IEEE.Std_Logic_1164.all;

entity Prob_8_36d_Datapath_STR_vhdl isgeneric (R1_size: integer := 8; R2_size: integer := 4);
port (count: out Std_Logic_Vector (R2_size -1 downto 0);		E, Zero: out Std_Logic; 
		data: in Std_Logic_Vector (R1_size -1 downto 0); 		Load_regs, Shft_left, Incr_R2, clock: in Std_Logic);		end Prob_8_36d_Datapath_STR_vhdl;architecture Structural of Prob_8_36d_Datapath_STR_vhdl is	signal 	R1: Std_Logic_Vector (R1_size -1 downto 0);	signal 	R2: Std_Logic_Vector (R2_size -1 downto 0);	signal 	Zero: Std_Logic;	signal 	PWR: Std_Logic;	signal	GND: Std_Logic;component	Shft_Reg port (R1: out Std_Logic_Vector (R1_size-1 downto 0); 	data: in Std_Logic_Vector (R1_size -1 downto 0); 	SI_0, Shft_left, Load_regs: in Std_Logic;	clock, reset_b: in Std_Logic);end component;
 component	Counter port (R2: buffer Std_Logic_Vector (R2_size -1 downto 0);					Load_regs, Incr_R2: in Std_Logic;					clock, reset_b: in Std_Logic);end component;
component	D_flip_flop_AR	port (Q: out Std_Logic; D: in Std_Logic;											CLK, RST_b : in Std_Logic);end component;component	and2_gate port (y: out Std_Logic; xin1, xin2 : in Std_Logic);end component;begin	-- concurrent statements

	PWR <= '1';
	GND <= '0';
	process (R1) begin		-- Check for empty R1		Zero <= '1';		for k in   0 to R1_size -1 loop 
			if R1(k) = '1' then Zero <= '0'; end if; 
		end loop;	end process;
-- Instantiate components
	M1:	Shft_Reg port map (R1, data, GND,  Shft_left, Load_regs, clock, PWR);	M2:	Counter port map (R2 => count, Load_regs => Load_regs, Incr_R2 => Incr_R2, 								clock => clock, reset_b => PWR);	M3:	D_flip_flop_AR	port map (Q => E, D => w1, CLK => clock, RST_b => PWR);	G0:	and2_gate  port map (y => w1, xin1 => R1(R1_size-1), xin2 => Shft_left);
end Structural;entity Shft_Reg is   generic (R1_size: integer  := 8);   port (R1: out Std_Logic_Vector (R1_size-1 downto 0);    		data: in Std_Logic_Vector (R1_size-1 downto 0);		    		SI_0,  Shft_left, Load_regs: in Std_Logic;			clock, reset_b: in Std_Logic);end Shft_Reg;architecture Behavioral of Shft_Reg is 	signal PWR: Std_Logic;	signal GND: Std_Logic;begin
	PWR <= '1';
	GND <= '0';
		process (clock, reset_b) 	begin		if reset_b = '0' then for k in   0 to R1_size-1 loop R1(k) <= '0'; end loop;		elsif clock'event and clock = '1' then			if Load_regs = '1' then R1 <= data;			elsif Shft_left = '1' then R1 <= R1(R1_size-2 downto 0) & SI0;			end if;		end if;
		end if;	end process;end Behavioral;


Library IEEE;
use IEEE.Std_Logic_1164.all;entity Counter is   generic (R2_size: integer:= 4);   port (R2: out Std_Logic_Vector (R2_size-1 downto 0);   Load_regs, Incr_R2: in Std_Logic; 
	clock, reset_b: in Std_Logic);end Counter;architecture Behavioral of Counter isbeginprocess (clock, reset_b) begin   if reset_b = '0' then for k in   R2_size-1 downto 0 loop R2(k) <= '0'; end loop;    elsif clock'event and clock = '1' then		-- Fill with 1s		if Load_regs = '1' then for k in   0 to R2_size-1 loop  R2(k) <= '1'; end loop;		elsif Incr_R2 = '1' then R2 <= R2 + '1';		end if;
	end if;	end if;
end process;end Behavioral;entity D_flip_flop_AR is   port (Q: out Std_Logic; D, CLK, RST_b: in Std_Logic);end D_flip_flop_AR;architecture Behavioral of D_flip_flop_AR isbeginprocess (CLK, RST_b) begin
   if RST_b ='0' then for k in   0 to R1_size-1 Q(k) <= '0';   elsif CLK'event and CLK = '1' then Q <= D;   end if;end process;end Behavioral; 
entity and2_gate is
  port (y: out bit; xin1, xin2: in bit);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;
