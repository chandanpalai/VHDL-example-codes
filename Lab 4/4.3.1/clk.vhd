library ieee;
use ieee.std_logic_1164.all;

entity clk is
  
  port (
    clkin  : in  std_logic;             -- input
    rst:in std_logic;
    clkout : out std_logic);            -- output

end entity clk;

architecture clk_arc of clk is

 signal clk : std_logic := '0';
begin  -- architecture clk_arc

  process(clkin,rst)
      variable count1 : integer := 1;
    begin
      if (rst='1') then
        count1:=1;
        clk<='0';
       
    
      elsif (clkin'event and clkin='1') then
        if (count1=50000000) then
           count1:=1;
       clk=not clk;;
     else
        count1:=count1 + 1;
          
        end if;
      end if;
  clkout<=clk;

end architecture clk_arc;
