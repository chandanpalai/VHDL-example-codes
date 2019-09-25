library ieee;
use ieee.std_logic_1164.all;


entity demux_test is
  
end entity demux_test;

architecture demux_arch of demux_test is
component dmux_4_1 
  
  port (
    A  : in  std_logic;
    S  : in  std_logic_vector (1 downto 0) ;          -- input
    Y  : out std_logic_vector (3 downto 0));          -- output               

end component;

signal A : std_logic;
signal S : std_logic_vector(1 downto 0);
signal Y : std_logic_vector (3 downto 0);         

begin  -- architecture demux_arch

u0:dmux_4_1 port map (A,S,Y);

 process
 begin
       S<="10";A<='1';
   wait for 10 ns;
        S<="11";A<='0';
   wait for 10 ns;
        S<="00";A<='0';
   wait for 10 ns;
        S<="01";A<='1';
   wait for 10 ns;
        S<="11";A<='1';
   wait for 10 ns;
        S<="00";A<='1';
   wait for 10 ns;
        S<="01";A<='1';
   wait for 10 ns;
     
wait;
end process;
end architecture demux_arch;
