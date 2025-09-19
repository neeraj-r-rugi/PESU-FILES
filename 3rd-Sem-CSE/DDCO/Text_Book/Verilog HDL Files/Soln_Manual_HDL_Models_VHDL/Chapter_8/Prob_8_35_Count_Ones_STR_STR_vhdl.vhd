Library IEEE;
use IEEE.Std_Logic_1164.all;

entity PROB_8_35_COUNT_ONES_STR_STR_VHDL is
	generic (R1_size: integer := 8; R2_size: integer := 4);
	port  (count: out Std_Logic_vector (R2_size-1 downto 0); Ready: out Std_Logic; data: in Std_Logic_vector (R1_size-1 downto 0); Start, clock, reset_b: in Std_Logic);
end PROB_8_35_COUNT_ONES_STR_STR_VHDL;

architecture Structural of PROB_8_35_COUNT_ONES_STR_STR_VHDL is
	signal Load_regs, Shift_left, Incr_R2, Zero, E: Std_Logic;
  	component Controller_STR port (Ready: out Std_Logic; Load_regs, 	Shift_left, Incr_R2: out Std_Logic; Start, E, Zero, clock, reset_b: in 	Std_Logic);
	end component;

	component Datapath_STR port (count: out Std_Logic_vector 
			(R2_size-1 downto 0); E, Zero: out Std_Logic; 
			data: Std_Logic_vector (R1_size-1 downto 0);
			Load_regs, Shift_left, Incr_R2, clock: in Std_Logic);
	end component;

begin
 M0: Controller_STR port map (Ready, Load_regs, Shift_left, Incr_R2, Start, E, Zero, clock, reset_b);
 M1: Datapath_STR port map (count, E, Zero, data, Load_regs, Shift_left, Incr_R2, clock);
end Structural;

Library IEEE;
use IEEE.Std_Logic_1164.all; 
entity Controller_STR is
	port (Ready: buffer Std_Logic; Load_regs, Shift_left, Incr_R2: out 			Std_Logic; Start, E, Zero, clock, reset_b: in Std_Logic);
end Controller_STR;

architecture Behavioral of Controller_STR is
	signal 	GND: Std_Logic;
	signal	PWR: Std_Logic;
	type 		State_type is (S0, S1, S2, S3);
	signal state, next_state: State_type;
	signal G0, D_in0, D_in1, G1: Std_Logic;
  	signal Decoder_out: Std_Logic_vector (0 to 3);
	signal Zero_b, E_b: Std_Logic; 
	signal sel: Std_Logic_vector (1 downto 0);
	
	component mux_4x1_beh 	port (m_out: out Std_Logic;
 			in_0, in_1, in_2, in_3: in Std_Logic;
			sel: in Std_Logic_vector (1 downto 0));
	end component;

	component D_flip_flop_AR 
		port (Q: out Std_Logic; D, CLK, RST: in Std_Logic);
	end component;

	component decoder_2x4_df 
		port (D: out Std_Logic_vector (3 downto 0); 
			A, B, enable: in Std_Logic);
	end component;

begin
	PWR <= '1';
	GND <= '0';
 	Zero_b <= not Zero;
	E_b <= not E ;
	sel <= G1 & G0;
 	Ready <= not Decoder_out(0);
	Incr_R2 <= not Decoder_out(1);
 	Shift_left <= not Decoder_out(2);
	Load_regs <= Ready and Start;

	Mux_1: mux_4x1_beh 	port map	 (D_in1, GND, Zero_b, PWR, E_b, sel);
	Mux_0: mux_4x1_beh 	port map	 (D_in0, Start, GND, PWR, E, sel);
	M1: D_flip_flop_AR 	port map	 (G1, D_in1, clock, reset_b);
 	M0: D_flip_flop_AR 	port map	 (G0, D_in0, clock, reset_b);
	M2: decoder_2x4_df 	port map	 (Decoder_out, G1, G0, GND);
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all; 
 
entity Datapath_STR is
	generic (R1_size: integer := 8; R2_size: integer := 4);
	port (count: out Std_Logic_vector (R2_size-1 downto 0); 
		E, Zero: out Std_Logic; data: Std_Logic_vector 
		(R1_size-1 downto 0);
		Load_regs, Shift_left, Incr_R2, clock: in Std_Logic);
end Datapath_STR;

architecture Structural of Datapath_STR is
	signal GND: Std_Logic;
	signal PWR: Std_Logic;
	signal R1: Std_Logic_vector (R1_size -1 downto 0);
	signal w1: Std_Logic;
	
	component Shft_Reg port (R1: out Std_Logic_vector (R1_size-1 downto 0);  
			data: in Std_Logic_vector (R1_size-1 downto 0);
			SI_0, Shift_left, Load_regs, clock, reset_b: in Std_Logic);
	end component;
 	
	component Counter port (R2: out Std_Logic_vector (R2_size -1 downto 0); 				Load_regs, Incr_R2, clock, reset_b: in Std_Logic); 
	end component;

	component D_flip_flop_AR port (Q: out Std_Logic; D, CLK, RST: in 					Std_Logic);
	end component;

	component and2_gate port (y: out Std_Logic; xin1, xin2: in Std_Logic);
	end component;
begin
	PWR <= '1';
	GND <= '0';
	process (R1) begin		-- Detect empt
		Zero <= '1';
		for k in R1_size-1 downto 0 loop if R1(k) = '1' then Zero <= '0'; 			end if; end loop; 
	end process;

	M_1: 	Shft_Reg port map (R1, data, Gnd, Shift_left, Load_regs, clock, 			PWR);
	M_2:  Counter port map (R2 => count, Load_regs => Load_regs, Incr_R2 => 			Incr_R2, clock =>clock, reset_b => PWR);
 	M_3: 	D_flip_flop_AR port map (E, w1, clock, Pwr);
	G_1:	and2_gate 		port map (w1, R1(R1_size -1), Shift_left);
end Structural;
 
Library IEEE;
use IEEE.Std_Logic_unsigned.all;
use IEEE.Std_Logic_1164.all;


entity Counter is
	generic (R2_size: integer := 4);
	port(R2: buffer Std_Logic_vector  (R2_size -1 downto 0);
	Load_regs, Incr_R2: in Std_Logic; clock, reset_b: in Std_Logic);
end Counter;

architecture Behavioral of Counter is
begin	
	process(clock, reset_b) begin
	if reset_b = '0' then for k in 0 to R2_size -1 loop R2(k) <= '0'; 
	end loop;
	elsif clock'event and clock = '1' then 
		if Load_regs = '1' then for k in 0 to R2_size -1 loop 
			R2(k) <= '1'; 
		end loop;
		else if Incr_R2 = '1' then R2 <= R2 + 1;
		end if;
	end if;
	end if;
	end process;
end Behavioral;
 
Library IEEE;
use IEEE.Std_Logic_1164.all; 

entity Shft_Reg is
	generic (R1_size: integer := 8); 
	port (R1: buffer Std_Logic_vector (R1_size-1 downto 0);  
			data: in Std_Logic_vector (R1_size-1 downto 0);
			SI_0, Shift_left, Load_regs, clock, reset_b: in Std_Logic);
end Shft_Reg;

architecture Behavioral of Shft_Reg is
	-- signal R1: Std_Logic_vector (R1_size -1 downto 0);		
begin
	process (clock, reset_b) begin
    		if (reset_b = '0') then for k in 0 to R1_size-1 loop 
			R1(k) <= '0'; 
			end loop;
    		elsif clock'event and clock = '1' then
			if (Load_regs = '1') then R1 <= data; 
        	elsif (Shift_left = '1') then R1 <= R1(R1_size -2 downto 0) & SI_0; 
		end if;
		end if;
	end process;
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;

entity D_flip_flop_AR is
	port (Q: out Std_Logic; D, CLK, RST: in Std_Logic);
end D_flip_flop_AR;

architecture Behavioral of D_flip_flop_AR is
begin
	process (CLK, RST)	begin
    		if (RST = '0') then Q <= '0';
    		elsif CLK'event and CLK = '1' then Q <= D;	
		end if;
	end process; 
end Behavioral;

Library IEEE;
use IEEE.Std_Logic_1164.all;
-- Behavioral description of 4-to-1 line multiplexer
entity mux_4x1_beh is
	port (m_out: out Std_Logic;
 			in_0, in_1, in_2, in_3: in Std_Logic;
			sel: in Std_Logic_vector (1 downto 0));
end mux_4x1_beh;

architecture Behavioral of mux_4x1_beh is
begin
	process (in_0, in_1, in_2, in_3, sel)	begin  
    		case (sel) is
       		when "00" =>	m_out <= in_0;
       		when "01" =>	m_out <= in_1;

       		when "10" =>	m_out <= in_2;
       		when "11" =>	m_out <= in_3;
			when others => m_out <= in_0;
		end case;
	end process;
  end Behavioral;

-- Dataflow description of 2-to-4-line decoder
-- See Fig. 4.19. Note: The figure uses symbol E, but the
-- VHDL model uses enable to clearly indicate functionality.

Library IEEE;
use IEEE.Std_Logic_1164.all;
entity decoder_2x4_df is
	port (D: out Std_Logic_vector (0 to 3); A, B, enable: in Std_Logic);
end decoder_2x4_df;

architecture Behavioral of decoder_2x4_df is
begin
	D(0) <= not ((not A) and (not B) and (not enable));
	D(1) <= not ((not A) and B and (not enable));
	D(2) <= not (A and (not B) and (not enable)); 
	D(3) <= not (A and B and (not enable));   
end Behavioral;
 
Library IEEE;
use IEEE.Std_Logic_1164.all;
 
entity and2_gate is
	port (y: out Std_Logic; xin1, xin2: in Std_Logic);
	end and2_gate;
	
architecture Behavioral of and2_gate is
begin	
	y <= xin1 and xin2;
end Behavioral;
 
-- Testbench
Library IEEE;
use IEEE.Std_Logic_1164.all;
entity t_Count_Ones is
  	generic (R1_size: integer := 8; R2_size: integer := 4); 
end t_Count_ones;

architecture Behavioral of t_Count_ones is
  	signal	t_R2: Std_Logic_vector (R2_size -1 downto 0);
  	signal	t_count: integer;
  	signal	t_Ready: Std_Logic;
	signal	t_data : Std_Logic_vector (R1_size -1 downto 0);   					
	signal t_Start, t_clk, t_reset_b: Std_Logic;		 
	component Prob_8_35_Count_Ones_STR_STR_vhdl 
		generic (R1_size: integer := 8; R2_size: integer := 4);
		port  (count: out integer; Ready: out Std_Logic; 
			data: in Std_Logic_vector (R1_size-1 downto 0);
			Start, clock, reset_b: in Std_Logic);
	end component;
begin
	UUT: Prob_8_35_Count_Ones_STR_STR_vhdl 
		generic map (R1_size => 8, R2_size => 4)
		port map (t_count, t_Ready, t_data,t_Start, t_clk, t_reset_b);

process -- clock for testbench
begin
	t_clk <= '0'; 
wait for 5 ns;
t_clk <= '1';
wait for 5 ns;
end process;

	t_Start <= '0';

	t_reset_b <= '1' after 1 ns;
	t_reset_b <= '0' after 3 ns;
	t_reset_b <= '1' after 4 ns;
     	t_data <= "11111111" after 4 ns;
    	t_Start <= '1' after 4 ns;
     t_Start <= '0' after 300 ns;
     t_data <= "00001111" after 310 ns;
     t_Start <= '1' after 310 ns;
     t_Start <= '0' after 320 ns;
     t_data <= "11110000" after 610 ns;
     t_Start <= '1' after 610 ns;
     t_Start <= '0' after 620 ns;
     t_data <= "00000000" after 910 ns;
     t_Start <= '1' after 910 ns;
     t_Start <= '0' after 920 ns;
     t_data <= "10101010" after 1210 ns;
     t_Start <= '1' after 1210 ns;
     t_Start <= '0' after 1220 ns;
     t_data <= "00001010" after 1510 ns;
     t_Start <= '1' after 1510 ns;
     t_Start <= '0' after 1520 ns;
     t_data <= "10100000" after 1810 ns;
     t_Start <= '1' after 1810 ns;
     t_Start <= '0' after 1820 ns;
     t_data <= "01010101" after 2110 ns;
     t_Start <= '1' after 2110 ns;
     t_Start <= '0' after 2120 ns;
     t_data <= "00000101" after 2410 ns;
     t_Start <= '1' after 2410 ns;
     t_Start <= '0' after 2420 ns;
     t_data <= "0101" after 2710 ns;
     t_Start <= '1' after 2710ns;
     t_Start <= '0' after 2720 ns;
     t_data <= "10100101" after 3010 ns;
     t_Start <= '1' after 3010 ns;
     t_Start <= '0' after 3020 ns;
     t_data <= "01011010" after 3310 ns;
     t_Start <= '1' after 3310 ns;
     t_Start <= '0' after 3320 ns;
end Behavioral;

