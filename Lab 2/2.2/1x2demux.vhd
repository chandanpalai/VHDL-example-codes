library ieee;
use ieee.std_logic_1164.all;

entity demux1x2 is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    D : out std_logic_vector(0 to 1));  -- output

end entity demux1x2;

architecture demux1x2_arc of demux1x2 is

begin  -- architecture demux1x2_arc

  D(0)<= (A and (not B));
  D(1)<= (A and B);

end architecture demux1x2_arc;
