Library IEEE;
use IEEE.Std_Logic_1164.all;

entity Prob_8_36b_Controller_Gates_1Hot_vhdl is
	port (Ready: out Std_Logic; Load_regs, Incr_R2, Shft_left: out Std_Logic;
			Start, Zero, E, clock, reset_b: in Std_Logic);
end Prob_8_36b_Controller_Gates_1Hot_vhdl;

architecture Structural of Prob_8_36b_Controller_Gates_1Hot_vhdl is
 	signal w1, w2, w3, w4, w5, w6: Std_Logic;
	signal D0, D1, D2, D3, T0, T1, T2, T3: Std_Logic;
  	signal Zero_b, E_b,Start_b, set: Std_Logic;

	component D_FF_S
		port (Q: out Std_Logic; D, clock, set: in Std_Logic);
	end component;

	component D_FF
		port (Q: out Std_Logic; D, clock, reset_b: in Std_Logic);
	end component;

	component not_gate
		port (y: out Std_Logic; xin: in Std_Logic);
	end component;

	component and2_gate
		port (y: out Std_Logic; xin1, xin2: in Std_Logic);
	end component;

	component or2_gate
		port (y: out Std_Logic; xin1, xin2: in Std_Logic);
	end component;

	component buf_gate
		port (y: out Std_Logic; xin: in Std_Logic);
	end component;
begin
	Ready <= T0;
	Incr_R2 <= T1;
 	Shft_left <= T2;

  G_14: and2_gate port map (Load_regs, T0, Start);
  G_15: not_gate port map (set, reset_b);
  M0: D_FF_S port map (T0, D0, clock, set);		-- Note: reset action must initialize S_idle = 4'b0001
  D_FF_1: D_FF port map (T1, D1, clock, reset_b);
  D_FF_2: D_FF port map (T2, D2, clock, reset_b);
  D_FF_3: D_FF port map (T3, D3, clock, reset_b);

  G_1: not_gate port map (Start_b, Start);
  G_2: and2_gate port map (w1, T0, Start_b);
  G_3: and2_gate port map (w2, T1, Zero);
  G_4: or2_gate port map (D0, w1, w2);

	G_5: and2_gate port map (w3, T0, Start);
  	G_6: and2_gate port map (w4, T3, E);
  	G_7: or2_gate port map (D1, w3, w4);

  	G_8: not_gate port map (Zero_b, Zero);
  	G_9: not_gate port map (E_b, E);
  	G_10: and2_gate port map (w5, T1, Zero_b);
  	G_11: and2_gate port map (w6, T3, E_b);
  G_12:	or2_gate port map (D2, w5, w6);
  
  	G_13: buf_gate port map (D3, T2);
end Structural;

entity and2_gate is
  port (y: out bit; xin1, xin2: in bit);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;

entity or2_gate is
  port (y: out bit; xin1, xin2: in bit);
end or2_gate;

architecture Behavioral of or2_gate is
begin
	y <= xin1 or xin2;
end Behavioral;

entity not_gate is
  port (y: out bit; xin: in bit);
end not_gate;

architecture Behavioral of not_gate is
begin
	y <= not (xin);
end Behavioral;

entity buf_gate is
  port (y: out bit; xin: in bit);
end buf_gate;

architecture Behavioral of buf_gate is
begin
	y <= xin;
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;

entity D_FF is
	port (Q: out Std_Logic; D, clock, reset_b: in Std_Logic);
end D_FF;

architecture Behavioral of D_FF is
begin
   process (clock, reset_b) begin
		if (reset_b = '0') then Q <= '0';    elsif clock'event and clock = '1' then  Q <= D;
		end if;
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
    elsif clock'event and clock = '1' then Q <= D;
	 end if;
	end process;
end Behavioral;

