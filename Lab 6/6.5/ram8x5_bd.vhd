library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity ram8x5_bd is

port(
		din_out : inout  std_logic_vector(m-1 downto 0);
		clk     : in     std_logic;
		add    : in     std_logic_vector(n-1 downto 0);
		we_re   : in     std_logic);
		
end entity ram8x5_bd;

architecture ram8x5_bd_arc of ram8x5_bd is

component ram is

port(
		din : in  std_logic_vector(m-1 downto 0);
		clk : in  std_logic;
		radd: in  std_logic_vector(n-1 downto 0);
		wadd: in  std_logic_vector(n-1 downto 0);
		we  : in  std_logic;
		dout: out std_logic_vector(m-1 downto 0));
		
end component;

component tri is
  
  port (
    I  : in  std_logic_vector(m-1 downto 0);                 -- input
    En : in  std_logic;                                      -- input
    Y  : out std_logic_vector(m-1 downto 0));                -- output

end component tri;

signal temp : std_logic_vector(m-1 downto 0);

begin
  
  u0 : ram port map(
    din => din_out,
    clk => clk,
    radd => add,
    wadd => add,
    we => we_re,
    dout => temp);
   
  u1 : tri port map(
    I => temp,
    En => we_re,
    Y => din_out);
  
        
end architecture ram8x5_bd_arc;