entity Prob_5_50_vhdl is
	port  (y_out: out bit; x_in, clk, reset_b: in bit);
	end Prob_5_50_vhdl;


architecture Behavioral of Prob_5_50_vhdl is
	constant s_a: bit_vector  := "00";
	constant s_b: bit_vector  := "01";
	constant s_b: bit_vector  := "10";
	signal Set_flag: bit;
	signal Clr_flag: bit;
	signal state, next_state: bit_vector (1 downto 0);
begin
	y_out <= '1' when state = s_b or state = s_c;

	process (clk) begin
    		if (reset_b = '0') then state <= s_a;
    		else state <= next_state; end if;
   	end process;

	process (state, x_in, flag) begin
		next_state <= s_a;
		Set_flag <= 0;
		Clr_flag <= 0;
		case (state) is
      		when s_a =>	if x_in = '1' and flag = '0'
				then next_state <= s_a;  Set_flag <= '1'; 			 
							elsif x_in = '1' and flag = '1' 
				then next_state <= s_b; Set_flag <= 0; 
				elsif x_in = '0' then next_state <= s_a; 
				end if;

      		when s_b =>	if x_in = '0' then next_state <= s_b; 
							else next_state <= s_c; Clr_flag <= '1'; 
							end if;

      		when s_c =>	if x_in = '0' then next_state <= s_c; 
							else Clr_flag <= '1'; next_state <= s_a; end if;
		end case;
  	end process;

  process (clk) begin
    if reset_b = '0'  then flag <= '0';
    elsif Set_flag = '1' then flag <= '1';
    elsif Clr_flag='1' then  flag <= '0';
    end if;
  end process;
end Behavioral;

