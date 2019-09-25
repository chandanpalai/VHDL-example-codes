library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity up_down_count is
  
  port (
    up_down : in  std_logic;                      -- input
    clk     : in  std_logic;                      -- input
    rst     : in  std_logic;                      -- input
    Q       : out std_logic_vector(3 downto 0));  -- output

end entity up_down_count;

architecture up_down_arc of up_down_count is

  signal count : std_logic_vector(3 downto 0);
  signal prev  : std_logic_vector(3 downto 0);
  signal diff  : std_logic_vector(3 downto 0);
  
begin  -- architecture up_down_arc

  process(clk,rst)
   
    begin
      if (rst = '1') then
        count<="0000";
      elsif (clk'event and clk = '1') then
        if (up_down = '1') then
          prev <= count;
          count <= count + 1;
          diff <= count-prev;
                elsif (up_down = '0') then
          prev <= count;
          count <= count -1;
          diff <= prev-count;
                end if;
      end if;      
         Q <= count; 
 end process;
 
 assert (diff = "0001")
      report "two consecutive count differs greater than 1"
        severity warning;

     
end architecture up_down_arc;
