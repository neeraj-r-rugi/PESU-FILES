library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Prob_6_59b_vhdl is
	port  (STRC: buffer Std_Logic_vector (3 downto 0); I_par: in Std_Logic_vector (3 downto 0);
	Count, Load, CLK, Clear_b: in bit);
end Prob_6_59b_vhdl;

architecture Behavioral of Prob_6_59b_vhdl is
	signal E_bar: Std_Logic;


begin
	E_bar <= not STRC(0);
	process (CLK) begin
 		if CLK'event and CLK = '1' then
			if (Clear_b = '0') then STRC <= "0000";  
    			elsif (Load = '1') then STRC <= I_par;
    			elsif (Count = '1') then STRC <= E_bar & STRC (3 downto 1);
			end if;
		end if;
	end process;
end  Behavioral;

