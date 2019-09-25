library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  
  port (
    A     : in  std_logic;              -- input
    B     : in  std_logic;              -- input
    sum   : out std_logic;              -- output
    carry : out std_logic);             -- output

end entity half_adder;

architecture ha_arch of half_adder is

begin  -- architecture ha_arch

  sum<= A xor B;
  carry<= A and B;

end architecture ha_arch;
