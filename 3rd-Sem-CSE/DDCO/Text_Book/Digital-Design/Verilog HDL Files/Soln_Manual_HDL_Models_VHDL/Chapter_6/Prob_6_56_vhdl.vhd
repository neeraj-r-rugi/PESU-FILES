entity Prob_6_56_vhdl is
	port (A3, A2, A1, A0: buffer bit; next_stage: out bit; Count_enable, CLK, Clear_b: in bit);
end Prob_6_56_vhdl;

architecture Structural of Prob_6_56_vhdl is
	signal JK_in_M1, JK_in_M2, JK_in_M3: bit;
	component and2_gate  port (y: out bit; xin1, xin2: in bit); end component;
	component JK_FF port (Q: buffer bit; J_in, K_in, C, Clear_b: in bit); end component;
begin
G0: and2_gate port map (JK_in_M1, Count_enable, A0);
 G1: and2_gate port map (JK_in_M2, JK_in_M1, A1);
 G2: and2_gate port map (JK_in_M3, JK_in_M2, A2);
 G3: and2_gate port map (Next_stage, JK_in_M3, A3);
  M0: JK_FF port map (A0, Count_enable, Count_enable, CLK, Clear_b);
  M1: JK_FF port map (A1, JK_in_M1, JK_in_M1, CLK, Clear_b);
  M2: JK_FF port map (A2, JK_in_M2, JK_in_M2, CLK, Clear_b);
  M3: JK_FF port map (A3, JK_in_M3, JK_in_M3, CLK, Clear_b);
end Structural;

entity and2_gate is
  port (y: out bit; xin1, xin2: in bit);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;

entity JK_FF is
	port (Q: buffer bit; J_in, K_in, C, Clear_b: in bit);
end JK_FF;

architecture Behavioral of JK_FF is
begin
  process (C) begin
	if C'event and C = '1' then
	if (Clear_b = '0') then Q <= '0'; 
	else
    		case (J_in & K_in) is
      		when "00" =>		Q <= Q;
      		when "01" =>		Q <= '0';
      		when "10" =>		Q <= '1';
      		when "11" =>		Q <=  not Q;
		end case;
	end if;
end if;
end process;
end Behavioral;


entity Prob_6_56_vhdl_tb is
	-- port ();
end Prob_6_56_vhdl_tb;

architecture Behavioral of Prob_6_56_vhdl_tb is
	signal t_Q8, t_Q4, t_Q2, t_Q1: bit;
	signal t_next_stage, t_Count, t_CLK, t_Clear_b: bit;
	signal t_value: bit_vector (3 downto 0);		-- Display counter
	component Prob_6_56_vhdl port (A3, A2, A1, A0: buffer bit; next_stage: out bit; Count_enable, CLK, Clear_b: in bit); end component;
begin
 	t_value <= t_Q8 & t_Q4 & t_Q2 & t_Q1;	 
 	M0: Prob_6_56_vhdl port map (t_Q8, t_Q4, t_Q2, t_Q1, t_next_stage, t_Count, t_CLK, t_Clear_b);
	t_count <= '1' after 2 ns;
	t_count <= '0' after	7 ns; 
	t_count <= '1' after 11 ns;

	process -- ()  "clock" for testbench
	begin
		t_CLK <= '0'; 
		wait for 5 ns;
		t_CLK <= '1';
		wait for 5 ns;
	end process;
end Behavioral;