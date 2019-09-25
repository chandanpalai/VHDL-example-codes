library ieee;
use ieee.std_logic_1164.all;

entity and_b is

  port (
    A : in  std_logic;                       --input
    B : in  std_logic;                       --input
    Y : out std_logic);                      --output

end entity and_b;

architecture and_b_arc of and_b is

begin  -- architecture and_b_arc

  Y <= A and (not B);

end architecture and_b_arc;
