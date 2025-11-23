entity Prob_5_57_vhdl is	port (y_out: buffer bit_vector (2 downto 0); Run, clk, reset_b: in bit);end Prob_5_57_vhdl;architecture Behavioral of Prob_5_57_vhdl is	signal next_y_out: bit_vector (2 downto 0);
begin	
process (clk) 
	begin
		if  clk'event and clk = '1' and reset_b = '0' then y_out <= "000"; 	-- priority: synchronous reset
		elsif clk'event and clk = '1' and Run = '1' then y_out <= next_y_out; 
		end if; 
	end process;
process (y_out) 
	begin
		if  clk'event and clk = '1' and Run = '1' then
	 
		next_y_out <= "000";	-- assign by exception
		case (y_out) is    
			when "000" =>	next_y_out <= "010";		-- 2
			when "001" =>	next_y_out <= "000";
			when "010" =>	next_y_out <= "100";		-- 4
			when "011" =>	next_y_out <= "000";
			when "100" =>	next_y_out <= "110";		-- 6
			when "101" =>	next_y_out <= "000";
			when "110" => 	next_y_out <= "000";
			when "111" =>	next_y_out <= "000";	-- Can be omitted – covered by default
			when others => next_y_out <= "000";
		end case;
		end if;
	end process;	
	
	end Behavioral;