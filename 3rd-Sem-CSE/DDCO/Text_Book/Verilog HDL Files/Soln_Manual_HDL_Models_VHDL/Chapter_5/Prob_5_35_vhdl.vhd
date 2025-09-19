library IEEE;
use IEEE.std_logic_1164.all;

entity Prob_5_35_vhdl is
	port (out_z: out Bit; in_x, in_y: in Boolean; clk, reset_b: in Bit); --Std_Logic);
end Prob_5_35_vhdl;

architecture Behavioral of Prob_5_35_vhdl is
	signal state, next_state: Std_Logic_Vector (1 downto 0);
begin
	process (state) begin
		out_z <= '0';
		if (state = "10" or state = "11") then out_z <= '1';
		end if;
	end process;
	
   process (clk, reset_b) begin
	 if (reset_b = '0') then state <= "00"; 
		elsif (clk'event and clk = '1') then state <= next_state; end if;
   end process;

  process (state, in_x, in_y) begin
	next_state <= "00";
	
	case (state) is
	when "00"=>	if ((not in_x and not in_y) or (not in_x and in_y)) then next_state <= '0' & '0'; 
			elsif ((not in_x and not in_y) or (in_x and not in_y))  then next_state <= ('0' & '0');
			elsif (in_x and not in_y) then next_state <= "11";
			elsif (in_x and in_y)  then next_state <= "01";
			end if;
			
	when "01" => if ((not in_x and not in_y) or (not in_x and in_y)) then next_state <= "00";
			elsif ((in_x and not in_y) or (in_x and in_y)) then next_state <= "10";
			end if;

	when "10" => if ((not in_x and not in_y) or (not in_x and in_y)) then next_state <= "00";
			elsif ((in_x and not in_y) or (in_x and in_y)) then next_state <= "11";
			end if;

	when "11"=>	if ((not in_x and not in_y) or (not in_x and in_y)) then next_state <= "00";
			elsif ((in_x and not in_y) or (in_x and in_y)) then next_state <= "11";
			end if;
								
	when others	=> next_state <= "00";	  
	end case;
end process;
end Behavioral;


