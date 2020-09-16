library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ex1_soma_sub is
	generic(N: natural:= 4);
	port(
			A, B: in std_logic_vector(N-1 downto 0);
			cin: in std_logic;
			opcode: in std_logic;
			S: out std_logic_vector(N downto 0)
		 );
end ex1_soma_sub;

architecture comportamento of ex1_soma_sub is
begin
		S <= (A(N-1) & A) + (B(N-1) & B) + cin when opcode = '0' else
		(A(N-1) & A) - (B(N-1) & B) + cin;
end comportamento;