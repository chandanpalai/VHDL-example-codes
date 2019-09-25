library ieee;
use ieee.std_logic_1164.all;

entity unishift is
  
  generic (
    m : integer := 6);

  port (
    Din      : in  std_logic_vector(m-1 downto 0);  -- input
    clk      : in  std_logic;                       -- input
    rst      : in  std_logic;                       -- input
    ld_shift : in  std_logic;                       -- input
    rs_ls    : in  std_logic ;                      -- input
    Dout     : out std_logic);                      -- output

end entity unishift;

architecture unishift_arc of unishift is

 component dff is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end  component dff;
  
 component my_2x1 is
  
  port (
    I : in  std_logic_vector(1 downto 0);                  -- input
    S : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end component my_2x1;

component my_4x1 is
  
  port (
    I : in  std_logic_vector(3 downto 0);                  -- input
    S : in  std_logic_vector(1 downto 0);                  -- input
    Y : out std_logic);                 -- output

end component my_4x1;


signal temp : std_logic_vector(m-1 downto 0);
signal mtemp : std_logic_vector(m-1 downto 0);

begin  -- architecture unishift_arc
  
  u0 : my_4x1 port map(
    I(3)=>Din(m-1),
    I(2)=>Din(m-1),
    I(1)=>temp(0),
    I(0)=>temp(m-2),
    S(1)=>ld_shift,
    S(0)=>rs_ls, 
    Y=>mtemp(m-1));
  
  u1 : dff port map (
    D => mtemp(m-1),
    clk => clk,
    rst => rst,
    Q => temp(m-1));
    
    U_loop: for i in m-2 downto 1 generate
      
      u2 : my_4x1 port map(
    I(3)=>Din(i),
    I(2)=>Din(i),
    I(1)=>temp(i+1),
    I(0)=>temp(i-1),
    S(1)=>ld_shift,
    S(0)=>rs_ls, 
    Y=>mtemp(i));
    
    u3 : dff port map (
    D => mtemp(i),
    clk => clk,
    rst => rst,
    Q => temp(i));
    
    end generate U_loop;
    
    u4 : my_4x1 port map(
    I(3)=>Din(0),
    I(2)=>Din(0),
    I(1)=>temp(1),
    I(0)=>temp(m-1),
    S(1)=>ld_shift,
    S(0)=>rs_ls, 
    Y=>mtemp(0));
    
    u5 : dff port map (
    D => mtemp(0),
    clk => clk,
    rst => rst,
    Q => temp(0));
    
    u6 : my_2x1 port map (
    I(1)=> temp(0),
    I(0)=> temp(m-1),
    S => rs_ls,
    Y=> Dout);
    
  end architecture unishift_arc;