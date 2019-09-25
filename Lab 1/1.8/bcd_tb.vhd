library ieee;
use ieee.std_logic_1164.all;

entity bcd_tb is
  
end entity bcd_tb;

architecture bcd_tb_arc of bcd_tb is

  component bcd is
     port (
    I                   : in  std_logic_vector(3 downto 0);  -- input
    a, b, c, d, e, f, g : out std_logic);                    -- output
  end component bcd;

  signal  I: std_logic_vector(3 downto 0);
  signal a, b, c, d, e, f, g : std_logic;
begin  -- architecture bcd_tb_arc

  
    u0 : bcd port map (
      I => I,
      a => a,
      b => b,
      c => c,
      d => d,
      e => e,
      f => f,
      g => g);
      
      process 
  begin 


      I<="0001";
    wait for 10 ns;

    I<="1001";
    wait for 10 ns;

    I<="0011";
    wait for 10 ns;

    I<="1101";
    wait for 10 ns;

    I<="0101";
    wait for 10 ns;

    I<="0110";
    wait for 10 ns;

    I<="1111";
    wait for 10 ns;

    I<="1101";
    wait for 10 ns;

    I<="1100";
    wait for 10 ns;
wait;

  end process;

end architecture bcd_tb_arc;
