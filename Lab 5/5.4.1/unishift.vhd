library ieee;
use ieee.std_logic_1164.all;

entity unishift is
  
  generic (
    m : integer := 8);

  port (
    Din      : in  std_logic_vector(m-1 downto 0);  -- input
    clk      : in  std_logic;                       -- input
    rst      : in  std_logic;                       -- input
    ld_shift : in  std_logic;                       -- input
    rs_ls    : in  std_logic ;                      -- input
    Dout     : out std_logic);                      -- output

end entity unishift;

architecture unishift_arc of unishift is

signal temp : std_logic_vector(m-1 downto 0);
begin  -- architecture unishift_arc

  process(clk,rst)
    begin
      if (rst='1') then
        Dout<='0';
        temp<=(others=>'0');
        elsif (clk'event and clk='1') then
          if (ld_shift='1') then
            temp<=Din;
           
            else
              if (rs_ls='1') then
               temp<=temp(0) & temp(m-1 downto 1);
               Dout<=temp(0);
                else
                  temp<=temp(m-2 downto 0) & temp(m-1);
                  Dout<=temp(m-1);
              end if;
          end if;
        end if;
      
    end process;
end architecture unishift_arc;
  