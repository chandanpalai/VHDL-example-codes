library ieee;
use ieee.std_logic_1164.all;

entity mux_test is
  
end entity mux_test;

architecture mux_arch of mux_test is

component mux_4_1 
  
  port (
    I  : in  std_logic_vector(3 downto 0);
    s  : in  std_logic_vector(1 downto 0);
    Y  : out std_logic);

end component;

signal I : std_logic_vector(3 downto 0);
signal s : std_logic_vector(1 downto 0);
signal Y : std_logic;
begin  -- architecture mux_arch

 u0:mux_4_1 port map (I,S,Y);

 process
   begin
     I<="0110";s<="10";
     wait for 10 ns;
     I<="1001";s<="00";
     wait for 10 ns;
      I<="0101";s<="01";
     wait for 10 ns;
      I<="0111";s<="10";
     wait for 10 ns;
      I<="1110";s<="11";
     wait for 10 ns;
      I<="0011";s<="11";
     wait for 10 ns;
      I<="1001";s<="01";
     wait for 10 ns;
      I<="0110";s<="10";
     wait for 10 ns;
     wait;
   end process;
end architecture mux_arch;
