library IEEE;
use IEEE_Std_Logic_1164.all;
entity Prob_5_43_Binary_Counter_3_bit_vhdl is
	port (count: out Std_Logic_vector (2 downto 0); clk, reset_b: in bit);
end Prob_5_43_Binary_Counter_3_bit_vhdl;

architecture Behavioral of Prob_5_43_Binary_Counter_3_bit_vhdl is
begin
  	process (clk) begin
		if reset_b = '0' then count <= "000"; -- synchronous reset
		elsif clk'event and clk = '1' then  count <= next_count; end if;
	end process;

  	process  (count) begin
    		case (state) is
      		when "000" =>	count <= "001";
      		when "001" =>	count <= "010";
      		when "010" =>	count <= "011";
      		when "011" =>	count <= "100";
      		when "100" =>	count <= "001";
      		when "101" =>	count <= "010";
      		when "110" =>	count <= "011";
      		when "111" =>	count <= "100";
			when others => 	count <= "000";
		end case;
  	end process;
end Behavioral;

