library ieee;
use ieee.std_logic_1164.all;

entity decoder is
  
  port (
    I : in  std_logic_vector(2 downto 0);   -- input
    E : in  std_logic ;
    Y : out std_logic_vector(0 to 7));  -- output
   
end entity decoder;

architecture dec_arch of decoder is

begin  -- architecture dec_arch

   Y(0)<= E and ((not I(2)) and (not I(1)) and (not I(0)));
   Y(1)<= E and ((not I(2)) and (not I(1)) and ( I(0)));
   Y(2)<= E and ((not I(2)) and ( I(1)) and (not I(0)));
   Y(3)<= E and ((not I(2)) and ( I(1)) and ( I(0)));
   Y(4)<= E and ((I(2)) and (not I(1)) and (not I(0)));
   Y(5)<= E and ((I(2)) and ( not I(1)) and (I(0)));
   Y(6)<= E and ((I(2)) and ( I(1)) and (not I(0)));
   Y(7)<= E and ((I(2)) and ( I(1)) and ( I(0)))  ;
end architecture dec_arch;
