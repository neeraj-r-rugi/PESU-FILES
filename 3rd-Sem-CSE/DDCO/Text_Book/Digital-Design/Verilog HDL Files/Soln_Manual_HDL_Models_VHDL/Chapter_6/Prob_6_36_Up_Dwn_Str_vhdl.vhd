entity Prob_6_36_Up_Dwn_Str_vhdl is
	port (A: out bit_vector (3 downto 0); CLK, Up, Down, reset_b: in bit);
end Prob_6_36_Up_Dwn_Str_vhdl;

architecture Structural of Prob_6_36_Up_Dwn_Str_vhdl is
  	signal  Down_3, Up_3, Down_2, Up_2, Down_1, Up_1: bit;
  	signal  A_0b, A_1b, A_2b, A_3b: bit;
	component stage_register port (A: out bit_vector 3 downto 0); A_b, Down_not_Up_out, Up_out: out bit; Down_not_Up, Up, A_in, A_in_b, CLK, reset_b: in bit);
	component Toggle_flop (Q, Q_b: out bit; T, CLK, reset_b: in bit);
begin
  M3: stage_register SR3 (A(3), A_3b, Down_3, Up_3, Down_2, Up_2, A(2), A_2b, CLK, reset_b);
  M2: stage_register SR2 (A(2), A_2b, Down_2, Up_2, Down_1, Up_1, A(1), A_1b, CLK, reset_b);
  M1: stage_register SR1 (A(1), A_1b, Down_1, Up_1, Down_not_Up, Up, A(0), A_0b, CLK, reset_b);
  M0: Toggle_flop TF0 (A[0], A_0b, T, CLK, reset_b);
  Up_b <= not Up;
  Down_not_Up <= Down and Up_b;
  T <= Up or Down_not_Up;
end Structural;

entity stage_register is
port (A, A_b, Down_not_Up_out, Up_out: out bit; Down_not_Up, Up, A_in, A_in_b, CLK, reset_b: in bit);
 end stage_register;

architecture Structural of stage_register is
	component Toggle_flop (Q: buffer bit; Q_b: out bit; T, CLK, reset_b: in bit);

begin
  T0: Toggle_flop T0 (A, A_b, T, CLK, reset_b);
  T <= Down_not_Up_out or Up_out;
  Down_not_Up_out <= Down_not_Up  and A_in_b);
  Up_out <= Up and A_in);
end  Structural;

entity Toggle_flop is
	port (output reg Q: buffer bit; Q_b: out bit; T, CLK, reset_b: in bit);
end Toggle_flop;

architecture Behavioral of Toggle_flop is
  process (CLK, reset_b) begin
	if (reset_b = '0') then Q <= '0'; else Q <= Q  xor T; end if;
 	Q_b <= not Q;
end Behavioral;

