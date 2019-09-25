library ieee;
use ieee.std_logic_1164.all;

entity my_2x1 is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    C : in  std_logic;                  -- input
    D : out std_logic);                 -- output

end entity my_2x1;

architecture arc2x1 of my_2x1 is

begin  -- architecture 2x1arc

  D<= (A and (not C)) or (B and C);

end architecture arc2x1;
