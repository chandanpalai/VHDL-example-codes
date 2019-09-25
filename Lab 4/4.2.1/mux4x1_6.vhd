library ieee;
use ieee.std_logic_1164.all;

entity tri6 is
  
  port (
    I : in  std_logic_vector(3 downto 0);  -- input
    S : in  std_logic_vector(1 downto 0);  -- input
    Y : out std_logic);                    -- output

end entity tri6;

architecture tri6_arc of tri6 is

  component tri is
    
     port (
    I  : in  std_logic;                 -- input
    En : in  std_logic;                 -- input
    Y  : out std_logic);                -- output

  end component tri;
signal a,b : std_logic;
 signal temp : std_logic_vector(1 downto 0);
begin  -- architecture tri6_arc
  a<= (not S(0));
  b<= (not S(1));
  u0 : tri port map (
    I  => I(0),
    En => a,
    Y  => temp(0));

     u1 : tri port map (
    I  => I(1),
    En => S(0),
    Y  => temp(0));

   u2 : tri port map (
    I  => I(2),
    En => a,
    Y  => temp(1));

   u3 : tri port map (
    I  => I(3),
    En => S(0),
    Y  => temp(1));

   u4 : tri port map (
    I  => temp(0),
    En => b,
    Y  => Y);

   u5 : tri port map (
    I  => temp(1),
    En => S(1),
    Y  => Y);

end architecture tri6_arc;
