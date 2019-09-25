library ieee;
use ieee.std_logic_1164.all;

entity seque10 is
  
  port (
    clk : in  std_logic;                      -- input
    rst : in  std_logic;                      -- input
    Q   : out std_logic;                      -- output
    F   : out std_logic_vector(4 downto 0)  -- output
         );
end entity seque10;

architecture seque10_arc of seque10 is

  signal d : std_logic;
  signal Y : std_logic_vector(4 downto 0);  
begin  -- architecture seque10_arc

  process(clk,rst)
    begin
      if (Y="00110" or Y="01001" or Y="10100" or Y="11010" or Y="01110" or Y="10111") then
        d<='1';
      else
        d<='0';
      end if;

      if (rst='1') then
        Y<="11011";
      elsif (clk'event and clk='1') then
        Y<= d & Y(4 downto 1);
      end if;
end process;

Q<=Y(0);
F<=Y;      
end architecture seque10_arc;
