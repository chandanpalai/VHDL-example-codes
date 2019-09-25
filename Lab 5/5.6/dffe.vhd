library ieee;
use ieee.std_logic_1164.all;

entity dffe is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    pre : in  std_logic;                -- input
	  rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end entity dffe;

architecture dffe_arch of dffe is
 
 --signal s : std_logic := '0';
begin  -- architecture dsynrst_arch

  process(clk,rst,pre)
    begin
	if rst='1' then
	Q<='0';
		elsif pre='1' then
		Q<='1';
		elsif clk'event and clk='1' then
         Q<=D;
    end if;
end process;

end architecture dffe_arch;
