library Synopsys;
use Synopsys.attributes.all;

entity Prob 8_43_divide_clock_by_4_SV_vhdl is
		port (clk, rst_b: in Std_Logic; y: out Std_Logic);
end Prob_8_43_divide_clock_by_4_SV_vhdl;

architecture Behavioral of Prob_8_43_divide_clock_by_4_SV_vhdl is
	type State_type is (s0, s1, s2, s3);
	attribute enum_encoding of State_type: type is "0001 0010 0100 1000";

	signal state, next_state: State_type;
begin
	-- Output	
		y_out <= '1' when (state = s3) else '0';	

-- State transitions
   process (clk, rst_b) 
      if reset_b = '0' then  state <= s0; 
      elsif clock'event and clock = '1' then state <= next_state; end if;

-- Next state logic

   process ( state)
      case (state) is
         when s0 => next_state <= s1;
         when s1 => next_state <= s2;
         when s2 => next_state <= s3;
         when s3 => next_state <= s0;	-- case is complete Ð no default 
      endcase;
   end process;
end Behavioral;

