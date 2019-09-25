library ieee;
use ieee.std_logic_1164.all;

entity mux_4_1 is
  
  port (
    I  : in  std_logic_vector (3 downto 0)  ;                 -- input
    S  : in  std_logic_vector (1 downto 0);                 -- input
    Y  : out std_logic);                -- output

end entity mux_4_1;

architecture mux_arch of mux_4_1 is
signal P,Q,R,A: std_logic;
begin  -- architecture mux_arch

   P<= I(0) and (not S(1)) and (not S(0));
   Q<= I(1) and (not S(1)) and S(0);
   R<= I(2) and S(1) and (not S(0));
   A<= I(3) and S(1) and S(0);

   Y<= P or Q or R or A;

end architecture mux_arch;
