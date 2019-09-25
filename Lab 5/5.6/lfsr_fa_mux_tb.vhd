library ieee;
use ieee.std_logic_1164.all;

entity lfsr_fa_mux_tb is
end entity lfsr_fa_mux_tb;

architecture lfsr_fa_mux_tb_arc of lfsr_fa_mux_tb is

component lfsr_fa_mux is

port(
  A  : in   std_logic_vector(3 downto 0);
  B  : in   std_logic_vector(3 downto 0);
  C  : in   std_logic;
  EM : in   std_logic;
  clk: in   std_logic;
  rst: in   std_logic;
  S  : out  std_logic_vector(3 downto 0);  
  Carry : out std_logic);                    

end component;

signal A  : std_logic_vector(3 downto 0);
signal B  : std_logic_vector(3 downto 0);
signal C  : std_logic;
signal EM : std_logic;
signal clk: std_logic := '0';
signal rst: std_logic;
signal S  : std_logic_vector(3 downto 0);  
signal Carry : std_logic;     

begin

u0 : lfsr_fa_mux port map(
	A => A,
	B => B,
	C => C,
	EM => EM,
	clk => clk,
	rst => rst,
	S => S,
	Carry => Carry);
	
process 
  begin

clk <= not clk;
wait for 5 ns;

end process;
  
process
  begin
  
  A<="1011"; B<="0110"; C<='1'; EM<='0'; rst<='1';
  wait for 10 ns;
  
  A<="1011"; B<="0110"; C<='1'; EM<='1'; rst<='0';
  wait for 30 ns;
  
  A<="1011"; B<="0110"; C<='1'; EM<='0'; rst<='0';
  wait for 160 ns;
  
  A<="1001"; B<="1100"; C<='0'; EM<='1'; rst<='1';
  wait for 30 ns;
  
  A<="1011"; B<="0110"; C<='1'; EM<='0'; rst<='0';
  wait for 160 ns;
  
  wait;
  
  end process;
  
  end architecture lfsr_fa_mux_tb_arc;