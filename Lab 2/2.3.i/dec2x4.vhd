library ieee;
use ieee.std_logic_1164.all;

entity dec2x4 is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    En: in  std_logic;                  -- input
    Y : out std_logic_vector(0 to 3));  -- output

end entity dec2x4;

architecture dec2x4_arc of dec2x4 is

  component my_3ands is
    port (
      A : in  std_logic;                -- input
      B : in  std_logic;                -- input
      C : in  std_logic;                -- input
      Y : out std_logic);
  end component my_3ands;

   component my_not is
    port (
      A : in  std_logic;                -- input
      Y : out std_logic);
  end component my_not;

signal temp1,temp2 : std_logic;  
begin  -- architecture dec2x4_arc

  u0 : my_not port map (
    A => A,
    Y => temp1);

  u1 : my_not port map (
    A => B,
    Y => temp2);

  u2: my_3ands port map (
    A => temp1,
    B => temp2,
    C => En,
    Y => Y(0));

   u3: my_3ands port map (
    A => temp1,
    B => B,
    C => En,
    Y => Y(1));

   u4: my_3ands port map (
    A => A,
    B => temp2,
    C => En,
    Y => Y(2));

   u5: my_3ands port map (
    A => A,
    B => B,
    C => En,
    Y => Y(3));

end architecture dec2x4_arc;
