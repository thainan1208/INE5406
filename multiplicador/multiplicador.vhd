LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY multiplicador IS
PORT (clk : IN STD_LOGIC;
      reset, inicio: IN STD_LOGIC;
      entA, entB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pronto : OUT STD_LOGIC;
      saida : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END multiplicador;

ARCHITECTURE estrutura OF multiplicador IS

COMPONENT bo IS
PORT (clk : IN STD_LOGIC;
      ini, CP, CA, dec : IN STD_LOGIC;
      entA, entB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      Az, Bz : OUT STD_LOGIC;
      saida, conteudoA, conteudoB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

COMPONENT bc IS
PORT (Reset, clk, inicio : IN STD_LOGIC;
      Az, Bz : IN STD_LOGIC;
      pronto : OUT STD_LOGIC;
      ini, CA, dec, CP: OUT STD_LOGIC );
END COMPONENT;

SIGNAL inii, cpp, caa, decc, azz, bzz : STD_LOGIC;
SIGNAL contA, contB : STD_LOGIC_VECTOR(3 downto 0);

BEGIN
	controle: bc PORT MAP (reset, clk, inicio, azz, bzz, pronto, inii, caa, decc, cpp);
	datapath: bo PORT MAP (clk, inii, cpp, caa, decc, entA, entB, azz, bzz, saida, contA, contB);

END estrutura;