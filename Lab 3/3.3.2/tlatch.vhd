library ieee;
use ieee.std_logic_1164.all;

entity tlatch is
  generic ( de: time := 3ns);
    port (
    T  : in  std_logic;                 -- input
    En : in  std_logic;                 -- input
    Q  : out std_logic);                -- output
end entity tlatch;

architecture tlatch_arc of tlatch is

 
  signal s : std_logic :='0';

begin  -- architecture tlatch_arc
    
    s <=  s after de when En='0' else
          (not s) after de when T='1' and En='1' else
          s after de;
    Q<=s;

end architecture tlatch_arc;