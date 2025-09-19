library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Prob_6_37a_vhdl is	 
   port (Count: buffer std_logic_vector (3 downto 0); clock, reset: in std_logic);
end Prob_6_37a_vhdl;

architecture Behavioral of Prob_6_37a_vhdl  is
begin 
process (clock, reset) begin
   if reset = '1' then Count <= "0000";
   elsif clock'event and clock = '1' then    
   if Count = "0000"		then Count <= "0001";
   elsif Count = "0001" 	then Count <= "0011";	 
   elsif Count = "0011" 	then Count <= "0111";
   elsif Count = "0100" 	then Count <= "0000";
   elsif Count = "0110" 	then Count <= "0100";
   elsif Count = "0111" 	then Count <= "0110";
   else Count <= "0000";
    end if;
end if;
end process;
end Behavioral;

