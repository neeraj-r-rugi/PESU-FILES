entity Prob_6_31_vhdl is
		port(A3, A2, A1, A0: out bit; I3, I2, I1, I0, Clock, Clear_b: in bit); 
end Prob_6_31_vhdl;

--architecture Behavioral of Prob_6_31_vhdl is
	--signal A_word: bit_vector (3 downto 0);
--begin
	--A3 <= A_word(3);
	--A2 <= A_word(2);
	--A1 <= A_word(1);
	--A0 <= A_word(0);		
	
	--process (Clock, Clear_b)
	--begin
		--if (Clear_b = '0') then A_word <= "0000";
		--elsif  (Clock'event and Clock = '1') then A_word <= (I3 & I2 & I1 & I0); end if;
	--end process;
--end Behavioral;

architecture Structural of Prob_6_31_vhdl is
	component D_FF port (Q: out bit; D: in bit; clk, clear_b: in bit); end component;
  --always @ (posedge Clock, negedge Clear)
   -- if (Clear == 0) {A3, A2, A1, A0} <= 4'b0;
   -- 	 {A3, A2, A1, A0} <= {I3, I2, I1, I0};
--endmodule

begin
	M3: D_FF port map (Q => A3, D => I3, clk => Clock, clear_b => Clear_b);
	M2: D_FF port map (Q => A2, D => I2, clk => Clock, clear_b => Clear_b);
	M1: D_FF port map (Q => A1, D => I1, clk => Clock, clear_b => Clear_b);
	M0: D_FF port map (Q => A0, D => I0, clk => Clock, clear_b => Clear_b);
 
end Structural;

entity D_FF is
	port (Q: out bit; D, clk, clear_b: in bit);
end D_FF;

architecture Behavioral of D_FF is
begin
	process (clk, clear_b) begin
		if (clear_b = '0') then Q <= '0';
		elsif clk'event and clk = '1' then Q <= D;
		end if;
	end process;		
end Behavioral;
