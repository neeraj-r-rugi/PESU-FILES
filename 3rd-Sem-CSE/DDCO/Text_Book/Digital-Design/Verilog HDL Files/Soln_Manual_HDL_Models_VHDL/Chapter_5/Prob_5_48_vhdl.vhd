entity Prob_5_48_vhdl is
	port (y_out: out bit; x_in, clk, reset_b: in bit);
end Prob_5_48_vhdl;

architecture Behavioral of Prob_5_48_vhdl is
	constant s_a: bit_vector (1 downto 0) := "00";
	constant s_b: bit_vector (1 downto 0) := "01";
	constant s_c: bit_vector (1 downto 0) := "10";
	constant s_d: bit_vector (1 downto 0) := "11";
	signal state, next_state: bit_vector (1 downto 0);
begin
process  (clk) begin
    	if (reset_b = '0') then state <= s_a;
    	elsif clk'event and clk = '1' then  state <= next_state;
	end if;
end process;

	process (state, x_in) begin
		next_state <= s_a;
    		y_out <= '0';
    		case (state)
      		when s_a =>	if x_in = '0' then next_state <= s_b; y_out <= '1'; 
			else next_state <= s_c; y_out <= '0'; end if;

      		when s_b =>	if x_in = '0' then next_state <= s_c; y_out <= '0'; 
			else next_state <= s_d; y_out <= '1'; end if;

      		when s_c =>	if x_in = '0' then next_state <= s_b; y_out <= '0'; 
			else next_state <= s_d; y_out <= '1'; end if;

      		when s_d =>	if x_in = '0' then next_state <= s_c; y_out <= '1'; 
			else next_state <= s_a; y_out <= '0'; end if;

			when others =>	next_state <= s_a; y_out <= '0';  
    		end case;
  	end process;
end Behavioral;
