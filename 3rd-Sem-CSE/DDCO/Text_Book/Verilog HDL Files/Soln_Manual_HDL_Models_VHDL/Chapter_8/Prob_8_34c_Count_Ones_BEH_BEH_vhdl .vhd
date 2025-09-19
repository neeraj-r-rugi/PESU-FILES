Library IEEE;
use IEEE.Std_Logic_1164.all;
-- Integrated system
entity Prob_8_34c_Count_Ones_BEH_BEH_vhdl is
	generic (dp_width: integer := 8; R2_width: integer := 4);
	port (Ready: out Std_Logic; count: out Std_Logic_vector(R2_width -1 downto 0); 
			data: in Std_Logic_vector (dp_width - 1 downto 0);  
			Start, clock, reset_b: in Std_Logic);
end Prob_8_34c_Count_Ones_BEH_BEH_vhdl;

architecture Structural of Prob_8_34c_Count_Ones_BEH_BEH_vhdl is
	signal	Load_regs, Incr_R2, Shift_left, Zero, E: Std_Logic;

	component Controller_BEH port (Ready, Load_regs, Incr_R2, Shift_left: out Std_Logic;
					 Start, Zero, E, clock, reset_b: in Std_Logic);
	end component;
	component  Datapath_BEH port (count: out Std_Logic_vector (Dp_width-1 downto 0); E, Zero: out Std_Logic; 
					data: in Std_Logic_vector (dp_width -1 downto 0);
					 Load_regs, Shift_left, Incr_R2, clock, reset_b: in Std_Logic);
	end component;
	
begin

M0: Controller_BEH port map (Ready, Load_regs, Incr_R2, Shift_left, Start, Zero, E, clock, reset_b);
M1: Datapath_BEH port map (count, E, Zero, data, Load_regs, Shift_left, Incr_R2, clock, reset_b);
end Structural;

