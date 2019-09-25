library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity counter is
 port( din  : in std_logic_vector(3 downto 0);
       clk  : in  std_logic;
       load : in  std_logic;
       rst  : in  std_logic;
       Q    : out std_logic_vector(3 downto 0));

end counter;

architecture counter_arc of counter is
  
 signal tmp: std_logic_vector(3 downto 0);

begin

process (clk, rst)
      begin
        if (rst='1') then
          tmp <= "0000";
        elsif (clk'event and clk='1')   then
			if(load='1') then
			tmp<=din;
			else
          tmp <= tmp + 1;
        end if;
      end if;
    end process;
    Q <= tmp;

end counter_arc;