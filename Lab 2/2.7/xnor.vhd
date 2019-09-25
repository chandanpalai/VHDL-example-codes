library ieee;
use ieee.std_logic_1164.all;

entity my_xnor is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end entity my_xnor;

architecture xnor_arc of my_xnor is

begin  -- architecture xnor_arc

  Y<= A xnor B;

end architecture xnor_arc;
