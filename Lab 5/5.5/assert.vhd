library ieee;
use ieee.std_logic_1164.all;

entity asser is
  
  port (
    din : in  std_logic;
    clk : in  std_logic;
    Q   : out std_logic
    );
    
end entity asser;

architecture asser_arc of asser is

component dff is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end component dff; 

signal temp : std_logic;
begin 

u0 : dff port map(
D=>din,
clk=>clk,
Q=>temp);

u1 : dff port map(
D=>temp,
clk=>clk,
Q=>Q); 

end architecture asser_arc;      