library ieee;
use ieee.std_logic_1164.all;

entity dffe is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    en  : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end entity dffe;

architecture dffe_arch of dffe is
 
 signal s : std_logic := '0';
begin  -- architecture dsynrst_arch

  process(clk)
    begin
      if clk'event and clk='1' then
        if en='1' then
          s<=D;
        end if;
      end if;
end process;

Q<=s;

end architecture dffe_arch;
