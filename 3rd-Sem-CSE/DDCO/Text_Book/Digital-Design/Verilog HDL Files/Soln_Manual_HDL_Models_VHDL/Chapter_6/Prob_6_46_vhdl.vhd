entity Prob_6_46_vhdl is
	port (timer: buffer bit_vector (0 to 3); count_enable, clock, reset_b: in bit);
end Prob_6_46_vhdl;

architecture Behavioral of Prob_6_46_vhdl is
	type State_type is (s0, s1, s2, s3, s4, s5);
	signal state, next_state: State_type;
begin
	process  (clock, reset_b) begin
		if (reset_b = '0') then state <= s0; 
		elsif clock'event and clock = '0' then state <= next_state;
		end if;
end process;

process (state, count_enable) begin
	next_state <= s0;
	case (state) is
		when s0 => 		if count_enable = '1' then next_state <= s1; 
							else next_state <= s0; end if;
		when s1 => 		if count_enable = '1' then next_state <= s2;
							else next_state <= s1; end if;
		when s2 => 		if count_enable = '1' then next_state <= s3;
							else next_state <= s2; end if;
		when s3 => 		if count_enable = '1' then next_state <= s4;
							else next_state <= s3; end if;
		when s4 => 		if count_enable = '1' then next_state <= s5;
							else next_state <= s4; end if;
		when s5 => 		if count_enable = '1' then next_state <= s0;
							else next_state <= s5; end if;
		when others =>	next_state <= s0;
	end case;
end process;
					process (state) begin
						case (state) is
							when s0 => 		 timer (0 to 3) <= "0001";
							when s1 => 		 timer (0 to 3) <= "1000";
							when s2 => 		 timer (0 to 3) <= "0100";
							when s3 => 		 timer (0 to 3) <= "0010";
							when s4 => 		 timer (0 to 3) <= "0001";
							when s5 => 		 timer (0 to 3) <= "0001";
							when others => 	 timer (0 to 3) <= "0000";
						end case;
					end process;
				end Behavioral;

