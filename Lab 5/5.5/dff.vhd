library ieee;
use ieee.std_logic_1164.all;

entity dff is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
  --rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end entity dff;

architecture dff_arch of dff is

begin  -- architecture dasynrst_arch

  process(clk)
    begin

      if clk'event and clk='1' then
        Q<=D after 2 ns;
      
      end if;
    end process;
end architecture dff_arch;
