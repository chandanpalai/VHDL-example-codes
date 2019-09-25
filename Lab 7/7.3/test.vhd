library ieee;
use ieee.std_logic_1164.all;

entity tb is
  
end tb;

architecture tb_arc of tb is

  component t_l

    port (
    pass   : in  std_logic;             -- input
    clk    : in  std_logic;             -- input
    rst    : in  std_logic;             -- input
    Red    : out std_logic;             -- output
    Green  : out std_logic;             -- output
    Yellow : out std_logic);            -- output
    
  end component;

   signal pass   : std_logic;             -- input
   signal clk    : std_logic;             -- input
   signal rst    : std_logic;             -- input
   signal Red    : std_logic;             -- output
   signal Green  : std_logic;             -- output
   signal Yellow : std_logic;             -- output  

begin  -- tb_arc

u0 : t_l port map (
  pass   => pass,
  clk    => clk,
  rst    => rst,
  Red    => Red,
  Green  => Green,
  Yellow => Yellow);  

process
  begin
    clk<='0';
    wait for 5 ns;
    clk<='1';
    wait for 5 ns;
  end process;

  process
    begin
      rst<='1';
     wait for 10 ns;
      rst<='0';
      wait for 20 ns;
      pass<='1';
      wait for 60 ns;
       pass<='0';
      wait for 30 ns;
      rst<='1';
     wait for 10 ns;
     rst<='0';pass<='0';
      wait for 100 ns;
      rst<='0';pass<='1';
      wait for 100 ns;
      rst<='1';pass<='1';
      wait for 100 ns;
      rst<='0';pass<='0';
      wait for 100 ns;
      rst<='0';pass<='1';
      wait for 100 ns;
      rst<='0';pass<='0';
      wait for 100 ns; 
  wait;
  end process;  
end tb_arc;
