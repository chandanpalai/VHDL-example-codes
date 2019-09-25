library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  
  port (
    A     : in  std_logic;              -- input
    B     : in  std_logic;              -- input
    C     : in  std_logic;              -- input
    sum   : out std_logic;              -- output
    carry : out std_logic);             -- output

end entity full_adder;

architecture fa_arch of full_adder is

begin  -- architecture ha_arch

  sum<= A xor B xor C;
  carry<= (A and B) or (A and C) or (B and C);

end architecture fa_arch;
