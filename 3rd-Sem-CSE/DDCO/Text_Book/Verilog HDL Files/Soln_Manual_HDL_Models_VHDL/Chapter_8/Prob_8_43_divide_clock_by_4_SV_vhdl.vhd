library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;entity Prob_8_43_divide_clock_by_4_SV_vhdl is		port (clk, rst_b: in Std_Logic; y: out Std_Logic);end Prob_8_43_divide_clock_by_4_SV_vhdl;
architecture Behavioral of Prob_8_43_divide_clock_by_4_SV_vhdl is
	subtype State_type is Std_Logic_vector (3 downto 0);
	constant s0: State_type := "0001";
	constant s1: State_type := "0010";
	constant s2: State_type	:= "0100"; 	
	constant s3: State_type := "1000";	signal state, next_state: State_type;begin	

		-- Output
		y <= '1' when (state = s3) else '0';	

-- State transitions
   process (clk, rst_b) begin 
      if rst_b = '0' then  state <= s0; 
      elsif clk'event and clk = '1' then state <= next_state; end if;
	end process;
	
-- Next state logic

	process (state) begin
		next_state <= s0;
      case (state) is
         when s0 => next_state <= s1;
         when s1 => next_state <= s2;
         when s2 => next_state <= s3;
         when s3 => next_state <= s0;	-- case is incomplete
			when others => next_state <= s0;
      end case;
   end process;end Behavioral;

