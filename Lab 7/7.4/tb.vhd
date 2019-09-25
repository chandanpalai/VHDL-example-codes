library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.lu_au.all;

entity tb is
end entity tb;

architecture tb_arc of tb is

component alu is 

 port(
        A     : in  std_logic_vector(3 downto 0);
        B     : in  std_logic_vector(3 downto 0);
        Cin   : in  std_logic;
        rst   : in  std_logic;
        Sle   : in  std_logic_vector(3 downto 0);
        Y     : out std_logic_vector(4 downto 0)
        );

end component alu;

signal A : std_logic_vector(3 downto 0);
signal B : std_logic_vector(3 downto 0);
signal Cin : std_logic;
signal rst : std_logic;
signal Sle : std_logic_vector(3 downto 0);
signal Y : std_logic_vector(4 downto 0);

begin
  
  u0 : ALU port map(A=>A,B=>B,Cin=>Cin,rst=>rst,Sle=>Sle,Y=>Y);
  
  process
  begin
  
  A<="0110";B<="1010";Cin<='1';Sle<="0101";rst<='1';
  wait for 10 ns;
  
  A<="0110";B<="1010";Cin<='1';Sle<="0001";rst<='0';
  wait for 10 ns;
  
  A<="0111";B<="1100";Cin<='1';Sle<="0110";rst<='0';
  wait for 10 ns;
  
  A<="0100";B<="1110";Cin<='1';Sle<="1101";rst<='0';
  wait for 10 ns;
  
  A<="1110";B<="1011";Cin<='0';Sle<="1100";rst<='0';
  wait for 10 ns;
  
  A<="1100";B<="0100";Cin<='0';Sle<="0111";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="1010";Cin<='1';Sle<="1111";rst<='0';
  wait for 10 ns;
  
  A<="0111";B<="1110";Cin<='1';Sle<="1110";rst<='0';
  wait for 10 ns;
  
  A<="0100";B<="0110";Cin<='0';Sle<="0100";rst<='0';
  wait for 10 ns;
  
  A<="1110";B<="1011";Cin<='0';Sle<="0110";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="1010";Cin<='1';Sle<="0101";rst<='0';
  wait for 10 ns;
  
  A<="1000";B<="1110";Cin<='1';Sle<="1101";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="1010";Cin<='1';Sle<="1001";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="0010";Cin<='1';Sle<="1011";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="1110";Cin<='1';Sle<="1010";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="1010";Cin<='1';Sle<="1100";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="1010";Cin<='0';Sle<="0011";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="1110";Cin<='0';Sle<="0010";rst<='0';
  wait for 10 ns;
  
  A<="0110";B<="1010";Cin<='1';Sle<="0000";rst<='1';
  wait for 10 ns;
  
  wait;
  
  end process;
  
  end architecture tb_arc;