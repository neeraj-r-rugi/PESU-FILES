entity Prob_6_41_vhdl is
	port (Count: buffer bit_vector (0 to 3); CLK, reset_b: in bit);
end Prob_6_41_vhdl;

architecture Structural of Prob_6_41_vhdl is
  signal Q_0b, Q_1b, Q_2b, Q_3b: bit;
  component D_FF port (Q, Q_b: buffer bit; D, clk, reset_b: in bit); end component;
begin
  M3: D_FF port map (Count (3), Q_3b, Count (2), CLK, reset_b);
  M2: D_FF port map (Count (2), Q_2b, Count (1), CLK, reset_b);
  M1: D_FF port map (Count (1), Q_1b, Count (0), CLK, reset_b);
  M0: D_FF port map (Count (0), Q_0b, Q_3b, CLK, reset_b);
end Structural;

entity D_FF is
	port (Q: buffer bit; Q_b: out bit; D, clk, reset_b: in bit);
end D_FF;

architecture Behavioral of D_FF  is                                                                                                                                                                                                                                             
begin
	 Q_b <= not Q;
  	process  (clk, reset_b) begin
		if (reset_b = '0') then Q <= '0'; 
		else if clk'event and clk = '1' then Q <= D;
			end if;
		end if;
	end process;
end Behavioral;

