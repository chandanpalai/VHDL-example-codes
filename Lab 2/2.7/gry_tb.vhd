library ieee;
use ieee.std_logic_1164.all;

entity gry_tb is
  
end entity gry_tb;

architecture gry_tb_arc of gry_tb is

  component gry is

     port (
    A : in  std_logic_vector(2 downto 0);   -- input
    B : in  std_logic_vector(2 downto 0);   -- input
    Y : out std_logic);                     -- output
     
  end component gry;

  signal A,B : std_logic_vector(2 downto 0);
  signal Y : std_logic;
  
begin  -- architecture gry_tb_arc

u0 : gry port map (
  A => A,
  B => B,
  Y => Y);
process
  begin
    
  A<="001";B<="100";
  wait for 10 ns;

   A<="001";B<="110";
  wait for 10 ns;

   A<="001";B<="001";
  wait for 10 ns;

   A<="001";B<="011";
  wait for 10 ns;

   A<="110";B<="111";
  wait for 10 ns;

   A<="001";B<="010";
  wait for 10 ns;

   A<="101";B<="111";
  wait for 10 ns;

   A<="110";B<="100";
  wait for 10 ns;

   A<="000";B<="000";
  wait for 10 ns;

   A<="111";B<="111";
  wait for 10 ns;
wait;
end process;
end architecture gry_tb_arc;
