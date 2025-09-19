Library IEEE;
use IEEE.Std_Logic_1164.all;

entity Prob_8_37b_t_Controller_2_Beh_vhdl is
end Prob_8_37b_t_controller_2_Beh_vhdl;

architecture Behavioral of Prob_8_37b_t_Controller_2_Beh_vhdl is
	signal t_Ready, t_Load_regs, t_Add_shift: Std_Logic;
	signal t_Start, t_Zero, t_clock, t_reset_b: Std_Logic;
	component Prob_8_37b_Controller_2_Beh_vhdl port (Ready: out Std_Logic; 
		Load_regs, Add_shift: out Std_Logic;
		Start, Zero, clock, reset_b: in Std_Logic);
	end component;
begin
  M0: Prob_8_37b_Controller_2_Beh_vhdl port map (t_Ready, t_Load_regs, t_Add_shift, t_Start, t_Zero, t_clock, t_reset_b);

	process begin
		t_clock <= '0';
		wait for 5 ns;
		t_clock <= '1';
		wait for 5 ns;
	end process;	
 
	t_reset_b <= '0'; 
	t_reset_b <= '1' after 2 ns;
	t_zero <= '1';
	t_Start <= '0';
   t_Start <= '1' after 20 ns;	-- Cycle from S_idle to S_1
   t_Start <= '0' after 80 ns;
   t_Zero <= '0' after 70 ns;	-- S_idle to S_1 to S_idle
   t_Zero <= '1' after 90 ns;		-- Return to S_idle
end Behavioral;

