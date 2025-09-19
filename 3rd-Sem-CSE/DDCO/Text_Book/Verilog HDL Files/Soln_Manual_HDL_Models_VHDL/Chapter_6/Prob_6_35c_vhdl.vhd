entity Prob_6_35c_vhdl is
	port (A: out bit_vector (3 downto 0); I: in bit_vector (3 downto 0); 
			Shift, Load,  Clock: in bit);
end Prob_6_35c_vhdl;

architecture Structural of Prob_6_35c_vhdl is
	component Register_Cell port (A: buffer bit; I: in bit; D: in bit; 
										Shift, Load, Clock: in bit);
	end component;
begin
R0: Register_Cell port map (A[0], I[0], A[1], Shift, Load, Clock);
R1: Register_Cell port map (A[1], I[1], A[2], Shift, Load, Clock);
R2: Register_Cell port map (A[2], I[2], A[3], Shift, Load, Clock);
R3  Register_Cell port map (A[3], I[3], A[0], Shift, Load, Clock);
end Structural; 

entity Register_Cell is
	port (  A, : buffer bit; I, Serial_in, Shift, Load, Clock: in bit);
end Register_Cell;

architecture Structural of Register_Cell is
	component D_FF (Q: buffer bit; D, clk: in bit); end component;
begin
	M0:  DFF port map (A, D, Clock);
  	Shift_b <= not Shift;
  	Load_b <= not Load;
 	w1 <= Shift andvSerial_in;
 	w2  <= Shift_b and Load and I;
	w3  <= A and Shift_b and Load_b;
  	D <=  w1 or w2 or w3);
end Structural;

entity D_FF is
	port (Q: out bit;   D, clk: in bit);
end D_FF;

architecture Behavioral of D_FF is
begin
	process (clk) begin
		if clk'event and clk = '1' then Q <= D; end if;
   		end Behavioral;

