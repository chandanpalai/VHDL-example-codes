library ieee;
use ieee.std_logic_1164.all;

entity faha_tb is
end entity faha_tb;

architecture faha_tb_arc of faha_tb is

  component faha is

      port (
    A     : in  std_logic;              -- input
    B     : in  std_logic;              -- input
    Cin   : in  std_logic;              -- input
    Carry : out std_logic;              -- output
    Sum   : out std_logic);             -- output
      
  end component faha;

  signal A,B,Cin,Sum,Carry : std_logic;
  
begin  -- architecture faha_tb_arc

  u0 : faha port map (
    A  => A,
    B  => B,
    Cin  => Cin,
    Carry => Carry,
    Sum  => Sum);
  process
    begin

      A<='0';B<='0';Cin<='0';
      wait for 10 ns;

      A<='1';B<='0';Cin<='0';
      wait for 10 ns;

      A<='0';B<='1';Cin<='0';
      wait for 10 ns;

      A<='0';B<='1';Cin<='1';
      wait for 10 ns;

      A<='1';B<='1';Cin<='1';
      wait for 10 ns;

      A<='1';B<='1';Cin<='0';
      wait for 10 ns;

      A<='1';B<='0';Cin<='0';
      wait for 10 ns;

      A<='1';B<='0';Cin<='1';
      wait for 10 ns;

      A<='1';B<='1';Cin<='0';
      wait for 10 ns;

      wait;

    end process;

end architecture faha_tb_arc;
