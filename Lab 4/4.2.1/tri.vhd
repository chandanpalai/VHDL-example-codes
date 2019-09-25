library ieee;
use ieee.std_logic_1164.all;

entity tri is
  
  port (
    I  : in  std_logic;                 -- input
    En : in  std_logic;                 -- input
    Y  : out std_logic);                -- output

end entity tri;

architecture tri_arc of tri is

begin  -- architecture tri_arc

  Y<= I when En='1' else
      'Z';

end architecture tri_arc;
