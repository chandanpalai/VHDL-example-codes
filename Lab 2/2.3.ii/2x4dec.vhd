library ieee;
use ieee.std_logic_1164.all;

entity dec2x4 is
  
  port (
    A  : in  std_logic;                  -- input
    B  : in  std_logic;                  -- input
    En : in  std_logic;                  -- input
    Y  : out std_logic_vector(0 to 3));  -- output

end entity dec2x4;

architecture dec2x4_arc of dec2x4 is

begin  -- architecture dec2x4_arc

  Y(0)<=(not A) and (not B) and En;
  Y(1)<=(not A) and B and En;
  Y(2)<=A and (not B) and En;
  Y(3)<=A and B and En;

end architecture dec2x4_arc;
