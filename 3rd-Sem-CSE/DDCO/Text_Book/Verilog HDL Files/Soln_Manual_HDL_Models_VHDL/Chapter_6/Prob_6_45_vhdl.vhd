library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Prob_6_45_vhdl is
   port (y_out: out std_Logic; start, clock, reset_bar: in bit);
end Prob_6_45_vhdl;
architecture Behavioral of Prob_6_45_vhdl is

  constant		s0:	Std_Logic_vector(3 downto 0)   := "0000";
  constant		s1:	Std_Logic_vector(3 downto 0)   := "0001";
  constant		s2:	Std_Logic_vector(3 downto 0)   := "0010";  
  constant		s3:	Std_Logic_vector(3 downto 0)   := "0011";
  constant		s4:	Std_Logic_vector(3 downto 0)   := "0100";
  constant		s5:	Std_Logic_vector(3 downto 0)   := "0101";
  constant		s6:	Std_Logic_vector(3 downto 0)   := "0110";
  constant		s7:	Std_Logic_vector(3 downto 0)   := "0111";
  constant		s8:	Std_Logic_vector(3 downto 0)   := "1000";
		
  signal state, next_state: Std_Logic_Vector (3 downto 0);
begin
  process (clock, reset_bar) begin
    if reset_bar = '0' then state <= s0; elsif clock'event and clock = '1' then
       state <= next_state; end if;
   end process;

  process (state, start) begin
    next_state <= s0;
	 y_out <= '0';
    case state is
      when s0 =>	if start = '1' then next_state <= s1; else next_state <= s0; end if;
      when s1 =>	next_state <= s2; y_out <= '1'; 
      when s2 =>	next_state <= s3; y_out <= '1'; 
      when s3 =>	next_state <= s4; y_out <= '1'; 
      when s4 =>	next_state <= s5; y_out <= '1'; 
      when s5 =>	next_state <= s6; y_out <= '1'; 
      when s6 =>	next_state <= s7; y_out <= '1'; 
      when s7 =>	next_state <= s8; y_out <= '1'; 
      when s8 =>	next_state <= s0; y_out <= '1'; 
      when others    =>	next_state <= s0;
    end case;
  end process;
end Behavioral;

