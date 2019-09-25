library ieee;
use ieee.std_logic_1164.all;

entity my_not is
  
  port (
    A : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end entity my_not;

architecture not_arc of my_not is

begin  -- architecture not_arc

  Y<=not A;

end architecture not_arc;
