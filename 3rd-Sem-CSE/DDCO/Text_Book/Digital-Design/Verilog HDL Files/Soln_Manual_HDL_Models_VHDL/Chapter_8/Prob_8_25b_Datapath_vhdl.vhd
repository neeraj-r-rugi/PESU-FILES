library IEEE;use IEEE.Std_Logic_1164.all;--use IEEE.Std_Logic_arith.all;--use IEEE.Std_Logic_unsigned.all;entity Prob_8_25b_Datapath_vhdl is	generic (dp_width: integer := 5; BC_size: integer := 3); 	port	(	Product: out Std_Logic_vector (2*dp_width downto 0);				Q0, Empty_m, Empty_data: out Std_Logic; 
				Zero: Buffer Std_Logic;				Multiplicand, Multiplier: in Std_Logic_vector (dp_width - 1 downto 0);				Start, Load_regs, Clr_Q_C, Decr_P, Add_regs, Shift_regs, clock, reset_b: in Std_Logic);end Prob_8_25b_Datapath_vhdl;architecture Behavioral of Prob_8_25b_Datapath_vhdl is 	signal 	Sum: Std_Logic_vector (dp_width downto 0); 	signal	A, B, Q: Std_Logic_vector (dp_width - 1 downto 0);		-- Sized for datapath	
	signal 	C: Std_Logic;	  	signal	P: integer;														-- Bit counter	signal 	Q0: Std_Logic;
	signal 	multiplier_0, multiplicand_0: Std_Logic;				-- Flags for empty wordsbegin  	Q0 <= Q(0);		Sum <= ('0' & A) + ('0' & B);	Zero <= '1' when P = 0 else '0';						-- Counter is zero
 	Product <= C & A & Q;	
	Empty_data <= '1' when (multiplicand_0 = '1' and multiplier_0  = '1') else '0';
	
	process (multiplier) begin		-- Detect empty multiplier word
		multiplier_0 <= '1';
		for k in dp_width-1 downto 0 loop
			if multiplier(k) = '1' then multiplier_0 <= '0';
			end if;
		end loop;
	end process;
		
	process (multiplicand) begin	-- Detect empty multiplicand word
		multiplicand_0 <= '1';
		for k in dp_width-1 downto 0 loop
			if multiplicand(k) = '1' then multiplicand_0 <= '0';
			end if;
		end loop;
	end process;	
	
	process (P) begin		-- Detect whether remaining multiplier bits are all 0
		Empty_m <= '1';
		for k in dp_width to 0 loop	
			for m in P-1 to 0 loop if Q(m) = '1' then Empty_m <= '0'; end if; end loop;
		end loop;	
	end process;
	
  	process  (clock, reset_b) 
	begin 
    		if (reset_b = '0') then					-- Added to this solution, but
      		P <= 0;								-- not really necessary since Load_regs
      		C <= '0';
				for k in 0 to dp_width-1 loop 
					B(k) <= '0'; A(k) <= '0'; Q(k) <= '0';
				end loop;
				
			elsif clock'event and clock = '1' then
				if (Load_regs = '1') then
      			P <= dp_width;
					C <= '0';
      			for k in 0 to dp_width-1 loop A(k) <= '0'; end loop;
      			B <= Multiplicand;
      			Q <= Multiplier;
				end if;

				if Clr_Q_C = '1' then 
					C <= '0';
					for k in dp_width-1 downto 0 loop Q(k) <= '0'; end loop; 
				end if;

				if (Add_regs = '1') then 		
					C <= Sum(dp_width);
					A <= Sum(dp_width-1 downto 0); 
				end if;
				
    			if (Shift_regs = '1') then
					C <= '0';
				 	A <= C & A(dp_width-1 downto 1);
					Q <= A(0) & Q(dp_width-1 downto 1);
				end if;
				 
    			if (Decr_P = '1') then 
					P <= P -1;	
				end if;				
			end if;
	end process; 		end Behavioral;