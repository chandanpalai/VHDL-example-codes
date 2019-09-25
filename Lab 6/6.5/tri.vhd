library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity tri is
  
  port (
    I  : in  std_logic_vector(m-1 downto 0);                 -- input
    En : in  std_logic;                                      -- input
    Y  : out std_logic_vector(m-1 downto 0));                -- output

end entity tri;

architecture tri_arc of tri is

begin  -- architecture tri_arc

  Y<= I when En='0' else
      (others=>'Z');

end architecture tri_arc;
