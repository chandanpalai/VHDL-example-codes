library ieee;
use ieee.std_logic_1164.all;

entity dffrp is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    pre : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end entity dffrp;

architecture dffrp_arch of dffrp is

begin  -- architecture dasynrst_arch

  process(clk,rst,pre)
    begin

      if (rst='1') then
        Q<='0';
      elsif (pre='1') then
        Q<='1';  
      elsif (clk'event and clk='1') then
        Q<=D;
    end if;
    end process;
end architecture dffrp_arch;
