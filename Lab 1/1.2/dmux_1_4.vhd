library ieee;
use ieee.std_logic_1164.all;

entity dmux_4_1 is
  
  port (
    A         : in  std_logic;          -- input
    S         : in  std_logic_vector (1 downto 0) ;          -- input
    Y         : out std_logic_vector (3 downto 0)          -- output
     );

end entity dmux_4_1;

architecture dmux_arch of dmux_4_1 is

begin  -- architecture dmux_arch

  Y(0)<=(A and (not S(1))) and (not S(0));
  Y(1)<= A and (not S(1)) and S(0);
  Y(2)<= A and S(1) and (not S(0));
  Y(3)<= A and S(1) and S(0);

end architecture dmux_arch;
