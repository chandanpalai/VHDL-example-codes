library ieee;
use ieee.std_logic_1164.all;

entity my_2x1 is
  
  port (
    I : in  std_logic_vector(1 downto 0);                  -- input
    S : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end entity my_2x1;

architecture arc2x1 of my_2x1 is

begin  -- architecture 2x1arc

  Y<= (I(0) and (not S)) or (I(1) and S);

end architecture arc2x1;
