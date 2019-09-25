library ieee;
use ieee.std_logic_1164.all;

entity dec3x8 is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    C : in  std_logic;                  -- input
    En: in  std_logic;                  -- input
    Y : out std_logic_vector(0 to 7));  -- output

end entity dec3x8;

architecture dec3x8_arc of dec3x8 is

  component dec2x4 is
    port (
      A  : in  std_logic;                  -- input
      B  : in  std_logic;                  -- input
      En : in  std_logic;                  -- input
      Y  : out std_logic_vector(0 to 3));  -- output
  end component dec2x4;

  component my_not is
    port (
      A : in  std_logic;                -- input
      Y : out std_logic);               -- output
  end component my_not;
  
   component my_and is
    port (
      A  : in  std_logic;                  -- input
      B  : in  std_logic;                  -- input
      Y  : out std_logic);  -- output
  end component my_and;

  signal temp,i,j : std_logic;
  
begin  -- architecture dec3x8_arc

  uo : my_not port map (
    A => A,
    Y => temp);
    
    u1 : my_and port map (
    A => temp,
    B => En,
    Y => i);
    
     u2 : my_and port map (
    A => A,
    B => En,
    Y => j);

    u3 : dec2x4 port map (
      A  => B,
      B  => C,
      En => i,
		Y(0)=>Y(0),
		Y(1)=>Y(1),
		Y(2)=>Y(2),
		Y(3)=>Y(3));

     u4 : dec2x4 port map (
      A  => B,
      B  => C,
      En => j,
		Y(0)=>Y(4),
		Y(1)=>Y(5),
		Y(2)=>Y(6),
		Y(3)=>Y(7));
    
end architecture dec3x8_arc;

