library ieee;
use ieee.std_logic_1164.all;

entity mc is
  
  port (
    A : in  std_logic_vector(1 downto 0);  -- input
    B : in  std_logic_vector(1 downto 0);  -- input
    AequalB : out std_logic;                     -- A=B
    AlessthanB : out std_logic;                     -- A<B
    AmorethanB : out std_logic);                    -- A>B

end entity mc;

architecture mc_arc of mc is

  component my_xnor is

    port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

  end component my_xnor;

  component my_or is

     port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

  end component my_or;

  component my_3ands is
     
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output
  
  end component my_3ands;

  component my_not is

    port (
    A : in  std_logic;                  -- input
    Y : out std_logic);                -- output
    
  end component my_not;

  signal temp : std_logic_vector(0 to 11);
  
begin  -- architecture mc_arc
  
  u0 : my_not port map (
    A => A(0),
    Y => temp(0));

   u1 : my_not port map (
    A => A(1),
    Y => temp(1));

   u2 : my_not port map (
    A => B(0),
    Y => temp(2));

   u3 : my_not port map (
    A => B(1),
    Y => temp(3));

  u4 : my_xnor port map (
    A => A(1),
    B => B(1),
    Y => temp(4));

   u5 : my_xnor port map (
    A => A(0),
    B => B(0),
    Y => temp(5));
  
  u6 : my_3ands port map (
    A => temp(4),
    B => temp(5),
    Y => AequalB);

     u7 : my_3ands port map (
    A => temp(1),
    B => B(1),
    Y => temp(6));

     u8 : my_3ands port map (
    A => temp(0),
    B => B(0),
    Y => temp(7));

     u9 : my_3ands port map (
    A => temp(7),
    B => temp(4),
    Y => temp(8));
    
    u10 : my_or port map (
    A => temp(6),
    B => temp(8),
    Y => AlessthanB);

     u11 : my_3ands port map (
    A => A(1),
    B => temp(3),
    Y => temp(9));

   u12 : my_3ands port map (
    A => A(0),
    B => temp(2),
    Y => temp(10));

   u13 : my_3ands port map (
    A => temp(4),
    B => temp(10),
    Y => temp(11));

   u14 : my_or port map (
    A => temp(9),
    B => temp(11),
    Y => AmorethanB);
  
  

end architecture mc_arc;
