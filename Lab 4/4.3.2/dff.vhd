library ieee;
use ieee.std_logic_1164.all;

entity dff is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end entity dff;

architecture dff_arc of dff is
--signal x:std_logic:='0';
begin  -- architecture dff_arc

  process(clk,rst)
    begin
      if rst='1' then 
        q<='0';
      elsif (clk'event and clk='0') then
       Q<= D;
      
    
      end if;
 
    end process;
end architecture dff_arc;
