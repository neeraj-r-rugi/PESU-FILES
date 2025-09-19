-- VHDL test bench for exhaustive simulation
Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Unsigned.all;

entity t_Prob_8_27_Sequential_Binary_Multiplier_vhdl is
		generic ( dp_width: integer := 5);			-- Width of datapath
end t_Prob_8_27_Sequential_Binary_Multiplier_vhdl;

architecture Behavioral of t_Prob_8_27_Sequential_Binary_Multiplier_vhdl is
		signal t_Product: Std_Logic_vector (2*dp_width downto 0);
		signal t_Ready: Std_Logic;	
		signal t_Multiplicand, t_Multiplier: Std_Logic_vector (dp_width - 1 downto 0);
		signal t_Start, t_clock, t_reset_b: Std_Logic;
		signal  Error: Std_Logic;
		signal  Exp_Value: Std_Logic_vector (2*dp_width-1 downto 0);
		
 	component Prob_8_27_Sequential_Binary_Multiplier_vhdl port (Product: out Std_Logic_vector 
			(2*dp_width downto 0); Ready: out Std_Logic; 
			Multiplicand, Multiplier: in Std_Logic_vector (dp_width- 1 downto 0); Start, clock, reset_b: in Std_Logic);
	end component;
begin
	UUT: Prob_8_27_Sequential_Binary_Multiplier_vhdl port map (t_Product, t_Ready, t_Multiplicand, 
			t_Multiplier, t_Start, t_clock, t_reset_b);

process begin			-- clock for testbench
	t_clock <= '0'; 
	wait for 5 ns;
	t_clock <= '1';
	wait for 5 ns;
end process;
process  begin
		t_reset_b <= '1';
		wait for 2 ns;
		t_reset_b <= '0'; -- after 2 ns;
		wait for 3 ns;
		t_reset_b <= '1'; -- after 3 ns;
		wait for 5 ns;
		t_Start <= '1'; -- after 5 ns; 
end process;  
-- Generate data values


-- Error Checker - Check whether result matches expected result of multiplication
-- Assertion of Ready indicates that computation of product is complete

  process (t_Ready) begin
  	if t_Ready'event and t_Ready = '1' then
			Exp_Value <= t_Multiplier * t_Multiplicand;			-- Normal operation
    		-- Exp_value <= t_Multiplier * t_Multiplicand + 1;	     -- Inject error to confirm detection
			Error <= '0';		
    		for k in 0 to 2*dp_width-1 loop 
				if Exp_Value(k) /= t_Product(k) then Error <= '1'; end if;
			end loop;
	end if;
  	end process;
end Behavioral;
