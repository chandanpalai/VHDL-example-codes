library ieee;
use ieee.std_logic_1164.all;

entity piso is
  
  generic (
    m : integer := 5);

  port (
    D    : in  std_logic_vector(m-1 downto 0);  -- input
    clk  : in  std_logic;                       -- input
    en   : in  std_logic;                       -- input
    load : in  std_logic;                       -- input
    Q    : out std_logic);                      -- output

end entity piso;

architecture piso_arc of piso is

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

  signal temp : std_logic_vector(m-1 downto 0);
  signal op : std_logic_vector(m-2 downto 0);
  signal op1: std_logic ;
  signal temp1: std_logic ;

begin  -- architecture piso_arc

  

    
      u0 : mux port map (
        A => '1' ,
        B => D(m-1),
        S => load,
        Y => temp(m-1));
      u1 : dffe port map (
        D   => temp(m-1),
        clk => clk,
        en  => en,
        Q   => op(m-2));
     
U_loop : for i in m-2 downto 1 generate

      u2 : mux  port map (
        A => op(i) ,
        B => D(i),
        S => load,
        Y => temp(i));
      u3 : dffe port map (
        D   => temp(i),
        clk => clk,
        en  => en,
        Q   => op(i-1));
     
 end generate U_loop;
  
      u4 : mux  port map (
        A => op(0) ,
        B => D(0),
        S => load,
        Y => temp(0));
        
      u5 : dffe port map (
        D   => temp(0),
        clk => clk,
        en  => en,
        Q   => op1);
        
        u6 : mux  port map (
        A => op1 ,
        B => '1',
        S => load,
        Y => temp1);
        
      u7 : dffe port map (
        D   => temp1,
        clk => clk,
        en  => en,
        Q   => Q);

      

end architecture piso_arc;
