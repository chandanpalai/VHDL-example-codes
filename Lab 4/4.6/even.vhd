library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity even is
  
  port (
    din  : in  std_logic_vector(4 downto 0);   -- input
    load : in  std_logic;                      -- input
    clk  : in  std_logic;                      -- input
    rst  : in  std_logic;                      -- input
    Q    : out std_logic_vector(4 downto 0));  -- output

end entity even;

architecture even_arc of even is


  signal temp : std_logic_vector(4 downto 0);

  
begin  -- architecture even_arc

  process(clk,rst)
    begin
      if (rst='1') then
        temp<="00000";
        elsif(clk'event and clk='1') then
          if (load='0') then
            temp <= temp + 2;
        else
            if (din(0)='0') then
              temp<=din;
              else
                temp<="00000";
                assert (din(0)='0')
                report "counter is not in valid state"
                severity warning; 
            end if;
          end if;
      end if;
    end process;
    Q<=temp;
end architecture even_arc;
