library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package abc is
constant m :integer :=8;
constant n :integer :=2;
type size is array (natural range <>) of std_logic_vector(m-1 downto 0);
end package;

package body abc is

end abc;