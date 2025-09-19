
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Prob_8_23_vhdl is
	generic (m_size: integer := 9);	

	port (Product: buffer Unsigned(2*m_size -1 downto 0); 
			Ready: buffer Std_Logic; 
			Multiplicand, Multiplier: in Unsigned (m_size -1 downto 0);
			Start, clock, reset_b: in Std_Logic);		
end entity Prob_8_23_vhdl;

architecture Partitioned of Prob_8_23_vhdl is
  	signal A, Q: Unsigned (m_size -1 downto 0);
	signal Q0, Zero, Load_regs, Decr_P, Add_regs, Shift_regs: Std_Logic;

	component Datapath_Unit 
		generic (m_size, BC_size: integer);
		port (A, Q: out Unsigned (m_size-1 downto 0); 
			Q0, Zero: out Std_Logic;
			Multiplicand, Multiplier: in Unsigned (m_size-1 downto 0); 
			Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b: in Std_Logic); 		
	end component;
	
	component Control_Unit
		generic (m_size, BC_size: integer);	
		port (Ready, Decr_P, Shift_regs, Add_regs, Load_regs: out Std_Logic;
		Start, Q0, Zero, clock, reset_b: in Std_Logic); 
	end component;
begin
	Product <= A & Q; 

	M0: Datapath_Unit generic map (m_size => 9, BC_size => 4) port map (A, Q, Q0, Zero, Multiplicand, Multiplier, Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b);

	M1: Control_Unit generic map (m_size => 9, BC_size => 4) port map (Ready, Decr_P, Shift_regs, Add_regs, Load_regs, Start, Q0, Zero, clock, reset_b);
end Partitioned;

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;

entity Datapath_Unit is
		generic (m_size, BC_size: integer);
		port (A: buffer Unsigned (m_size -1 downto 0); Q: buffer Unsigned (m_size -1 downto 0);
				Q0, Zero: out Std_Logic; 
				Multiplicand, Multiplier: in Unsigned (m_size -1 downto 0); 
				Load_regs, Decr_P, Add_regs, Shift_regs, clock, reset_b: in Std_Logic);
end entity Datapath_Unit;
	
architecture Behavioral of Datapath_Unit is
  signal P: integer;
  signal B: Unsigned (m_size -1 downto 0);
  signal S: Unsigned (m_size downto 0);
  signal C: Std_Logic;
begin
  Q0 <= Q(0);
  Zero <= '1' when P = '0' else '0';
  S <= ('0' & A) +('0' & B);

  process (clock, reset_b) begin
    if (reset_b = '0') then
    	C <= '0';	
		for k in 0 to m_size-1 loop
			B(k) <= '0';
			A(k) <= '0';
			Q(k) <= '0';
		end loop;
    elsif clock'event and clock = '1' then
		if Load_regs = '1' then
			for k in 0 to m_size-1 loop
				A(k) <= '0';
			end loop;
			C <= '0';
			Q <= Multiplier;
			B <= Multiplicand;
			P <= m_size;
		end if;
		if (Decr_P = '1') then P <= P -1; end if;
		if (Add_regs = '1') then 
			C <= S(m_size); 
			A <= S(m_size-1 downto 0);
		end if;
		if (Shift_regs = '1') then 
			Q <= A(0) & Q(m_size-1 downto 1);
			A <= C & Q(m_size-1 downto 1);
			C <= '0';
		end if;
	end if;	 
  end process;
end Behavioral;
 
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;
Library Synopsys;
use Synopsys.attributes.all;

entity Control_Unit is
		generic (m_size, BC_size: integer);
		port (Ready, Decr_P, Shift_regs, Add_regs, Load_regs: out bit; Start, Q0, Zero, clock, reset_b: in bit);
end entity Control_Unit;

architecture Behavioral of Control_Unit is
	type State_type is (S_idle, S_load, S_decr, S_shift);
	attribute enum_encoding of State_type : type is "00 01 10 11";
	signal state, next_state: State_type;
begin
 Ready <= '1' when (state = S_idle) else '0';
 Shift_regs <= '1' when (state = S_shift) else '0';
 Decr_P <= '1' when (state = S_decr) else '0';

  process  (clock, reset_b) begin
    if (reset_b = '0') then state <= S_idle; 
	 elsif clock'event and clock = '1' then state <= next_state;
	 end if;
  end process;

  process (state, Start, Q0, Zero) begin
    next_state <= S_idle;
    Load_regs <= '0';
    Add_regs <= '0';
    case (state) is
      when S_idle =>	if (Start = '0') then next_state <= S_idle; 
							else next_state <= S_load; Load_regs <= '1'; end if;
      when S_load =>	next_state <= S_decr; 
      when S_decr =>	next_state <= S_shift; if (Q0 = '1') then  Add_regs <= '1'; end if;
      when S_shift =>	if (Zero = '1') then next_state <= S_idle; else next_state <= S_load; end if;
    end case;
  end process;
end  behavioral;

