library ieee;
use ieee.std_logic_1164.all;

entity my_xor is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end entity my_xor;

architecture xor_arc of my_xor is

begin  -- architecture 3xorarc

  Y<= A xor B;

end architecture xor_arc;
