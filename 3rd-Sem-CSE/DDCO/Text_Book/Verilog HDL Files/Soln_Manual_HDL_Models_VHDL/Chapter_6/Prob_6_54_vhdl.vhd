--library IEEE;
--use IEEE_Std_Logic_1164.all;
entity Prob_6_54_vhdl is 
	port (SR_A: buffer Bit_vector (3 downto 0); Shift_control, SI, CLK, Clear_b: in Bit);
end Prob_6_54_vhdl;

architecture Behavioral of Prob_6_54_vhdl is
  signal SR_B: Bit_vector (3 downto 0);
  signal S: Bit;
  signal Q: Bit;
  signal SI_A: Bit;
  signal SO_A: Bit;
  signal SO_B: Bit;
  signal SI_B: Bit;
  signal J_in, K_in: Bit;
  signal clk_to_JK_FF: bit;
  component and2_gate port (y: out Bit; xin1, xin2: in Bit); end component;
  component nor2_gate port (y: out Bit; xin1, xin2: in Bit); end component;
  component xor3_gate port (y: out Bit; xin1, xin2, xin3: in Bit); end component;
  component JK_FF port (Q: buffer Bit; J_in, K_in, C, Clear_b: in Bit); end component;

begin
	SI_A <= S;  
	SO_A <= SR_A(0);
	SO_B <= SR_B(0);
	 SI_B <= SI;
  	G1: 	and2_gate port map (J_in, SO_A, SO_B);
  	G2:	nor2_gate port map (K_in, SO_A, SO_B);
	G3:	xor3_gate port map (S, SO_A, SO_B, Q);
   G4:	and2_gate port map (clk_to_JK_FF, Shift_control, CLK);
  	G5: 	JK_FF port map (Q, J_in, K_in, clk_to_JK_FF, Clear_b);

  process (CLK) begin
    if CLK'event and CLK = '1' then
		if Clear_b = '0' then SR_A <= "0000"; 
			elsif (Shift_control = '1') then SR_A(3 downto 0) <= SI_A & SR_A(3 downto 1); end if;
		end if;
		end process;

  process  (CLK) begin
    if (CLK'event and CLK = '1') then if (Clear_b = '0') then SR_B <= "0000"; 
		elsif (Shift_control = '1') then SR_B <=  SI_B & SR_B(3 downto 1); end if;
	end if;
	end process;

end Behavioral;

entity FA is
	port (S, C: out Bit; x, y, z: in Bit);
end FA;

architecture Boolean_Eq of FA is
begin
	C <= ((x xor y) and z) or (x and y);  
	S <= x xor y xor z;
end Boolean_Eq;

entity JK_FF is
	port (Q: buffer bit; J_in, K_in, C, Clear_b: in Bit);
end JK_FF;

architecture Behavioral of JK_FF is
begin
  process (C) begin
	if C'event and C ='1' then
	if (Clear_b = '0') then Q <= '0'; 
	else  
    		case (J_in & K_in) is
      		when "00" =>		Q <= Q;
      		when "01" =>		Q <= '0';
      		when "10" =>		Q <= '1';
      		when "11" =>		Q <= not Q;	
		end case; 	
	end if;
	end if;
	end process;
end Behavioral;

entity and2_gate is
  port (y: out Bit; xin1, xin2: in Bit);
end and2_gate;

architecture Behavioral of and2_gate is
begin
	y <= xin1 and xin2;
end Behavioral;

entity nor3_gate is
  port (y: out Bit; xin1, xin2, xin3: in Bit);
end nor3_gate;

architecture Behavioral of nor3_gate is
begin
	y <= not( xin1 or xin2 or Xin3);
end Behavioral;

entity nor2_gate is
  port (y: out Bit; xin1, xin2: in Bit);
end nor2_gate;

architecture Behavioral of nor2_gate is
begin
	y <= xin1 nor xin2;
end Behavioral;

entity xor3_gate is
  port (y: out Bit; xin1, xin2, xin3: in Bit);
end xor3_gate;

architecture Behavioral of xor3_gate is
begin
	y <= ( xin1 xor xin2 xor Xin3);
end Behavioral;