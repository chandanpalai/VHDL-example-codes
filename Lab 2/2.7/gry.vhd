library ieee;
use ieee.std_logic_1164.all;

entity gry is
  
  port (
    A : in  std_logic_vector(2 downto 0);   -- input
    B : in  std_logic_vector(2 downto 0);   -- input
    Y : out std_logic);                     -- output

end entity gry;

architecture gry_arc of gry is

  component my_xnor is

    port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

  end component my_xnor;

  component my_xor is
    
     port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output
     
  end component my_xor;
  
  component my_or is

     port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    C : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

  end component my_or;

  component my_3ands is
     
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    C : in  std_logic;                  -- input
    Y : out std_logic);                 -- output


  end component my_3ands;
  
  signal temp : std_logic_vector(0 to 8);
                                 
begin  -- architecture gry_arc

  u0 : my_xnor port map (
    A    => A(2),
    B    => B(2),
    Y    => temp(0));

  u1 : my_xnor port map (
    A    => A(1),
    B    => B(1),
    Y    => temp(1));

  u2 : my_xnor port map (
    A    => A(0),
    B    => B(0),
    Y    => temp(2));

  u3 : my_xor port map (
    A => A(2),
    B => B(2),
    Y => temp(3));

  u4 : my_xor port map (
    A => A(1),
    B => B(1),
    Y => temp(4));

  u5 : my_xor port map (
    A => A(0),
    B => B(0),
    Y => temp(5));
  
  u6 : my_3ands port map (
    A => temp(0),
    B => temp(1),
    C => temp(5),
    Y => temp(6));

  u7 : my_3ands port map (
    A => temp(0),
    B => temp(4),
    C => temp(2),
    Y => temp(7));

  u8 : my_3ands port map (
    A => temp(3),
    B => temp(1),
    C => temp(2),
    Y => temp(8));
  
  u9 : my_or port map (
    A => temp(6),
    B => temp(7),
    C => temp(8),
    Y => Y);
  
end architecture gry_arc;
