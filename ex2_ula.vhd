library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex2_ula is
	generic(N: natural:= 8);
	port(
		A, B:	in std_logic_vector (N-1 downto 0);
		S: OUT std_logic_vector (N-1 downto 0);
		sel: in std_logic_vector  (2 downto 0)
	);
end ex2_ula;
			
architecture comportamento of ex2_ula is
begin
process(A, B, sel)	
begin
		case sel is
		when "000" => S <= A + B;
		when "001" => S <= A - B;
		when "010" => S <= A or B;
		when "011" => S <= A  and B;
		when "100" => S <= not A;
		when "101" =>
			if A < B then 
				S <= (others=>'1');
			else 
				S <= (others=>'0');
			end if;	
		when others => S <= (others=>'X');
		end case;
		
end process;
		
end comportamento;
