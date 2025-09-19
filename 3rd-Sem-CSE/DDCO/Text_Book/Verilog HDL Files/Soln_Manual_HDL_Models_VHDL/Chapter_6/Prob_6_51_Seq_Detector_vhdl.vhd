entity Prob_6_51_Seq_Detector_vhdl is	port (detect: out bit; bit_in, clk, reset_b: in bit);end Prob_6_51_Seq_Detector_vhdl; architecture Behavioral of Prob_6_51_Seq_Detector_vhdl is	signal sample_reg: bit_vector (2 downto 0); begin
		process (sample_reg) begin
		if sample_reg = "111" then detect <= '1'; else detect <= '0'; end if; 
	end process;
	
	process (clk, reset_b) begin		if (reset_b = '0') then sample_reg <= "000"; 
			elsif clk'event and clk = '1' then sample_reg <= bit_in & sample_reg (2 downto 1);			end if;	end process;end Behavioral;