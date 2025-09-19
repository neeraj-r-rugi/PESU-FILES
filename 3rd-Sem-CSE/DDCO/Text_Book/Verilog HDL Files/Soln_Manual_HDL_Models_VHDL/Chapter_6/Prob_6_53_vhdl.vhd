entity Prob_6_53_vhdl is
	port (SR_A: buffer bit_vector (3 downto 0); Shift_control, SI, CLK, Clear_b: in bit);
end Prob_6_53_vhdl;

architecture Behavioral of Prob_6_53_vhdl is
  signal SR_B: bit_vector (3 downto 0); 
  signal  Sum, Carry: bit;
  signal SO_A, SO_B: bit;
  signal SI_A, SI_B: bit;
  signal Q: bit;
  signal clk_to_DFF: bit;
  component FA port (carry, sum: out bit; a, b, C_in: in bit); end component;
component D_FF port (Q: out bit; D, C, Clear_b: in bit);	end component;
component and2_gate   port (y: out bit; xin1, xin2: in bit);
 end component;

begin
  
 	SO_A <= SR_A(3);
	SO_B <= SR_B(3);
 	SI_A <= Sum;
	SI_B <= SI;

  process   (CLK) begin
 	if CLK'event and CLK = '1' then
		if (Clear_b = '0') then SR_A <= "0000"; 
		elsif (Shift_control = '1') then SR_A <= Sum & SR_A(3 downto 1);
		end if;
	end if;
  end process;

  process (CLK) begin
    if CLK'event and CLK = '1' then
	if (Clear_b = '0') then SR_B <= "0000"; 
	else if (Shift_control = '1') then SR_B <= SI & SR_B(3 downto 1);
	end if;
   end if;
	end if;
	
 end process;

  M0: FA  port map (Carry, Sum, SO_A, SO_B, Q);
  M1: and2_gate port map (clk_to_DFF, CLK, Shift_control);		-- Caution: gated clock
  M2: D_FF port map (Q, Carry, clk_to_DFF, Clear_b);
end Behavioral;

entity FA is
	port (carry, sum: out bit; a, b, C_in: in bit);
end FA;

architecture Behavioral of FA is
begin
	process (a, b, C_in) begin
  			sum <= a xor b xor C_in;
			carry <= ((a xor b) and C_in) or (  a and b);
	end process;
end Behavioral;

entity D_FF is
	port (Q: out bit; D, C, Clear_b: in bit);
end D_FF;

architecture Behavioral of D_FF is
begin
  process (C) begin
 	if C'event and C = '1' then
		if (Clear_b = '0') then Q <= '0';
		else Q <= D;
		end if;
	end if;
end process;
end Behavioral;

entity and2_gate is
  port (y: out bit; xin1, xin2: in bit);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;

