library ieee;
use ieee.std_logic_1164.all;

entity faha is
  
  port (
    A     : in  std_logic;              -- input
    B     : in  std_logic;              -- input
    Cin   : in  std_logic;              -- input
    Carry : out std_logic;              -- output
    Sum   : out std_logic);             -- output

end entity faha;

architecture faha of faha is

  component habl is

     port (
    A     : in  std_logic;              -- input
    B     : in  std_logic;              -- input
    Carry : out std_logic;              -- output
    Sum   : out std_logic);             -- output
     
  end component habl;

  component my_or is

    port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);
    
  end component my_or;
  
 signal temp,i,j : std_logic;
 
begin  -- architecture faha

  u0 : habl port map (
    A     => B,
    B     => Cin,
    Sum   => temp,
    Carry => j);

    u1 : habl port map (
      A     => A,
      B     => temp,
      Sum   => Sum,
      Carry => i);

    u2 : my_or port map (
      A => i,
      B => j,
      Y => Carry);

end architecture faha;
