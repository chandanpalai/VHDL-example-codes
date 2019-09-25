library ieee;
use ieee.std_logic_1164.all;

entity dmux1x4 is
  
  port (
    I : in  std_logic;                     -- input
    S : in  std_logic_vector(1 downto 0);  -- input
    Y : out std_logic_vector(0 to 3));     -- output

end entity dmux1x4;

architecture dmux1x4_aec of dmux1x4 is

  component demux1x2 is

    port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    D : out std_logic_vector(0 to 1));  -- output

  end component demux1x2;
  
  signal X0,X1: std_logic;
begin  -- architecture dmux1x4_aec

  u0 : demux1x2 port map (
    A    => I,
    B    => S(1),
    D(0) => X0,
    D(1) => X1);

  u1 : demux1x2 port map (
    A    => X0,
    B    => S(0),
    D(0) => Y(0),
    D(1) => Y(1));

  u2 : demux1x2 port map (
    A    => X1,
    B    => S(0),
    D(0) => Y(2),
    D(1) => Y(3));
    
  

end architecture dmux1x4_aec;
