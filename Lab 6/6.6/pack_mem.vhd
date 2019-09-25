library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package abc is
constant m :integer :=3;                         --this will be used for no. of bits for i/p and o/p
constant n :integer :=3;                         --this will be used for write and read address ((2**n-1) downto 0)
type size is array (natural range <>) of std_logic_vector(m-1 downto 0);
end package;

package body abc is

end abc;