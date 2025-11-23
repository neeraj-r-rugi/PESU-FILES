   entity Prob_6_35e_vhdl is
port (A_par: buffer bit_vector (3 downto 0); I_par: in bit_vector (3 downto 0); 
s1, s0, CLK, Clear: in bit);
   end prob_6_35e_vhdl;
   
   architecture Structural of Prob_6_35e_vhdl is
   	signal y3, y2, y1, y0: bit;
   	component  D_FF port (Q: out bit;  D, CLK, Clear: in bit); end component;
   	component MUX_4x1 port (y: out bit; I3, I2, I1, I0, s1, s0: in bit); end component;
   
   begin
   D3: D_FF port map (A_par(3),  y3, CLK, Clear);
   D2: D_FF port map (A_par(2),  y2, CLK, Clear);
   D1: D_FF port map (A_par(1),  y1, CLK, Clear);
   D0: D_FF port map (A_par(0),  y0, CLK, Clear);
   
   	M3: MUX_4x1 port map (y3, I_par(3), A_par(2), MSB_in, A_par(3), s1, s0); 
   	M2: MUX_4x1 port map (y2, I_par(2), A_par(1), A_par(3), A_par(2), s1, s0); 
   	M1: MUX_4x1 port map (y1, I_par(1), A_par(0), A_par(2), A_par(1), s1, s0); 
   	M0: MUX_4x1 port map (y0, I_par(0), LSB_in, A_par(1), A_par(0), s1, s0);
   end Structural;
   
   entity MUX_4x1 is
   	port (y: out bit; I3, I2, I1, I0, s1, s0: in bit);
   end MUX_4x1;
   
   architecture Behavioral of MUX_4x1 is
   begin
   process  (I3, I2, I1, I0, s1, s0)
   	y <= I0;
       case s1 & s0 is
         	when "11" =>	y <= I3;
         	when "10" =>	y <= I2;
         	when "01" =>	y <= I1;
         	when "00" =>	y <= I0;
   		when others =>	y <= I0;
   	end case;
   end process;
   end  Behavioral;
   
   entity D_FF is
   	port (Q: out bit; D, clk, reset_b: in bit);
   end D_FF;
   
   architecture Behavioral of D_FF is
   begin
   	process  (clk, reset_b) begin
   		if reset_b = '0' then Q <= '0'; 
   		elsif clk'event and clk = '1' then Q <= D;
   		end if;
   	end process;
   end Behavioral;

