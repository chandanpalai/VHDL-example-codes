library ieee;
use ieee.std_logic_1164.all;

entity slr is
  
  generic (
    m : integer := 6);

  port (
    D    : in  std_logic_vector(m-1 downto 0);  -- input
    clk  : in  std_logic;                       -- input
    en   : in  std_logic;                       -- input
    load : in  std_logic;                       -- input
    Q    : out std_logic);                      -- output

end entity slr;

architecture slr_arc of slr is

  component dffe is

    port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    en  : in  std_logic;                -- input
    Q   : out std_logic);               -- output

  end component dffe;

  component mux is
     
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    S : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

  end component mux;

  signal temp : std_logic_vector(0 to m-1);
  signal op : std_logic_vector(0 to m-1);
  

begin  -- architecture piso_arc

      u0 : mux  port map (
        A => op(m-1),
        B => D(0),
        S => load,
        Y => temp(0));
      
      u1 : dffe port map (
        D   => temp(0),
        clk => clk,
        en  => en,
        Q   => op(0));
    
      
U_loop : for i in 1 to m-1 generate

      u2 : mux  port map (
        A => op(i-1) ,
        B => D(i),
        S => load,
        Y => temp(i));
      u3 : dffe port map (
        D   => temp(i),
        clk => clk,
        en  => en,
        Q   => op(i));
     
 end generate U_loop;
  

  Q<=op(m-1);    

end architecture slr_arc;
