		
entity Prob_6_55_vhdl is
	port (Q8, Q4, Q2, Q1: buffer Bit; Count, Clear_b: in Bit);
end Prob_6_55_vhdl;

architecture Behavioral of Prob_6_55_vhdl is
  	signal Pwr: Bit := '1';
  	signal Q8_bar: bit;
	signal J_in_M8: bit;
 	component  not_gate port (y: out Bit; xin: in Bit); end component;
  	component and2_gate port (y: out Bit; xin1, xin2: in Bit); end component;
  	component JK_FlipFlop port (Q: buffer Bit; J_in, K_in, C, Clear_b: in Bit); end component;
begin
	Pwr <= '1';
	G1: not_gate port map (Q8_bar, Q8);
  	G2: and2_gate port map (J_in_M8, Q2, Q4);
  	M1: JK_FlipFlop port map (Q1, Pwr, Pwr, Count, Clear_b);
 	M2: JK_FlipFlop port map (Q2, Q8_bar, Pwr, Q1, Clear_b);
 	M4: JK_FlipFlop port map (Q4, Pwr, Pwr, Q2, Clear_b);
 	M8: JK_FlipFlop port map (Q8, J_in_M8, Pwr, Q1, Clear_b);
end Behavioral;

entity and2_gate is
  port (y: out bit; xin1, xin2: in bit);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;

entity not_gate is
  port (y: out bit; xin: in bit);
end not_gate;

architecture Behavioral of not_gate is
begin
	y <= not xin;
end Behavioral;

entity JK_FlipFlop is
	port (Q: buffer Bit; J_in, K_in: in Bit; C: in Bit; Clear_b: in Bit);
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is
begin
  process (C) begin
      if C'event and C = '0' then
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

entity Prob_6_55_vhdl_tb is  -- Append tb for compatibity with compiler
	-- port ();
end Prob_6_55_vhdl_tb;

architecture Behavioral of Prob_6_55_vhdl_tb is
  signal t_Q8, t_Q4, t_Q2, t_Q1: bit;
  signal t_Count , t_Clear_b: bit;
  signal t_value: bit_vector (3 downto 0);		-- Display counter
component  Prob_6_55_vhdl port (Q8, Q4, Q2, Q1: out bit; Count, Clear_b: in bit); end component;

begin
 	t_value <= t_Q8 & t_Q4 & t_Q2 & t_Q1;	 
 	M0: Prob_6_55_vhdl port map (t_Q8, t_Q4, t_Q2, t_Q1, t_Count, t_Clear_b);

	process 	 
	begin
		t_count <= '0'; 
	wait for 5 ns;
	t_count <= '1';
	wait for 5 ns;
		end process; 
		t_Clear_b <= '0';
		t_Clear_b <= '1' after 20 ns;


end Behavioral;

