entity Prob_6_35d_vhdl is
	port (A: buffer bit_vector (3 downto 0); I: in bit_vector (3 downto 0); Shift, Load, Clock, Clear: in bit);
end Prob_6_35d_vhdl;

architecture Behavioral of Prob_6_35d_vhdl is
begin
  process  (Clock) begin
	if Clock'event and Clock = '1' then 
	if Shift = '1' then A <= A(0) & A(3 downto 1);
    	elsif (Load = '1') then A <= I;
    	elsif (Clear = '1') then A <= "0000";
	end if; end if;
	end process;
end Behavioral;

