entity Prob_6_35a_vhdl is
	port  (A: out bit_vector (3 downto 0); I: in bit_vector (3 downto 0); Load,  
		Clock, Clear: in bit);
end Prob_6_35a_vhdl;

architecture Structural of Prob_6_35a_vhdl is
	component Register_Cell port (A: buffer bit; I: in bit; Load, Clock, Clear: in bit); 
	end component;
begin
R0:	Register_Cell port map (A(0), I(0), Load, Clock, Clear);
R1:	Register_Cell port map (A(1), I(1), Load, Clock, Clear); 
R2:  	Register_Cell port map (A(2), I(2), Load, Clock, Clear);
R3:  	Register_Cell port map (A(3), I(3), Load, Clock, Clear);
end Structural; 

entity Register_Cell is
	port (A: buffer bit; I, Load, Clock, Clear :in bit);
end Register_Cell;

architecture Structural of Register_Cell is
	signal Load_b, Clear_b, w1, w2, w3: bit;
	component D_FF port (A:buffer bit; D, Clock: in bit); end component;
begin
	Load_b <= not Load;
  	w1 <= not Load_b;
  	Clear_b <=  not Clear;
  	w2 <= I and w1;
 	w3 <= A and Load_b and Clear_b;
	D <= w2 or w3;
	M0:	D_FF port map (A, D, Clock);
end Structural;

entity D_FF is 
	port (Q: out bit; D, clk: in bit);
end D_FF;
	
architecture Behavioral of D_FF is
begin
	process (clk) begin
		if clk'event and clk = '1' then Q <= D; end if;
	end process;
end Behavioral;

