library ieee;
use ieee.std_logic_1164.all;

entity my_and is

  port (
    A : in  std_logic;                       --input
    B : in  std_logic;                       --input
    Y : out std_logic);                      --output

end entity my_and;

architecture my_and_arc of my_and is

begin  -- architecture and_b_arc

  Y <= A and B;

end architecture my_and_arc;
