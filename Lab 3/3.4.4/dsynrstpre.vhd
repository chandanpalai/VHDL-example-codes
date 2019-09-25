library ieee;
use ieee.std_logic_1164.all;

entity dasynrstpreen is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
   	en  : in  std_logic;                -- input
    pre : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end entity dasynrstpreen;

architecture dasynrstpreen_arch of dasynrstpreen is

begin  -- architecture dasynrstpreensynrst_arch

  process(clk,rst,pre)
    begin
     
    if (rst='1') then
          Q<='0';
    else
			 if (pre='1') then
			     Q<='1';
			 else
			   if (clk'event and clk='1' and en = '1' ) then
				    	Q<=D;
				end if;	
			end if;
		end if;
  end process;
  
end architecture dasynrstpreen_arch;
