library ieee;
use ieee.std_logic_1164.all;

entity encoder is
  
  port (
    I : in  std_logic_vector(7 downto 0);   -- input
    Y : out std_logic_vector(2 downto 0);  -- output
valid : out  std_logic );
end entity encoder;

architecture enc_arc of encoder is
signal a,b,c : std_logic;
begin  -- architecture enc_arc

   a<=((not I(7)) and (not I(6)) and (not I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and ( I(1)) and (not I(0))) or
      ((not I(7)) and (not I(6)) and (not I(5)) and (not I(4)) and ( I(3))
        and (not I(2)) and (not I(1)) and (not I(0))) or
       ((not I(7)) and (not I(6)) and ( I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0))) or
       (( I(7)) and (not I(6)) and (not I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0))) ;
   b<=((not I(7)) and (not I(6)) and (not I(5)) and (not I(4)) and (not I(3))
        and (I(2)) and (not I(1)) and (not I(0))) or
        ((not I(7)) and (not I(6)) and (not I(5)) and (I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0))) or
        ((not I(7)) and (I(6)) and (not I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0))) or
        (I(7) and (not I(6)) and (not I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0)));
    c<=((not I(7)) and (not I(6)) and (not I(5)) and (I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0))) or
        ((not I(7)) and (not I(6)) and (I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0))) or
        ((not I(7)) and (I(6)) and (not I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0))) or
        ((I(7)) and (not I(6)) and (not I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and (not I(1)) and (not I(0)));
      Y(0)<=a;
      Y(1)<=b;
      Y(2)<=c;
  valid<= (a or b or c) or ((not I(7)) and (not I(6)) and (not I(5)) and (not I(4)) and (not I(3))
        and (not I(2)) and  (not I(1)) and I(0));   

end architecture enc_arc;
