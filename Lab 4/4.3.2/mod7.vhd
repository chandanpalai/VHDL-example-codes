library ieee;
use ieee.std_logic_1164.all;

entity mod7 is
  
  port (
    clk : in  std_logic;                      -- input
    rst : in  std_logic;                      -- input
    Q   : out std_logic_vector(2 downto 0));  -- output

end entity mod7;

architecture mod7_arc of mod7 is

  component dff is

     port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output
    
  end component dff;

  signal temp : std_logic_vector(2 downto 0);
  signal e,f,g : std_logic;
  
begin  -- architecture mod5_arc

  e<=(temp(2) and (not temp(1))) or ((not temp(2)) and temp(1) and temp(0));
  f<=((not temp(1)) and temp(0)) or ((not temp(2)) and temp(1) and (not temp(0)));
  g<=((not temp(1)) and (not temp(0))) or ((not temp(2)) and temp(1) and (not temp(0)));
  
  q<=temp;

  u1 : dff port map (
    D   => e,
    clk => clk,
    rst => rst,
    Q   => temp(2));

  u2 : dff port map (
    D   => f,
    clk => clk,
    rst => rst,
    Q   => temp(1));

  u3 : dff port map (
    D   => g,
    clk => clk,
    rst => rst,
    Q   => temp(0));

end architecture mod7_arc;
