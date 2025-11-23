library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Prob_8_9_Datapath_vhdl is
   port (A2, A3: out Std_Logic; set_E, clr_E, set_F, clr_A_F, incr_A, clock, reset_b: in Std_Logic);
end Prob_8_9_Datapath_vhdl;

architecture Behavioral of Prob_8_9_Datapapth_vhdl is
	signal E, F: out Std_Logic; 
	signal A: out Std_Logic_Vector (3 downto 0);
begin
	A2 <= A(2);
	A3 <= A(3);
process (clock, reset_b) begin
    if reset_b = '0' then E <= '0', F <= '0', A <= "0000";
   else
      if set_E = '1' then E <= '1'; end if;
      if clr_E = '1' then E <= '0'; end if;
      if set_F = '1' then F <= '1'; end if;
      if clr_a_F = '1' then A = "0000"; F <= '0'; end if;
      if incr_A = '1' then A <= A + "0001"; end if;
   end if;
end process;
end Behavioral;

