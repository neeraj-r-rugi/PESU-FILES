Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Unsigned.all;

entity Prob_8_34a_Datapath_BEH_vhdl is
	generic (dp_width: integer := 8; R2_width: integer := 4);
	port (count: out Std_Logic_vector (R2_width -1 downto 0); E, Zero: out Std_Logic; 
			data: in Std_Logic_vector (dp_width -1 downto 0); 
 			Load_regs, Shift_left, Incr_R2, clock, reset_b: in Std_Logic);
end Prob_8_34a_Datapath_BEH_vhdl;

architecture Behavioral of Prob_8_34a_Datapath_BEH_vhdl is
	signal R1: Std_Logic_vector (dp_width -1 downto 0);
	signal R2: Std_Logic_vector (R2_width -1 downto 0);
begin
	count <= R2;
	process (R1) begin
		Zero <= '1';
		for k in dp_width-1 downto 0 loop
			if R1(k) /= '0' then Zero <= '0'; end if;
		end loop;
	end process;  

	process (clock) begin
		if clock'event and clock = '1' then 
			E <= R1(dp_width -1) and Shift_left; end if;
    		if (Load_regs = '1') then 
			R1 <= data; 
			for k in R2_width -1 downto 0 loop
				R2(k) <= '1';
			end loop; end if;
		if (Shift_left = '1') then 
			E <= R1(dp_width-1);
			R1 <= R1(dp_width-2 downto 0) & '0';  
		end if;
    	if (Incr_R2= '1') then R2 <= R2 + '1';
		end if;
	end process;	
end Behavioral;



