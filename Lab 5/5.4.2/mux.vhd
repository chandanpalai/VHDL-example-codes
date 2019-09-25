library ieee;
use ieee.std_logic_1164.all;

entity mux is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    S : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end entity mux;

architecture mux_arc of mux is

begin  -- architecture mux_arc

  Y<= (A and (not S)) or (B and S);

end architecture mux_arc;
