library ieee;
use ieee.std_logic_1164.all;

entity my_2x1 is
  
  port (
    A : in  std_logic_vector(4 downto 0);                  -- input
    B : in  std_logic_vector(4 downto 0);                  -- input
    C : in  std_logic;                                     -- input
    D : out std_logic_vector(4 downto 0));                 -- output

end entity my_2x1;

architecture arc2x1 of my_2x1 is

begin  -- architecture 2x1arc

 D <=A when C='1' else
	 B;

end architecture arc2x1;
