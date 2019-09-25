library ieee;
use ieee.std_logic_1164.all;

entity habl_tb is
end entity habl_tb;

architecture habl_tb_arc of habl_tb is

  component habl is
      
  port (
    A     : in  std_logic;              -- input
    B     : in  std_logic;              -- input
    Carry : out std_logic;              -- output
    Sum   : out std_logic);             -- output

  end component habl;

  signal A,B,Sum,Carry : std_logic;
begin  -- architecture habl_tb_arc

u0 : habl port map (
    A  => A,
    B  => B,
    Carry => Carry,
    Sum  => Sum);
  process
    begin

      A<='0';B<='0';
      wait for 10 ns;

       A<='1';B<='0';
      wait for 10 ns;

       A<='0';B<='1';
      wait for 10 ns;

       A<='1';B<='1';
      wait for 10 ns;

       A<='0';B<='0';
      wait for 10 ns;

       A<='1';B<='0';
      wait for 10 ns;

       A<='1';B<='1';
      wait for 10 ns;

      wait;
    end process;
      
end architecture habl_tb_arc;
