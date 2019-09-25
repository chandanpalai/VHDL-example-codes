library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity counter_tb is
end counter_tb;

architecture counter_arc_tb of counter_tb is

component counter is

port( din  : in std_logic_vector(3 downto 0);
       clk  : in  std_logic;
       load : in  std_logic;
       rst  : in  std_logic;
       Q    : out std_logic_vector(3 downto 0));

end component counter;

signal din  : std_logic_vector(3 downto 0);
signal clk  : std_logic := '0';
signal load : std_logic;
signal rst  : std_logic;
signal Q    : std_logic_vector(3 downto 0);

begin

u0 : counter port map (
  din => din,
  clk => clk,
  load => load,
  rst => rst,
  Q => Q);
  
  process 
  begin
    clk<=not clk;
    wait for 10 ns;
 end process;
 
 process
 begin
  rst<='1'; load<='0'; din<="1011";
  wait for 20 ns;
  
  rst<='0'; load<='0'; din<="1011";
  wait for 70 ns;
  
  rst<='0'; load<='1'; din<="1011";
  wait for 20 ns;
  
  rst<='0'; load<='0'; din<="1011";
  wait for 60 ns;
  
  rst<='1'; load<='0'; din<="1011";
  wait for 10 ns;
  
  rst<='0'; load<='0'; din<="1011";
  wait for 60 ns;
  
  wait;
  
end process;
  
end architecture counter_arc_tb;    