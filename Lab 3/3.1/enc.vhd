library ieee;
use ieee.std_logic_1164.all;

entity penc is
  
  port (
    I : in  std_logic_vector(7 downto 0);   -- input
    Y : out std_logic_vector(2 downto 0));  -- output

end entity penc;

architecture penc_arc of penc is

begin  -- architecture penc_arc

  Y<= "000" when I(0)='1' else
      "001" when I(1)='1' else
      "010" when I(2)='1' else
      "011" when I(3)='1' else
      "100" when I(4)='1' else
      "101" when I(5)='1' else
      "110" when I(6)='1' else
      "111" when I(7)='1'; 
      
      

end architecture penc_arc;
