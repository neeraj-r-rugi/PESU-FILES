entity Prob_6_50a_vhdl is
	port (count: buffer bit_vector (2 downto 0); clk, reset_b: in bit);
end Prob_6_50a_vhdl;

architecture Behavioral of Prob_6_50a_vhdl is
begin
  process (clk, reset_b) begin
    if (reset_b = '0') then count <= "000";
    elsif clk'event and clk = '1' then 
		 case (count) is
      		when "000" =>	count <= "001";
      		when "001" =>	count <= "010";
      		when "010" =>	count <= "011";
      		when "011" =>	count <= "100";
      		when "100" =>	count <= "101";
      		when "101" =>	count <= "110";
      		when "110" =>	count <= "000";
				when others =>	count <= "000";
		end case;
	end if;
 end process;
end Behavioral;

