library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
  
end entity mux_tb;

architecture mux_tb_arc of mux_tb is
component mux4 is

  port (
    I : in  std_logic_vector(3 downto 0);
    S : in  std_logic_vector(1 downto 0);-- input
    Y : out std_logic);                 -- output

end component mux4;
  signal I : std_logic_vector(3 downto 0);
  signal S : std_logic_vector(1 downto 0);-- input
  signal Y : std_logic;                 -- output
begin  -- architecture mux_tb_arc

  u0 : mux4 port map (
    I(0) => I(0),
    I(1) => I(1),
    I(2) => I(2),
    I(3) => I(3),
    S(0) => S(0),
    S(1) => S(1),
    Y    => Y);

  process
    begin

      I<="0001";S<="00";
      wait for 10 ns;

      I<="0010";S<="01";
      wait for 10 ns;

      I<="0100";S<="10";
      wait for 10 ns;

      I<="1000";S<="11";
      wait for 10 ns;
      
      I<="1011";S<="00";
      wait for 10 ns;
      
      I<="0000";S<="00";
      wait for 10 ns;
      
      I<="0001";S<="01";
      wait for 10 ns;
      
      I<="1010";S<="10";
      wait for 10 ns;
      
      I<="0010";S<="01";
      wait for 10 ns;


    wait;
    end process;
    
                    
  

end architecture mux_tb_arc;
