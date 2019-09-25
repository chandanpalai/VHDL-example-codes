library ieee;
use ieee.std_logic_1164.all;

entity rom is
  
  port (
    A  : in  std_logic;                     -- input
    B  : in  std_logic;                     -- input
    C  : in  std_logic;                     -- input 
    F1 : out std_logic;                     -- output
    F2 : out std_logic;                     -- output
    F3 : out std_logic;                     -- output
    F4 : out std_logic);                    -- output

end entity rom;

architecture rom_arc of rom is


  type mem is array (0 to 7) of std_logic_vector(0 to 3);
 
  signal sel : std_logic_vector(0 to 2); 
  signal r : std_logic_vector(0 to 3);
   constant rom : mem := ("0100","0110","1000","1101","0010","0001","1101","1011");
  
begin  -- architecture rom_arc

 sel<=(A & B & C);
with sel select
  r <=
  rom(0) when "000",
  rom(1) when "001",
  rom(2) when "010",
  rom(3) when "011",
  rom(4) when "100",
  rom(5) when "101",
  rom(6) when "110",
  rom(7) when  others;

 F1<=r(0);
 F2<=r(1);
 F3<=r(2);
 F4<=r(3);
end architecture rom_arc;
