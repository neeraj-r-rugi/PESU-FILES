-- Behavioral description of a 4-bit universal shift register 
-- Fig. 6.7 and Table 6.3
	entity Prob_6_49_vhdl is --Shift_Register_4_beh_vhdl  
	port (A_par: buffer bit_vector (3 downto 0); I_par: in bit_vector (3 downto 0); 
			s1, s0, MSB_in, LSB_in, CLK, Clear: in bit);
end Prob_6_49_vhdl;

architecture Behavioral of Prob_6_49_vhdl is --Shift_Register_4_beh_vhdl
begin  
	process (CLK, Clear) begin
    if (Clear = '0') then A_par <= "0000";
    elsif CLK'event and CLK = '1' then
      case (s1 & s0) is
        when "00" => A_par <= A_par;							-- No change
        when "01" =>  A_par <= MSB_in & A_par(3 downto 1);		-- Shift right
        when "10" =>  A_par <= A_par(2 downto 0) & LSB_in;		-- Shift left
        when "11" =>  A_par <= I_par;							-- Parallel load  
      end case;
	  end if;
	end process;

end  Behavioral;

