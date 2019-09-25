library IEEE;
use IEEE.std_logic_1164.all;

entity my_3ands is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    C : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end entity my_3ands;

architecture and3arch of my_3ands is

begin  -- architecture and3arch

  Y<= A and B and C;

end architecture and3arch;
