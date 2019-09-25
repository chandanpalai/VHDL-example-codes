library ieee;
use ieee.std_logic_1164.all;

entity dec3x8_tb is
  
end entity dec3x8_tb;

architecture dec3x8_tb_arc of dec3x8_tb is

  component dec3x8 is

    port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    C : in  std_logic;                  -- input
    En: in  std_logic;                  -- input
    Y : out std_logic_vector(0 to 7));  -- output
    
  end component dec3x8;

   signal A,B,C,En: std_logic;
  signal Y : std_logic_vector(0 to 7);
begin  -- architecture dec3x8_tb_arc

  u0 : dec3x8 port map (
    A  => A,
    B  => B,
    C  => C,
    En => En,
    Y  => Y);

  process
    begin

      A<='0';B<='0';C<='0';En<='1';
      wait for 10 ns;

       A<='1';B<='0';C<='1';En<='0';
      wait for 10 ns;

       A<='0';B<='1';C<='0';En<='1';
      wait for 10 ns;

       A<='1';B<='1';C<='0';En<='1';
      wait for 10 ns;

       A<='1';B<='1';C<='1';En<='1';
      wait for 10 ns;

       A<='1';B<='1';C<='1';En<='0';
      wait for 10 ns;
      
      A<='0';B<='1';C<='1';En<='1';
      wait for 10 ns;
      
      A<='0';B<='0';C<='1';En<='1';
      wait for 10 ns;
      
      A<='0';B<='0';C<='1';En<='0';
      wait for 10 ns;

      wait;

    end process;

end architecture dec3x8_tb_arc;
