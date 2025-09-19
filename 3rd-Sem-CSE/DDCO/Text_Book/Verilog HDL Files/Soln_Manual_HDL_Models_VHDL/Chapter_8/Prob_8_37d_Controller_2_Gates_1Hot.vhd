

Library IEEE;
use IEEE.Std_Logic_1164.all;

entity Prob_8_37d_Controller_2_Gates_1Hot is
	port (Ready, Load_regs, Add_shift: out Std_Logic;
		Start, Zero, clock, reset_b: in Std_Logic);
end Prob_8_37d_Controller_2_Gates_1Hot;

architecture Structural of Prob_8_37d_Controller_2_Gates_1Hot is
	signal w1, w2, w3, w4: Std_Logic;
	signal T0, T1: Std_Logic;
	signal set: Std_Logic;
	signal D0, D1: Std_Logic;
	signal Zero_b, Start_b: Std_Logic;

	component D_FF port (Q: out Std_Logic; D, clock, reset_b: in Std_Logic);
	end component;

	component D_FF_S port (Q: out Std_Logic; D, clock, set: in Std_Logic);
	end component;
begin

	Ready <= T0;  
	Add_shift <= T1;
	Load_regs <= T0 and Start;
 	set <= not reset_b;

  	M0:	D_FF_S port map (T0, D0, clock, set);		-- Note: reset action must 
  	M1:	D_FF port map (T1, D1, clock, reset_b);	-- initialize S_idle = 2'b01

 	Start_b <= not Start;
 	Zero_b <= not  Zero;
 	w1 <=  T0  and Start_b;
  	w2 <= T1 and Zero;
	D0 <= w1 or w2;
	w3 <= T0 and Start;
	w4 <= T1 and Zero_b;
  	D1  <= w3 or w4;
end Structural;

Library IEEE;
use IEEE.Std_Logic_1164.all;

entity D_FF is
	port (Q: out Std_Logic; D, clock, reset_b: in Std_Logic);
end D_FF;
architecture Behavioral of D_FF is
begin
	process (clock, reset_b) begin
		if (reset_b = '0') then Q <= '0';
    		elsif clock'event and clock = '1' then Q <= D; end if;
	end process;
end Behavioral;


Library IEEE;
use IEEE.Std_Logic_1164.all;

entity D_FF_S is
	port (Q: out Std_Logic; D, clock, set: in Std_Logic);
end D_FF_S;

architecture Behavioral of D_FF_S is
begin
	process (clock, set) begin
		if (set = '1') then Q <= '1';
    		elsif clock'event and clock = '1' then Q <= D; end if;
	end process;
end Behavioral;
