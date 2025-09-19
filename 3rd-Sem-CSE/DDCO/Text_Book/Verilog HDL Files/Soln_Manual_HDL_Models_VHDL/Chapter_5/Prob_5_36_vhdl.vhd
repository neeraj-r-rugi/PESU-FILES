entity Prob_5_36_vhdl is
	port (A, B: out bit; Clock, reset_b: in bit);
end Prob_5_36_vhdl;architecture Structural of Prob_5_36_vhdl is 	component or2_gate port (y: out, bit; xin1, xin2: in bit); end component; 	component T_flop port (Q, Q_b: out bit; T, Clock, reset_b: in bit); end component;begin 	G1: or2_gate port map (y => T_A, xin1 => A, xin2 => B);	G2: or2_gate port map (y => T_B, xin1 => A_b, xin2 => B);	G3: T_flop port map (Q => A, Q_b => A_b, T => T_A, Clock => Clock, reset_b => reset_b);	G4: T_flop port map (Q => B, Q_b => B_b, T => T_B, Clock => Clock, reset_b => reset_b);end Structural;entity and2_gate is
  port (y: out Std_Logic; xin1, xin2: in Std_Logic);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;
entity T_flop is	port (Q, QB: out bit; T, Clock, reset_b: in bit);end T_flop;
architecture Behavioral of T_flop is
begin 	QB <= not Q;  process  (Clock, reset_b) is	begin     		if (reset_b = '0') then Q <= '0';    		elsif (T) then Q <= not Q;
			end if;	end process;end Behavioral;