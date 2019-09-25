library ieee;
use ieee.std_logic_1164.all;

entity habl is
  
  port (
    A     : in  std_logic;              -- input
    B     : in  std_logic;              -- input
    Carry : out std_logic;              -- output
    Sum   : out std_logic);             -- output

end entity habl;

architecture habl_arc of habl is

  component my_xor is
    port (
      A : in  std_logic;                -- input
      B : in  std_logic;                -- input
      Y : out std_logic);               -- output
  end component my_xor;

   component my_and is
    port (
      A : in  std_logic;                -- input
      B : in  std_logic;                -- input
      Y : out std_logic);               -- output
  end component my_and;
  
begin  -- architecture habl_arc

  u0 : my_xor port map (
  A => A,
  B => B,
  Y => Sum);

  u1 : my_and port map (
    A => A,
    B => B,
    Y => Carry);

end architecture habl_arc;
