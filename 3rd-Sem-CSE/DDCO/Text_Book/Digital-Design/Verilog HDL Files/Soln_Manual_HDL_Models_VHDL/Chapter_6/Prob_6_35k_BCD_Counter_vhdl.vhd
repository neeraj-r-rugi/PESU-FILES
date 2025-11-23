entity Prob_6_35k_BCD_Counter_vhdl is
	port (Q1, Q2, Q4, Q8: buffer bit; Count, clk, reset_b: in bit);
end Prob_6_35k_BCD_Counter_vhdl;

architecture Behavioral of Prob_6_35k_BCD_Counter_vhdl is
	signal Clear: bit;
	signal A: bit_vector (3 downto 0);
component Ripple_Counter_4bit port (A: out bit_vector (3 downto 0); Count, Clear, reset_b: in bit); end component;
component nand2_gate port (y: out bit; xin1, xin2: in bit); end component;
begin
	Q1 <= A(0);
	Q2 <= A(1);
	Q4 <= A(2);
	Q8 <= A(3);

	G1: nand2_gate port map (Clear, Q2, Q4);
	G2: Ripple_Counter_4bit port map (A, Count, Clear, reset_b);
end Behavioral;

entity Ripple_Counter_4bit is
	port (A: buffer bit_vector (3 downto 0); Count, Clear, reset_b: in bit);
end Ripple_Counter_4bit;

architecture Behavioral of Ripple_counter_4bit is
	signal Q1, Q2, Q4, Q8: bit;
begin
	process  (Count, reset_b) begin
		if reset_b = '0' then A(0) <= '0'; 
		elsif Count 'event and Count = '0' then A(0) <=  not A(0);
		end if;
	end process;

	process ( A(0), reset_b) begin
    if (reset_b = '0') then A(1) <= '0'; 
	elsif A(0)'event and A(0) = '0' then 
	if A(3) = '1' then A(1) <= '0';
	elsif A(3) = '0' then A(1) <= not A(1);
	 end if;
	end if;
 	end process;

	process (A(1), reset_b) begin
		if (reset_b = '0') then A(2) <= '0';
		elsif A(1)'event and A(1) = '0' then A(2) <= not A(2);
		end if;
	end process;

	process (A(0), reset_b) begin
		if (reset_b = '0') then A(3) <= '0';
		elsif A(0)'event and A(0) = '0' then
		if Clear = '1' then A(3) <= '0';
		else A(3) <= not A(3);
		end if;
		end if;
	end process;
end Behavioral;

	entity nand2_gate is
		port (y: out bit; xin1, xin2: in bit);
	end nand2_gate;
	
	architecture Behavioral of nand2_gate is
	begin
		y <= not (xin1 and xin2);
	end Behavioral;

