library ieee;
use ieee.std_logic_1164.all;

entity slr is
  
  generic (
    m : integer := 6);

  port (
    din  : in  std_logic_vector(m-1 downto 0);  -- input
    clk  : in  std_logic;                       -- input
    en   : in  std_logic;                       -- input
    load : in  std_logic;                       -- input
    Q    : out std_logic);                      -- output

end entity slr;

architecture slr_arc of slr is

  signal temp : std_logic_vector(m-1 downto 0);
begin  -- architecture srl_arc

  process(clk)
    begin
      if (clk'event and clk='1') then
        if (en='1') then    
        if (load='1') then
          temp<=din;
          else
            temp<=temp(m-2 downto 0) & temp(m-1);
        end if;
      end if;
      Q<=temp(m-1);
    end if;
     
    end process;
     
end architecture slr_arc;
