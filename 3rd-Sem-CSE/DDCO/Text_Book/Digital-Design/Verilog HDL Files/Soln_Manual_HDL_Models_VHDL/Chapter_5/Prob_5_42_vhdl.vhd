	-- See Fig. 5.29
	
entity Prob_5_42_vhdl is		
	port (A, B: buffer bit; A_bar, B_bar: buffer bit; y: out bit; xin, clk, reset_b: in bit);
end Prob_5_42_vhdl;

architecture Structural of Prob_5_42_vhdl is
  	signal w1, w2, w3, D_A, D_B: bit;
	component and2_gate port (y: out bit; xin1, xin2: in bit); end component;
	component or2_gate port (y: out bit; xin1, xin2: in bit); end component;
	component not_gate port (y: out bit; xin: in bit); end component;
	component D_FF port (Q: out bit; data, clk, reset_b: in bit); end component;

begin
  G1:	and2_gate  	port map (y => w1, xin1 => A, xin2 => xin);
  G2:	and2_gate  	port map (y => w2, xin1 => B, xin2 => xin);
  G3:	or2_gate  		port map (y => D_A, xin1 => w1, xin2 => w2);
  G4:	and2_gate  	port map (y => w3, xin1 => B_bar, xin2 => xin);
  G5:	and2_gate  	port map (y => y, xin1 => A, xin2 => B);
  G6:	or2_gate  		port map (y => D_B, xin1 => w1, xin2 =>w3);
  G7:	not_gate 		port map (y => B_bar, xin => B);
  M0_A:	D_FF 		port map (Q => A, data => D_A, clk => clk, reset_b => reset_b);
  M0_B:	D_FF 		port map (Q => B, data => D_B, clk => clk, reset_b => reset_b);
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
	y <= not xin;
end Behavioral;

entity D_FF is
	port (Q: out bit; data, clk, reset_b: in bit);
end D_FF;

architecture Behavioral of D_FF is
	begin
		process  (clk, reset_b) begin
  			if (reset_b = '0') then Q <= '0'; 
			elsif clk'event and clk = '1' then Q <= data;
			end if;
		end process;
end Behavioral;
