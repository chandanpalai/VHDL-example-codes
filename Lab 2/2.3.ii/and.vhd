library IEEE;
use IEEE.std_logic_1164.all;

entity my_and is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end entity my_and;

architecture and3arch of my_and is

begin  -- architecture and3arch

  Y<= A and B;

end architecture and3arch;