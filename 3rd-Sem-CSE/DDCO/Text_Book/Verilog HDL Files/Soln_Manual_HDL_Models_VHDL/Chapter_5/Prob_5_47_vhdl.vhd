entity Prob_5_47_vhdl is
	port  (y_out: buffer bit_vector (3 downto 0); Run, clk, reset_b: in bit);
end Prob_5_47_vhdl;

architecture Behavioral of Prob_5_47_vhdl is
begin 
  process (clk) begin
 	if reset_b = '0' 	then y_out <= "0000";
	elsif clk'event and clk = '1' and Run = '1' then	
		case (y_out) is
			when "0000" =>	y_out <= "0010";	--2
			when "0010" =>	y_out <= "0100";	--4 		
			when "0100" =>	y_out <= "0110";	--6
			when "0110" =>	y_out <= "0100";	--8
			when "0100" =>	y_out <= "1010";	--10
			when "1010" =>	y_out <= "1100";	--12
			when "1100" =>	y_out <= "1110";	--14
			when "1110" =>	y_out <= "0000";	--0
			when others =>	y_out <= "0000";								
		end case;
		end if;		
	end process;
end Behavioral;

-- Verify that counting is prevented while reset_b is asserted, independently of Run
-- Verify that counting is initiated by Run if reset_b is de-asserted
-- Verify reset on-the-fly
-- Verify that deasserting Run suspends counting
-- Verify wrap-around of counter.

entity t_Prob_5_47_vhdl is
	--port ();
end t_Prob_5_47_vhdl;

architecture Behavioral of t_Prob_5_47_vhdl is
 	signal t_Run, t_clk, t_reset_b: bit;
 	signal t_y_out: bit_vector(3 downto 0);
	component  Prob_5_47_vhdl port (y_out: out bit; Run, clk, reset_b: in bit); 
	end component;
begin
	process begin 	--� clock for testbench 
		t_clk <= '0'; 
		wait for 5 ns;
		t_clk <= '1';
		wait for 5 ns;
	end process;

	G0: Prob_5_47_vhdl 
			port map (y_out => t_y_out, Run => t_Run, clk => t_clk, reset_b => t_reset_b); 
	
   t_reset_b <= '0';					-- concurrent signal assignments
   t_reset_b <= '1' after 30 ns;
	
   t_Run <= '1' after 30 ns;			-- Attempt to run is overridden by reset_b
	t_Run <= '0' after 30 ns;
	t_Run <= '1' after 50 ns;			-- Initiate counting
	t_Run <= '0' after 70 ns;			-- Pause
	t_reset_b <= '0' after 90 ns;		-- reset on-the-fly
	t_reset_b <= '1' after 120 ns;  	-- De-assert reset_b
	t_Run <= '1' after 150 ns;			-- Resume counting
	t_Run <= '0' after 180 ns;			-- Pause counting
	t_Run <= '1' after 200 ns;			-- Resume counting
 
end Behavioral;