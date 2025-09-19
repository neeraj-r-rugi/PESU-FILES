entity Prob_6_44_Str_VHDL is
	port (SO: out bit; data_A, data_B: in bit_vector (7 downto 0); S_in, load, Shift_control, CLK, Clear: in bit);
end Prob_6_44_Str_VHDL;

architecture Structural of Prob_6_44_Str_VHDL is
  signal gnd: bit;
  signal sum, carry: bit;
signal SO_A, SO_B, Q: bit;
component  Shift_Reg_gated_clock port (SO: out bit; S_in: in bit; data: in bit_vector (7 downto 0); load, Shift_control, Clock, reset_b: in bit); end component;
component D_FF_gated port (Q: out bit; D, Shift_control, Clock, reset_b:in bit); end component;
component FA port (carry, sum: out bit; a, b, C_in: in bit); end component;
component Mux_2 port (y: out bit; a, b, sel: in bit); end component;
begin
  SO <= sum;

  M_A: Shift_Reg_gated_clock port map (SO_A, sum, data_A, load, Shift_control, CLK, Clear);
  M_B: Shift_Reg_gated_clock port map (SO_B,  S_in, data_B, load, Shift_control, CLK, Clear);
  M_FA: FA port map (carry, sum, SO_A, SO_B, Q);
  M_DFF: D_FF_gated port map (Q, carry, Shift_control, CLK, Clear);
end Structural;

entity Shift_Reg_gated_clock is
	port (SO: out bit; S_in: in bit; data: in bit_vector (7 downto 0); load, Shift_control, Clock, reset_b: in bit);
end Shift_Reg_gated_clock;

architecture Behavioral of Shift_Reg_gated_clock is
  signal Sreg: bit_vector (7 downto 0);
begin
   SO <= Sreg(0);
    process (Clock, reset_b) begin
    	if (reset_b = '0') then SReg <= "00000000"; 
    	elsif Clock'event and Clock = '1' then
			if (load = '1') then SReg <= data; 
    			elsif (Shift_control = '1') then SReg <= S_in & Sreg(7 downto 1);
			end if;
	end if;
    end process;
end Behavioral;

entity D_FF_gated is
	port (Q: buffer bit ; D, Shift_control, Clock, reset_b: in bit);
end D_FF_gated;

architecture Structural of D_FF_gated is
   signal D_internal: bit;
   component D_FF port (Q: buffer bit;   D: in bit; Clock, reset_b: in bit); end component;
   component Mux_2 port (y: out bit; a, b, sel: in bit); end component;

begin
   M_D_FF: D_FF port map (Q,   D_internal, Clock, reset_b);
   M_Mux:  Mux_2 port map (D_internal, Q, D, Shift_control);
end Structural;

entity D_FF is
	port (Q: out bit; D: in bit; Clock, reset_b: in bit);
end D_FF;
architecture Behavioral of D_FF is
begin
	process (Clock, reset_b) begin
    if (reset_b = '0') then Q <= '0'; 
	elsif Clock'event and Clock = '1' then Q <= D; end if;
    end process;
end  Behavioral;

entity Mux_2 is
	port (y: out bit; a, b, sel: in bit);
end Mux_2;

architecture Behavioral of Mux_2 is
begin
  process (a, b, sel) begin
	if (sel = '1') then y <= b; 
	else y <= a;
	end if;
 end process;
end  Behavioral;
 
entity FA is
	port (carry, sum: out bit; a, b, C_in: in bit);
end FA;

architecture Behavioral of FA is
begin
	process (a, b, C_in) begin
  			sum <= a xor b xor C_in;
			carry <= ((a xor b) and C_in) or ( a and b);
	end process;
end Behavioral;

