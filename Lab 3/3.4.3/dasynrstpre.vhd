library ieee;
use ieee.std_logic_1164.all;

entity dasynrstpre is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    pre : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end entity dasynrstpre;

architecture dasynrst_arch of dasynrstpre is

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
end architecture dasynrst_arch;
