entity Prob_6_32b_vhdl is
	port  (A3, A2, A1, A0: buffer bit; I3, I2, I1, I0, Load, Clock, Clear: in bit);
end Prob_6_32b_vhdl;

architecture Structural of Prob_6_32b_vhdl is
	signal y3, y2, y1, y0: bit;
	component mux_2 port (y: out bit; a, b, sel: in bit); end component;
	component D_FF port (Q: out bit; D, clk, clear: in bit); end component;
begin
  
  M3: mux_2 port map (y3, A3, I3, Load);
  M2: mux_2 port map (y2, A2, I2, Load);
  M1: mux_2 port map (y1, A1, I1, Load);
  M0: mux_2 port map (y0, A0, I0, Load);

  M3DFF: D_FF port map (A3, y3, Clock, Clear);
  M2DFF: D_FF port map (A2, y2, Clock, Clear);
  M1DFF: D_FF port map (A1, y1, Clock, Clear);
  M0DFF: D_FF port map (A0, y0, Clock, Clear);
end  Structural;

entity D_FF is
	port (Q: out bit; D, clk, clear: in bit);
end D_FF;

architecture Behavioral of D_FF is
begin
  process (clk, clear) begin
    if (clear = '1') then Q <= '0'; 
	elsif clk'event and clk = '1' then Q <= D;
    end if;
  end process;
end Behavioral;

entity mux_2 is
	port (y: out bit; a, b, sel: in bit );
end mux_2;
	
architecture Behavioral of mux_2 is
begin	
	y <= a when sel = '1' else b;
end Behavioral;


