   entity Prob_6_35g_Ripple_Counter_4bit_vhdl is   	port (A: out bit_vector (3 downto 0); Count, reset_b: in bit);   end Prob_6_35g_Ripple_Counter_4bit_vhdl;      architecture Behavioral of Prob_6_35g_Ripple_Counter_4bit_vhdl is   	signal A0, A1, A2, A3: bit;   begin   	A <= A3 & A2 & A1 & A0;   	process (Count, reset_b) 
		begin   		if reset_b = '0' then A0 <= '0';    		elsif Count'event and Count = '1' then A0 <= not A0; 
			end if;
		end process;
		   	process (Count, reset_b) 
		begin   		if reset_b = '0' then A1 <= '0';    		elsif A0'event and A0 = '0' and Count = '1'
			then A1 <= not A1;end if;	
			end process;
		   	process (Count,  reset_b) 
		begin   		if reset_b = '0' then A2 <= '0';    		elsif A1'event and A1 = '0' and Count = '1'
			then A2 <= not A2; end if;
		end process;
		   	process (Count, reset_b) 
		begin   		if reset_b = '0' then A3 <= '0';    		elsif A2'event and A2 = '0' and Count = '1' 
			then A3 <= not A3; end if;
		end process;   end Behavioral;