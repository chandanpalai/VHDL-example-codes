library ieee;
use ieee.std_logic_1164.all;
 
entity sipo is
    
    generic (
      m : integer := 8);

    port (
      S   : in  std_logic;                      -- input
      rst : in  std_logic;                      -- input
      clk : in  std_logic;                      -- input
      Q   : out std_logic_vector(m-1 downto 0));  -- output

end entity sipo;

architecture sipo_arc of sipo is

  component dffar is

    port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output
    
  end component dffar;

  signal temp : std_logic_vector(m-1 downto 0);
  
begin  -- architecture sipo_arc

   u0 : dffar port map (
     D   => S,
     clk => clk,
     rst => rst,
     Q   => temp(m-1));

 U_loop:for i in m-2 downto 0 generate

   u1 : dffar port map (
     D   => temp(i+1),
     clk => clk,
     rst => rst,
     Q   => temp(i));
 end generate U_loop;
   Q<=temp;
end architecture sipo_arc;    
