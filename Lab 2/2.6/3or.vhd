library ieee;
use ieee.std_logic_1164.all;

entity my_or is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);   

end entity my_or;

architecture or_arch of my_or is

begin  -- architecture 3orarch

  Y<= A or B;

end architecture or_arch;
