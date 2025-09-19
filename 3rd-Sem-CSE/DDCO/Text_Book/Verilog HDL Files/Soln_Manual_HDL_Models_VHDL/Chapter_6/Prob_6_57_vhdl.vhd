entity Prob_6_57_vhdl is	port (A3: out bit; A2, A1, A0: buffer bit; Up, Down, CLK, Clear_b: in bit);end Prob_6_57_vhdl;architecture Structural of Prob_6_57_vhdl is	component not_gate	port (y: out bit; xin1: in bit); end component;	component and2_gate  port (y: out bit; xin1, xin2: in bit); end component;	component or2_gate  	port (y: out bit; xin1, xin2: in bit); end component;	component T_FFLOP 			port (Q: buffer bit; Q_bar: out bit; T, C, Clear_b: in bit); end component;	signal Up_bar, A0_bar, A1_bar, A2_bar, A3_bar, w1, w2, w3, w4, w5, w6, w7: bit;	signal T0, T1, T2, T3: bit;begin  M0: not_gate port map (Up_bar, Up);

  M1: and2_gate port map (w1, Up_bar, Down);
  M2: and2_gate port map (w2, w1, A0_bar);
  M3: and2_gate port map (w3, Up, A0);
  M4: and2_gate port map (w4, w2, A1_bar);
  M5: and2_gate port map (w5, w3, A1);
  M6: and2_gate port map (w6, w4, A2_bar);
  M7: and2_gate port map (w7, w5, A2);
  M8: or2_gate port map (T0, w1, Up);
  M9: or2_gate port map (T1, w2, w3);
  M10: or2_gate port map (T2, w4, w5);
  M11: or2_gate port map (T3, w6, w7);
  M12: T_FFlop port map (A0, A0_bar, T0, CLK, Clear_b);
  M13: T_FFlop port map (A1, A1_bar, T1, CLK, Clear_b);
  M14: T_FFlop port map (A2, A2_bar, T2, CLK, Clear_b);
  M15: T_FFlop port map (A3, A3_bar, T3, CLK, Clear_b);
end Structural;
entity T_FFLOP is
	port (Q, Q_bar: buffer bit; T, C, Clear_b: in bit);  -- Active-low,  synchronousreset
end T_FFLOP;

architecture Behavioral of T_FFLOP is
begin
 	Q_bar <=  not Q;
	process (C) begin
	if C'event and C = '1' then
		if (Clear_b = '0') then Q <= '0'; 
		elsif (T = '1') then Q <= Q_bar; 
		end if;
	end if;
	end process;
end Behavioral;
entity and2_gate is  port (y: out bit; xin1, xin2: in bit);end and2_gate;architecture Behavioral of and2_gate isbegin	y <= xin1 and xin2;end Behavioral;
entity or2_gate is  port (y: out bit; xin1, xin2: in bit);end or2_gate;architecture Behavioral of or2_gate isbegin	y <= xin1 or xin2;end Behavioral;
entity not_gate is  port (y: out bit; xin1: in bit);end not_gate;architecture Behavioral of not_gate isbegin	y <= not xin1;end Behavioral;
