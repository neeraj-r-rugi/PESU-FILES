entity Prob_6_40_vhdl is
	port  (timer: buffer bit_vector (0 to 7); clk, reset_b: in bit);
end Prob_6_40_vhdl;

architecture Behavioral of Prob_6_40_vhdl is
begin
  process  (clk, reset_b) begin
    if (reset_b  = '0') then timer <= "10000000"; 
    elsif (clk'event and clk = '1') then
	 case (timer) is		
	when "10000000" =>	timer <= "01000000";
 	when  "01000000" =>	timer <= "00100000";
      when "00100000" =>		timer <= "00010000";
      when "00010000" =>		timer <= "00001000";
      when "00001000" =>		timer <= "00000100";
      when "00000100" =>		timer <= "00000010";
     when  "00000010" =>		timer <= "00000001";
     when  "00000001" =>		timer <= "10000000";
     when   others =>	timer <= "10000000";
    end case;
   end if;
  end process;
end  Behavioral;

