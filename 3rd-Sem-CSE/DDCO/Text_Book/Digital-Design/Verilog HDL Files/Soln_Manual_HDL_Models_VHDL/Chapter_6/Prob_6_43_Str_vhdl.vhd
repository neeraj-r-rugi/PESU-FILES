entity Prob_6_43_Str_vhdl is
	port (SO: out bit; data_A: in bit_vector (7 downto 0); D_in, load, shift, Clock, reset_b: in bit);
end Prob_6_43_Str_vhdl;

architecture Structural of Prob_6_43_Str_vhdl is
	signal SO_A: bit;
	-- Register A
	component SReg8_with_Load port (SO: out bit; D_in: in bit; data: in bit_vector (7 downto 0); load, shift, Clock, reset_b: in bit); end component;
	-- Register B
	component SReg8 port (SO: out bit; D_in: in bit; shift, Clock, reset_b: in bit); end component;

begin
	-- Register A
 	M_A: Sreg8_with_Load port map (SO => SO_A, D_in => D_in, data => data_A, load => load, shift => shift, Clock => clock, reset_b => reset_b);

	-- Register B
  	M_B: Sreg8 port map (SO => SO, D_in => SO_A, shift => shift, Clock => Clock, reset_b => reset_b);
end structural;

entity Sreg8_with_Load is	-- Register A
	port (SO: out bit; D_in: in bit; data: in bit_vector (7 downto 0); load, shift, Clock, reset_b: in bit);
end Sreg8_with_Load;

architecture Structural of Sreg8_with_Load is
  signal Q: bit_vector (7 downto 0);  
  component SR_A_cell port (Q: buffer bit; D_in, data, load, shift, Clock, reset_b: in bit); end component;
begin
  SO <= Q(0);
  M7: SR_A_cell port map (Q(7), D_in, data(7), load, shift, Clock, reset_b);
  M6: SR_A_cell port map (Q(6), Q(7), data(6), load, shift, Clock, reset_b);
  M5: SR_A_cell port map (Q(5), Q(6), data(5), load, shift, Clock, reset_b);
  M4: SR_A_cell port map (Q(4), Q(5), data(4), load, shift, Clock, reset_b);
  M3: SR_A_cell port map (Q(3), Q(4), data(3), load, shift, Clock, reset_b);
  M2: SR_A_cell port map (Q(2), Q(3), data(2), load, shift, Clock, reset_b);
  M1: SR_A_cell port map (Q(1), Q(2), data(1), load, shift, Clock, reset_b);
  M0: SR_A_cell port map (Q(0), Q(1), data(0), load, shift, Clock, reset_b);
end Structural;

entity Sreg8 is	-- Register B
		port (SO: out bit; D_in: in bit; shift, Clock, reset_b: in bit);
end Sreg8;

architecture Structural of Sreg8 is
  signal Q: bit_vector (7 downto 0);  
  component SR_B_cell port (Q: out bit; D_in, shift, Clock, reset_b: in bit); end component;
begin
  SO <= Q(0);
  M7: SR_B_cell port map (Q => Q(7), D_in => D_in, shift => shift, Clock => Clock, reset_b => reset_b);
  M6: SR_B_cell port map (Q => Q(6), D_in => Q(7), shift => shift, Clock => Clock, reset_b => reset_b);
  M5: SR_B_cell port map (Q => Q(5), D_in => Q(6), shift => shift, Clock => Clock, reset_b => reset_b);
  M4: SR_B_cell port map (Q => Q(4), D_in => Q(5), shift => shift, Clock => Clock, reset_b => reset_b);
  M3: SR_B_cell port map (Q => Q(3), D_in => Q(4), shift => shift, Clock => Clock, reset_b => reset_b);
  M2: SR_B_cell port map (Q => Q(2), D_in => Q(3), shift => shift, Clock => Clock, reset_b => reset_b);
  M1: SR_B_cell port map (Q => Q(1), D_in => Q(2), shift => shift, Clock => Clock, reset_b => reset_b);
  M0: SR_B_cell port map (Q => Q(0), D_in => Q(1), shift => shift, Clock => Clock, reset_b => reset_b);
end Structural;

entity SR_A_cell is
	port (Q: buffer bit; D_in, data, load, shift, Clock, reset_b: in bit);
end SR_A_cell;

architecture Structural of SR_A_cell is
  signal y: bit;
  component D_FF_with_load port (Q: buffer bit; data_S, data_P, load, shift, Clock, reset_b: in bit); end component;
  component Mux_2 port (y : out bit; a, b, sel: in bit); end component;
begin
  M0: D_FF_with_load port map (Q => Q, data_S => y, data_P => data, load => load, shift => shift, Clock => Clock, reset_b => reset_b);
  M1: Mux_2 port map (y, Q,  D_in, shift);
end  Structural;

entity D_FF_with_load is 
	port (Q: out bit ; data_S, data_P, load, shift, Clock, reset_b: in bit);
end D_FF_with_load;

architecture Behavioral of D_FF_with_load is
begin
  process (Clock, reset_b) begin
    if (reset_b = '0') then Q <= '0'; 
    elsif Clock'event and Clock = '1' then
	if (load = '1') then Q <= data_P; else Q <= data_S; end if;
    end if;
  end process;
end Behavioral;

entity Mux_2 is
	port (y: out bit; a, b, sel: in bit);
end Mux_2;

architecture behavioral of Mux_2 is
begin
	 process (a, b, sel) begin 
			if (sel = '1') then y <= b; else y <= a; end if;
	end process;
end Behavioral;

entity SR_B_cell is
	port (Q: buffer bit; D_in, shift, Clock, reset_b: in bit);
end SR_B_cell;

architecture Structural of SR_B_cell is
  signal y: bit;
  component D_FF port (Q: buffer bit; D, Clock, reset_b: in bit); end component;
  component Mux_2 port (y : out bit; a, b, sel: in bit); end component;
begin
  M0: D_FF port map (Q => Q, D => y, Clock => Clock, reset_b => reset_b);
  M1: Mux_2 port map (y, Q,  D_in, shift);
end  Structural;

entity D_FF is 
	port (Q: out bit ; D, Clock, reset_b: in bit);
end D_FF;

architecture Behavioral of D_FF is
begin
  process (Clock, reset_b) begin
    if (reset_b = '0') then Q <= '0'; 
    elsif Clock'event and Clock = '1' then
	Q <= D;
    end if;
  end process;
end Behavioral;


