entity Prob_6_39_Counter_STR_vhdl is
	port (Count: out bit_vector (2 downto 0); Clock, reset_b: in bit);
  	
end Prob_6_39_Counter_STR_vhdl;

architecture Structural of Prob_6_39_Counter_STR_vhdl is
  constant PWR: bit := '1';
  signal Count_1_b: bit;
  component JK_FF port (Q: buffer bit; J, K, clk, reset_b: in bit); end component;
begin
  Count_1_b <= not Count (1);
  M2: JK_FF port map (Count(2), 	Count(1), 	Count(1), 	Clock, reset_b);
  M1: JK_FF port map (Count(1), 	Count(0), 	PWR, 		Clock, reset_b);
  M0: JK_FF port map (Count(0), 	Count_1_b, PWR, 	Clock, reset_b);
end Structural;

entity JK_FF is
		port (Q: buffer bit; J, K, clk, reset_b: in bit);
end JK_FF;

architecture Behavioral of JK_FF is
begin
process (clk, reset_b) begin 
	if (reset_b = '0') then Q <= 0; else
	if clk'event and clk = '1' then
    case (J & K) is
      when "00" =>	Q <= Q;
      when "01"	=>	Q <= '0';
      when "10"	=>	Q <= '1';
      when "11"	=>	Q <= not Q;
    end case;
    end if;	
  end if;
end process;
end Behavioral;

-- Testbench
--entity t_Prob_6_39_Counter_vhdl is
--end t_Prob_6_39_Counter_vhdl;

--architecture Structural of t_Prob_6_39_Counter_vhdl is
  --signal Count_BEH, Count_STR: bit_vector (2 downto 0);
  --signal Clock, reset_b: bit; 
  --signal t_clk:  integer range 0 to 5000;

  --component Prob_6_39_Counter_BEH_vhdl 
	--port (Count: out bit_vector (2 downto 0); Clock, reset_b: in bit); end component;
  --component Prob_6_39_Counter_STR_vhdl 
	--port (Count: out bit_vector (2 downto 0); Clock, reset_b: in bit); end component;
--begin
  ----M0_BEH: Prob_6_39_Counter_BEH_vhdl port map (Count_BEH, Clock, reset_b);
 -- M0_STR: Prob_6_39_Counter_STR_vhdl port map (Count_STR, Clock, reset_b);

	-- reset_b <= 0	after 1 ns;
 	 --reset_b <= 1	after 7 ns;

--process (); -- clock for testbench
--begin
	 --t_clk <= '0'; 
--wait for 5 ns;
--t_clk <= '1';
--wait for 5 ns;
--end process;
--end Behavioral;
