-- Test bench for datapath
library IEEE;
use IEEE.Std_Logic_1164.all;



entity t_Prob_8_41b_Datapath_unit_vhdl is
end t_Prob_8_41b_Datapath_unit_vhdl;

architecture Behavioral of t_Prob_8_41b_Datapath_unit_vhdl is
	signal R0: Std_Logic_vector (15 downto 0);
	signal Data: Std_Logic_vector (7 downto 0);
	signal Clr_P1_P0, Ld_P1_P0, Ld_R0, clock, rst: Std_Logic;
	signal t_clk: integer;	
	
	component Prob_8_41b_Datapath_unit_vhdl 
		port (	R0: out Std_Logic_vector (15 downto 0); 
					Data: in Std_Logic_vector (7 downto 0); 
					Clr_P1_P0, Ld_P1_P0, Ld_R0, clock, rst: in Std_Logic
				);
	end component;

begin
	UUT: Prob_8_41b_Datapath_unit_vhdl port map (R0, Data, Clr_P1_P0, Ld_P1_P0, Ld_R0, clock, rst);
	
process-- clock for testbench

 begin		
		t_clk <= 0; 
		wait for 5 ns;
		t_clk <= 1;
		wait for 5 ns;
end process;
	
-- process begin
	rst <= '0';
	rst <= '1' after 2 ns;
	Clr_P1_P0 <= '0' after 20 ns;
	Ld_P1_P0 <= '0' after 20 ns;
	Ld_R0 <= '0' after 20 ns;
	Data <= "0000101" after 20 ns;
	Ld_P1_P0 <= '1' after 40 ns;
	Data <= "11111111" after 50 ns;
	Ld_P1_P0 <= '0' after 60 ns;
	Ld_R0 <= '1' after 70 ns;   
	Ld_R0 <= '0' after 80 ns;
--	end process;
end Behavioral;
