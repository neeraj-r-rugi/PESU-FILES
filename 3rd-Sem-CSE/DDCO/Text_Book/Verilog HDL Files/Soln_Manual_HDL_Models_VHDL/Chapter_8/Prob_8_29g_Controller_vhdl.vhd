library IEEE;use IEEE.Std_Logic_1164.all;
entity Prob_8_29g_Controller_vhdl is	port (x, y, E, F, clock, reset_b: in Std_Logic);end Prob_8_29g_Controller_vhdl;architecture Structural of Prob_8_29g_Controller_vhdl is
	signal w1, m1, m2, m3: Std_Logic;
	signal G1, G2, G3: Std_Logic;
	signal F_bar, E_bar, x_bar: Std_Logic;
	signal y0, y1, y2, y3, y4, y5, y6, y7: Std_Logic;	signal GND: Std_Logic;	signal VCC: Std_Logic;
	
	component  and2_gate port (y: out Std_Logic; xin1, xin2: in Std_Logic);	end component;
		component DFF_8_29g port (q: out Std_Logic; data: in Std_Logic; clock, reset_b: in Std_Logic);	end component;
	
	component  mux_8x1 port (y: out Std_Logic; x0, x1, x2, x3, x4, x5, x6, x7: in Std_Logic; s2, s1, s0: in Std_Logic);	end component;
	
	component not_gate port (y: out Std_Logic; xin1: in Std_Logic);	end component;	
	
	component decoder_3x8 port (y0, y1, y2, y3, y4, y5, y6, y7: out Std_Logic; x2, x1, x0: in Std_Logic);	end component;	
begin
	GND <= '0';
	VCC <='1';	M_3: mux_8x1  		port map (m3, GND, GND, F_bar, GND, VCC, GND, VCC, GND, G3, G2, G1);	M_2: mux_8x1 		port map (m2, w1, VCC, F, GND, E_bar, GND, VCC, GND, G3, G2, G1);
	M_1: mux_8x1 		port map (m1, x, GND, F, GND, E, GND, VCC, GND, G3, G2, G1);
  DFF_M3:DFF_8_29g 	port map (G3, m3, clock, reset_b);
  DFF_M2:DFF_8_29g 	port map (G2, m2, clock, reset_b);
  DFF_M1:DFF_8_29g 	port map (G1, m1, clock, reset_b);
  M0_D: decoder_3x8 	port map (y0, y1, y2, y3, y4, y5, y6, y7, G3, G2, G1);
  M_4: and2_gate 		port map (w1, x_bar, y);
  M_5: not_gate 		port map (F_bar, F);
  M_6: not_gate 		port map (E_bar, E);
  M_7: not_gate 		port map (x_bar, x);end Structural;
library IEEE;
use IEEE.Std_Logic_1164.all;
entity mux_8x1 is 	port (y: out Std_Logic; x0, x1, x2, x3, x4, x5, x6, x7: in Std_Logic; s2, s1, s0: in Std_Logic);end mux_8x1;architecture Behavioral of mux_8x1 is
signal sel_mux: Std_Logic_vector (2 downto 0);
 begin
	sel_mux <= s2 & s1 &s0;	process (x0, x1, x2, x3, x4, x5, x6, x7, s0, s1, s2) begin		case (sel_mux) is      		when "000" =>	y <= x0;      		when "001" =>	y <= x1;      		when "010" =>	y <= x2;           		when "011" =>	y <= x3;       				when "100" =>	y <= x4;      		when "101" => 	y <= x5;      		when "110" => 	y <= x6;      		when "111" => 	y <= x7;     	end case;
	end process;end Behavioral;
library IEEE;
use IEEE.Std_Logic_1164.all;
entity DFF_8_29g is	port (q: out Std_Logic; data, clock, reset_b: in Std_Logic);end DFF_8_29g;architecture Behavioral of DFF_8_29g isbegin	process (clock, reset_b) begin		if (reset_b = '0') then q <= '0';		elsif clock'event and clock = '1' then q <= data; 		end if;	end process;end Behavioral;
library IEEE;
use IEEE.Std_Logic_1164.all;
entity  decoder_3x8 is	port (y0, y1, y2, y3, y4, y5, y6, y7: out Std_Logic; x2, x1, x0: in Std_Logic);end decoder_3x8;architecture Behavioral of decoder_3x8 is
signal sel_dec: Std_Logic_vector (2 downto 0);begin
sel_dec <= x2 & x1 & x0;	process (x0, x1, x2) begin
	    	y7 <= '0'; y6 <= '0'; y5 <= '0'; y4 <= '0'; 		y3 <= '0'; y2 <= '0'; y1 <= '0'; y0 <= '0';
				case (sel_dec) is      	when "000" =>  y0 <= '1';      	when "001" =>  y1 <= '1';      	when "010" =>  y2 <= '1';     	 	when "011" =>  y3 <= '1';     	 	when "100" =>  y4 <= '1';      	when "101" =>  y5 <= '1';      	when "110" =>  y6 <= '1';			when "111" =>  y7 <= '1';    	end case;
	end process;
end Behavioral;  
  
library IEEE;
use IEEE.Std_Logic_1164.all;
entity and2_gate is  port (y: out Std_Logic; xin1, xin2: in Std_Logic);end and2_gate;architecture Behavioral of and2_gate isbegin	y <= xin1 and xin2;end Behavioral;
library IEEE;
use IEEE.Std_Logic_1164.all;
entity not_gate is  port (y: out Std_Logic; xin1: in Std_Logic);end not_gate;architecture Behavioral of not_gate isbegin	y <= not xin1;end Behavioral;