Library IEEE;
use IEEE.Std_Logic_1164.all;

entity Prob_8_39_vhdl is
   port (PR: out Std_Logic_vector (16 downto 0); done: out Std_Logic; data_AR, data_BR:  
            in Std_Logic_Vector (7 downto 0); start, clock, reset_b: in Std_Logic);
end Prob_8_39_vhdl;
 
architecture ASMD of Prob_8_39_vhdl is
-- Interface signals
	signal Ld_regs, Add_decr, zero: Std_Logic;
	
-- Components
	component Controller_P8_39 port(done, Ld_regs, Add_decr: out Std_Logic;
				Start, zero, clock, reset_b: in Std_Logic);
				end component;
	component Datapath_P8_39 port(PR: out Std_Logic_Vector (16 downto 0); 
				zero: out Std_Logic; 
				data_AR, data_BR: in Std_Logic_Vector (7 downto 0); 
				Ld_regs, Add_decr, clock, reset_b: in Std_Logic);
	end component;
begin
-- Instantiations of Components
	M0: Controller_P8_39 port map (done, Ld_regs, Add_decr, start, zero, clock, reset_b);

	M1: Datapath_P8_39 port map (PR, zero, data_AR, data_BR, Ld_regs, Add_decr, clock, reset_b);
end ASMD;

Library IEEE;
use IEEE.Std_Logic_1164.all;
entity Controller_P8_39 is
	port (done: out Std_Logic; Ld_regs, Add_decr: out Std_Logic; start, zero, clock, reset_b: in Std_Logic);
end Controller_P8_39;

architecture Behavioral of Controller_P8_39 is
    constant	s0: Std_Logic	:= '0';
	 constant 	s1: Std_Logic	:= '1';
    signal 		state, next_state: Std_Logic;
begin
     done <= '1' when state = s0 else '0';

	process (clock, reset_b) begin 
		if reset_b = '0' then state <= s0; 
		elsif clock'event and clock = '1' then state <= next_state; end if;
	end process;

  process (state, start, zero) begin
    Ld_regs <= '0';
    Add_decr <= '0';
	 next_state <= s0;
    case state is
      when s0 =>	if (start = '1') then Ld_regs <= '1'; next_state <= s1; else next_state <= s0; end if;
      when s1 =>	if (zero = '1') then next_state <= s0; else next_state <= s1; Add_decr <= '1';	end if; 
      when others =>	next_state <= s0;
    end case;
  end process;
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Unsigned.all;

entity  Datapath_P8_39 is
port (PR: buffer Std_Logic_vector (16 downto 0); zero: out Std_Logic; data_AR, data_BR: in Std_Logic_Vector (7 downto 0); Ld_regs, Add_decr, clock, reset_b: in Std_Logic);
end Datapath_P8_39;

architecture Behavioral of Datapath_P8_39 is
	signal Ar, BR: Std_Logic_vector (7 downto 0);
begin
	-- zero <= not( AR(7) or AR(6) or AR(5) or AR(4) or AR(3) or AR(2) or AR(1) or AR(0));
	process (AR)begin
		zero <= '1';
		for k in 0 to 7 loop
			if AR(k) = '1' then Zero <= '0'; end if; 
		end loop;
	end process;
			
	process (clock, reset_b) begin
		if reset_b = '0' then AR <= "00000000"; BR <= "00000000"; PR <= "00000000000000000"; 
		elsif clock'event and clock = '1' then  
			if Ld_regs = '1' then AR <= data_AR; BR <= data_BR; for k in 0 to 16 loop PR(k) <= '0'; end loop;
			elsif Add_decr = '1' then PR <= PR + ('0' & BR); AR <= AR -1; end if;
		end if;
	end process;
end Behavioral;

-- Test plan (Operational features to verify)
 -- Power-up reset
 -- Data is loaded correctly
 -- Control signals assert correctly
 -- Status signals assert correctly
 -- start is ignored while multiplying
 -- Multiplication is correct
 -- Recovery from reset on-the-fly
 
Library IEEE;
use IEEE.Std_Logic_1164.all;

entity t_Prob_P8_39 is
end t_Prob_P8_39;

architecture Test_Bench of t_Prob_P8_39 is
signal 	t_done: Std_Logic;
signal 	t_PR: Std_Logic_Vector (15 downto 0);
signal	t_data_AR, t_data_BR: Std_Logic_Vector (7 downto 0);
signal  t_start, t_clock, t_reset_b: Std_Logic;
component Prob_8_39 port (PR: out Std_Logic_Vector (15 downto 0); done: out Std_Logic; data_AR, data_BR: in Std_Logic_Vector (7 downto 0); start, clock, reset_b: in Std_Logic);
end component;
begin

M_UUT: Prob_8_39 port map (PR => t_PR, done => t_done, data_AR => t_data_AR, data_BR => t_data_BR, start => t_start, clock => t_clock, reset_b => t_reset_b);

process  begin
t_clock <= '0'; 
wait for 5ns;
t_clock <= '1';
wait for 5ns;
end process;

    t_reset_b <= '0'; 
    t_reset_b <= '1' after 12 ns; 
    t_reset_b <= '0' after 40 ns;
    t_reset_b <= '1' after 42 ns;
    t_reset_b <= '1' after 90 ns;
    t_reset_b <= '1' after 92 ns;

    t_start <= '1' after 20 ns;
    t_start <= '0' after 30 ns;
    t_start <= '1' after 40 ns;
    t_start <= '0' after 50 ns;
    t_start <= '1' after 120 ns;
    t_start <= '0' after 120 ns;

    t_data_AR <= "00000101";		-- AR > 0
    t_data_BR <= "00010100";		--8'd20;

    t_data_AR <= "00000011" after 80 ns;
    t_data_BR <= "00001001" after 80 ns;

    t_data_AR <= "00000100" after 100 ns;
    t_data_BR <= "00001001" after 100 ns;
end Test_Bench;

