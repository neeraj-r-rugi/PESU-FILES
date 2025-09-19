entity Prob_6_32a_vhdl is		port (A3, A2, A1, A0: out bit; I3, I2, I1, I0, Load, Clock, Clear: in bit);
end Prob_6_32a_vhdl;
architecture Behavioral of Prob_6_32a_vhdl is		signal A_word: bit_vector (3 downto 0);begin	A3 <= A_word(3);	A2 <= A_word(2);	A1 <= A_word(1);	A0 <= A_word(0);	process (Clock, Clear) begin 	if (Clear = '0')  then A_word <= "0000"; 		elsif (Load = '1') then A_word <= I3 & I2 & I1 & I0;
		end if;
	end process;end Behavioral;