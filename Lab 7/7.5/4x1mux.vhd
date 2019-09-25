library ieee;
use ieee.std_logic_1164.all;

entity my_4x1 is
  
  port (
    I : in  std_logic_vector(3 downto 0);                  -- input
    S : in  std_logic_vector(1 downto 0);                  -- input
    Y : out std_logic);                 -- output

end entity my_4x1;

architecture mux4x1_arc of my_4x1 is

begin  -- architecture 2x1arc

  Y<= (I(0) and (not S(0)) and (not S(1))) or (I(1) and (S(0)) and (not S(1))) or (I(2) and (not S(0)) and S(1)) or (I(3) and S(0) and S(1));

end architecture mux4x1_arc;
