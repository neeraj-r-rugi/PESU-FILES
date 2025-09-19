entity Prob_6_58_vhdl is 	port (A3, A2, A1, A0: buffer bit; C_out: out bit; I3, I2, I1, I0, Count, Load, CLK, Clear_b: in bit);end Prob_6_58_vhdl;architecture Structural of Prob_6_58_vhdl is
	signal Load_bar, I0_bar, I1_bar, I2_bar, I3_bar, Clear_bar: bit;
	signal w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10: bit;
	signal w11, w12, w13, w14, w15, w16, w17, w18, w19: bit;
			component not_gate  port (y: out bit; xin1: in bit); end component;		component and2_gate  port (y: out bit; xin1, xin2: in bit); end component;	component and3_gate  port (y: out bit; xin1, xin2, xin3: in bit); end component;		component and4_gate  port (y: out bit; xin1, xin2, xin3, xin4: in bit); end component;	component and5_gate  port (y: out bit; xin1, xin2, xin3, xin4, xin5: in bit); end component;		component or2_gate  port (y: out bit; xin1, xin2: in bit); end component;		component JK_FF port (Q: buffer bit; J_in, K_in, C, Clear_b: in bit); end component;begin  G0: not_gate port map(Load_bar, Load);  G1: not_gate port map(I0_bar, I0);  G2: not_gate port map(I1_bar, I1);  G3:  not_gate port map(I2_bar, I2);  G4: not_gate port map(I3_bar, I3);  G5:  and2_gate port map(w0, Count, Load_bar);  G6: and2_gate port map(w1, Load, I0);  G7: and2_gate port map(w2, Load, I0_bar);  G8: and2_gate port map(w3, Load, I1);  G9: and2_gate port map(w4, Load, I1_bar);  G10: and2_gate port map(w5, Load, I2);  G11: and2_gate port map(w6, Load, I2_bar);  G12:  and2_gate port map(w7, Load, I3);  G13: and2_gate port map(w8, Load, I3_bar);  G14:  or2_gate port map( w9, w1, w0);  G15: or2_gate port map( w10, w2, w0);  G16: or2_gate port map( w11, w3, w17);  G17: or2_gate port map( w12, w4, w17);  G18: or2_gate port map( w13, w5, w18);  G19: or2_gate port map( w14, w6, w18);  G20: or2_gate port map( w15, w7, w19);  G21: or2_gate port map( w16, w8, w19);  G22: and2_gate port map(w17, w0, A0);  G23: and3_gate port map(w18, w0, A0, A1);  G24: and4_gate port map(w19, w0, A0, A1, A2);  G25: and5_gate port map(C_out, w0, A0, A1, A2, A3);  M0: JK_FF port map(A0, w9, w10, CLK, Clear_b);  M1: JK_FF port map(A1, w11, w12, CLK, Clear_b);  M2: JK_FF port map(A2, w13, w14, CLK, Clear_b);  M3: JK_FF port map(A3, w15, w16, CLK, Clear_b);end Structural;entity JK_FF is	port (Q: buffer bit; J_in, K_in, C, Clear_b: in bit);end JK_FF;architecture Behavioral of JK_FF is
begin  process (C) begin	if C'event and C = '1' then		if (Clear_b = '0' ) then Q <= '0'; else    		case (J_in & K_in) is      		when "00" =>		Q <= Q;      		when "01" =>		Q <= '0';      		when "10" =>		Q <= '1';      		when "11" =>		Q <= not Q;			end case;	
	 end if;	end if;
	end process;end Behavioral;entity and2_gate is
  port (y: out bit; xin1, xin2: in bit);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;

entity and3_gate is
  port (y: out bit; xin1, xin2, xin3: in bit);
end and3_gate;

architecture Behavioral of and3_gate is
begin
	y <= xin1 and xin2 and xin3;
end Behavioral;

entity and4_gate is
  port (y: out bit; xin1, xin2, xin3, xin4: in bit);
end and4_gate;

architecture Behavioral of and4_gate is
begin
	y <= xin1 and xin2 and xin3 and xin4;
end Behavioral;

entity and5_gate is
  port (y: out bit; xin1, xin2, xin3, xin4, xin5: in bit);
end and5_gate;

architecture Behavioral of and5_gate is
begin
	y <= xin1 and xin2 and xin3 and xin4 and xin5;
end Behavioral;

entity or2_gate is
  port (y: out bit; xin1, xin2: in bit);
end or2_gate;

architecture Behavioral of or2_gate is
begin
	y <= xin1 or xin2;
end Behavioral;


entity not_gate is
  port (y: out bit; xin1: in bit);
end not_gate;

architecture Behavioral of not_gate is
begin
	y <= not xin1;
end Behavioral;
