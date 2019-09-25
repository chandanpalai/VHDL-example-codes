library ieee;
use ieee.std_logic_1164.all;

entity dmux_tb is
  
end entity dmux_tb;

architecture dmux_tb_arc of dmux_tb is
component dmux1x4 is
port (
    I : in  std_logic;                     -- input
    S : in  std_logic_vector(1 downto 0);  -- input
    Y : out std_logic_vector(0 to 3));     -- output

end component dmux1x4;

signal  I : std_logic;                     -- input
signal  S : std_logic_vector(1 downto 0);  -- input
signal  Y : std_logic_vector(0 to 3);      -- output
begin  -- architecture dmux_tb_arc

  u0 : dmux1x4 port map (
    I    => I,
    S    => S,
    Y    => Y );

  process
    begin

      I<='1';S<="01";
      wait for 10 ns;

      I<='0';S<="11";
      wait for 10 ns;

      I<='1';S<="10";
      wait for 10 ns;

      I<='0';S<="00";
      wait for 10 ns;

      I<='1';S<="11";
      wait for 10 ns;

      I<='1';S<="01";
      wait for 10 ns;
      
      I<='0';S<="11";
      wait for 10 ns;
      
      I<='1';S<="11";
      wait for 10 ns;
      
      I<='1';S<="10";
      wait for 10 ns;
      
      I<='0';S<="00";
      wait for 10 ns;

      wait;
    end process;
    
end architecture dmux_tb_arc;
