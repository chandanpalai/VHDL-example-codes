library ieee;
use ieee.std_logic_1164.all;

entity dec2x4_tb is
  
end entity dec2x4_tb;

architecture dec2x4_tb_arc of dec2x4_tb is

  component dec2x4 

    port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    En: in  std_logic;                  -- input
    Y : out std_logic_vector(0 to 3));  -- output
    
  end component ;
  
  signal A,B,En: std_logic;
  signal Y : std_logic_vector(0 to 3);
begin  -- architecture dec2x4_tb_arc

  u0 : dec2x4 port map (
    A  => A,
    B  => B,
    En => En,
    Y  => Y);
  process
    begin

      A<='0';B<='0';En<='1';
      wait for 10 ns;

       A<='1';B<='1';En<='1';
      wait for 10 ns;

       A<='1';B<='1';En<='0';
      wait for 10 ns;

       A<='1';B<='0';En<='1';
      wait for 10 ns;

       A<='0';B<='1';En<='1';
      wait for 10 ns;

       A<='0';B<='0';En<='1';
      wait for 10 ns;

       A<='0';B<='0';En<='0';
      wait for 10 ns;

      wait;
    end process;
      
end architecture dec2x4_tb_arc;
