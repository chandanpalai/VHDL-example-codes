library ieee;
use ieee.std_logic_1164.all;

entity multi_tb is
generic (
    m : integer := 4);
end entity multi_tb;

architecture multi_tb_arc of multi_tb is

component multi is

generic (
    m : integer := 4);
  
  port (
    A     : in  std_logic_vector(m-1 downto 0);                           -- input
    B     : in  std_logic_vector(m-1 downto 0);                           -- input
    Y     : out std_logic_vector((2*m)-1 downto 0)                      -- output
  );
    
end component multi;

signal A,B : std_logic_vector(m-1 downto 0);
signal  Y : std_logic_vector((2*m)-1 downto 0);

begin

u0 : multi port map(
	A => A,
	B => B,
	Y => Y);
	
process
  begin
  
  A<="1011"; B<="1001";
  wait for 10 ns;
  
  A<="0010"; B<="0110";
  wait for 10 ns;
  
  A<="1010"; B<="1100";
  wait for 10 ns;
  
  A<="1110"; B<="0111";
  wait for 10 ns;
  
  A<="0110"; B<="0010";
  wait for 10 ns;
  
  A<="0011"; B<="1101";
  wait for 10 ns;
  
  A<="1010"; B<="0101";
  wait for 10 ns;
  
  wait;
  
end process;

end architecture multi_tb_arc;  