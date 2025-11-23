library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Prob_6_37b_vhdl is  -- Counter_case 
	port (Count: buffer Std_Logic_vector (3 downto 0); clock, reset: in Std_Logic);
end Prob_6_37b_vhdl;

architecture Behavioral_Case of Prob_6_37b_vhdl is
begin
  process (clock, reset) begin
    if (reset = '1') then Count <= "0000";
    elsif clock'event and clock = '1' then begin
      Count <= "0000";	-- default
      case (Count) is
        when 0 =>		Count <= "0001";	-- 1
        when 1 =>		Count <= "0011";	-- 2
        when 3 =>		Count <= "0111";	-- 3
        when 4 =>		Count <= "0000";	-- 0
        when 6 =>		Count <= "0100";	-- 4
        when 7 =>		Count <= "0110";	-- 6
        when others =>	Count <= "0000";	-- 0
      endcase
  end if;
end process;
end Behavioral_Case;

