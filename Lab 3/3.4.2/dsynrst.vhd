library ieee;
use ieee.std_logic_1164.all;

entity dsynrst is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end entity dsynrst;

architecture dsynrst_arch of dsynrst is

begin  -- architecture dsynrst_arch

  process(clk)
    begin
      if clk'event and clk='1' then
        if rst='1' then
          Q<='0';
          else
            Q<=D;
        end if;
      end if;
end process;
end architecture dsynrst_arch;
