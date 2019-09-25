library ieee;
use ieee.std_logic_1164.all;

entity bcd is
  
  port (
    I                   : in  std_logic_vector(3 downto 0);  -- input
    a, b, c, d, e, f, g : out std_logic);                    -- output
    

end entity bcd;

architecture bcd_arch of bcd is

begin  -- architecture bcd_arch

  a<=((not I(2)) and (not I(1)) and (not I(0))) or ((not I(3)) and I(1)) or ( I(3) and (not I(2)) and (not I(1))) or ((not I(3)) and I(2) and I(0));
  b<=((not I(3)) and (not I(2))) or (I(3) and (not I(2)) and (not I(1))) or ((not I(3)) and (not I(1)) and (not I(0))) or ((not I(3)) and I(1) and I(0));
  c<=((not I(3)) and (not I(1))) or ((not I(3)) and I(1) and I(0)) or (I(3) and(not I(2)) and (not I(1))) or ((not I(3)) and I(2) and I(1)); 
  d<=((not I(2)) and (not I(1)) and(not I(0))) or ((not I(3)) and (not I(2)) and I(1)) or ((not I(3)) and I(1) and (not I(0))) or (I(3) and (not I(2)) and (not I(1))) or ((not I(3)) and I(2) and (not I(1)) and I(0)); 
  e<=((not I(2)) and (not I(1)) and (not I(0))) or ((not I(3)) and I(1) and(not I(0)));
  f<=((not I(3)) and (not I(1)) and (not I(0))) or ((not I(3)) and I(2) and (not I(1))) or ((not I(3)) and I(2) and (not I(0))) or (I(3) and (not I(2)) and (not I(1))); 
  g<=((not I(3)) and (not I(2)) and I(1)) or ((not I(3)) and I(2) and (not I(1))) or ((not I(3)) and I(1) and (not I(0))) or (I(3) and (not I(2)) and (not I(1)));
  

end architecture bcd_arch;
