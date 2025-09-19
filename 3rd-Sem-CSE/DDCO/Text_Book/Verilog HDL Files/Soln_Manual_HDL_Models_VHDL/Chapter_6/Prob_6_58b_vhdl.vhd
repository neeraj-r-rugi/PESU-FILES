library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Prob_6_58b_vhdl is	port (A_count: buffer unsigned(3 downto 0); C_out: out Std_Logic; 
		Data_in: in unsigned (3 downto 0); Count, Load, CLK, Clear_b: in bit);end Prob_6_58b_vhdl;architecture Behavioral of Prob_6_58b_vhdl is
	signal Load_bar: bit;	begin	Load_bar <= not Load;	C_out <= '1' when A_count = 15 and Count = '1' and Load_bar = '1';	process (CLK, Clear_b) begin		if (Clear_b = '0') then A_count <= "0000";
		elsif CLK'event and CLK = '1' then			if (Load = '1') then A_count <= Data_in;			elsif (Count = '1') then A_count <= A_count + 1 ;			else A_count <= A_count; 
			end if;
		end if;
	end process;end Behavioral;