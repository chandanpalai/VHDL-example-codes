library ieee;
use ieee.std_logic_1164.all;

entity tlatch_seq is
  
  generic (
    de : time := 3 ns);                 -- time

  port (
    T : in  std_logic;                  -- input
    En: in  std_logic;                  -- input
    Q : out std_logic);                 -- output

end entity tlatch_seq;

architecture tlatch_seq_arc of tlatch_seq is

  signal s : std_logic := '0';
  
begin  -- architecture tlatch_seq_arc

  process(T,En,s)
  begin  -- process
    if (En='0') then
      s<=s after de ;
    elsif (En='1' and T='1') then
      s<= (not s) after de;
    else
      s<=s after de;
    end if;
  end process;
  Q<=s;
end architecture tlatch_seq_arc;
