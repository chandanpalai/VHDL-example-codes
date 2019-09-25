library ieee;
use ieee.std_logic_1164.all;
use work.abc.all;

entity pipo is

  port (
    Din   : in  std_logic_vector(m-1 downto 0);                -- input
    clk : in  std_logic;                                       -- input
    en  : in  std_logic;                                       -- input
    Q   : out std_logic_vector(m-1 downto 0)                   -- output
	);               

end entity pipo;

architecture pipo_arch of pipo is

component dffe is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    en  : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end component dffe;


begin

U_loop:for i in m-1 downto 0 generate

u0 : dffe port map (
	D=>Din(i),
	clk=>clk,
	en=>en,
	Q=>Q(i));
	
end generate U_loop;

end architecture pipo_arch;	
	