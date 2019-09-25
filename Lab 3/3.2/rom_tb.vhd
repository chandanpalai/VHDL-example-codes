library ieee;
use ieee.std_logic_1164.all;

entity rom_tb is
  
end entity rom_tb;

architecture rom_tb_arc of rom_tb is

  component rom is

     port (
    A  : in  std_logic;                     -- input
    B  : in  std_logic;                     -- input
    C  : in  std_logic;                     -- input 
    F1 : out std_logic;                     -- output
    F2 : out std_logic;                     -- output
    F3 : out std_logic;                     -- output
    F4 : out std_logic);                    -- output
     
  end component rom;

  signal A,B,C,F1,F2,F3,F4 : std_logic;
  
begin  -- architecture rom_tb_arc

  u0 : rom port map (
    A  => A,
    B  => B,
    C  => C,
    F1 => F1,
    F2 => F2,
    F3 => F3,
    F4 => F4);

   process
     begin

       A<='0';B<='0';C<='0';
       wait for 10 ns;

        A<='0';B<='1';C<='0';
       wait for 10 ns;

        A<='1';B<='0';C<='0';
       wait for 10 ns;

        A<='0';B<='1';C<='1';
       wait for 10 ns;

        A<='0';B<='0';C<='1';
       wait for 10 ns;

        A<='1';B<='1';C<='0';
       wait for 10 ns;

        A<='1';B<='1';C<='1';
       wait for 10 ns;

        A<='1';B<='0';C<='1';
       wait for 10 ns;

        A<='0';B<='0';C<='0';
       wait for 10 ns;
              
  wait;
     end process;
     
end architecture rom_tb_arc;
