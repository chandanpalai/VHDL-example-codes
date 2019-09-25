library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
  
  port (
    I : in  std_logic_vector(3 downto 0);
    S : in  std_logic_vector(1 downto 0);-- input
    Y : out std_logic);                 -- output

end entity mux4;

architecture muxarc of mux4 is
component my_2x1 is
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    C : in  std_logic;                  -- input
    D : out std_logic);                 -- output
end component my_2x1;
signal X1,X2 : std_logic;
begin  -- architecture muxarc
u0 : my_2x1 port map (
  A => I(0),
  B => I(1),
  C => S(0),
  D => X1);

  u1 : my_2x1 port map (
  A => I(2),
  B => I(3),
  C => S(0),
  D => X2);

  u2 : my_2x1 port map (
  A => X1,
  B => X2,
  C => S(1),
  D => Y);

end architecture muxarc;
