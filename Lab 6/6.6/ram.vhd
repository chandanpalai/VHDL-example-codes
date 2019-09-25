library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity ram is

port(
		din  : in  std_logic_vector(m-1 downto 0);
		clk  : in  std_logic;
		radd2: in  std_logic_vector(n-1 downto 0);
		wadd : in  std_logic_vector(n-1 downto 0);
		we   : in  std_logic;
		oe   : in  std_logic;
		dout1,dout2: out std_logic_vector(m-1 downto 0));
		
end entity;

architecture ram_arc of ram is
  
component decoder_gen is
port(
	ip:in std_logic_vector(n-1 downto 0);
	op: out std_logic_vector((2**n)-1 downto 0);
	en:in std_logic
);
end component decoder_gen; 

component mem is
  
 port(
		din : in  std_logic_vector(m-1 downto 0);
		clk : in  std_logic;
		en  : in  std_logic_vector(5 downto 0);
		dout: out size(5 downto 0));
		
end component;

component mux_gen is

port(ip : in size ((2**n)-1 downto 0);
	sel : in std_logic_vector(n-1 downto 0);
	op : out std_logic_vector(m-1 downto 0)
	);	
end component;

component pipo is

  port (
    Din : in  std_logic_vector(m-1 downto 0);                  -- input
    clk : in  std_logic;                                       -- input
    en  : in  std_logic;                                       -- input
    Q   : out std_logic_vector(m-1 downto 0)                   -- output
	);               

end component pipo;

signal temp_dec : std_logic_vector((2**n)-1 downto 0);
signal temp_mux : size(7 downto 0); 
signal temp_out1,temp_out2 : std_logic_vector(m-1 downto 0); 
begin
  
u0 : decoder_gen port map(
  ip => wadd,
  op => temp_dec,
  en => we);
    
  
  u1 : mem port map(
    din => din, 
    clk => clk,
    en => temp_dec(5 downto 0),
    dout=> temp_mux(5 downto 0));
    

u2 : mux_gen port map(
  ip => temp_mux,
  sel=> wadd,
  op => temp_out1);
  
u3 : mux_gen port map(
  ip => temp_mux,
  sel=> radd2,
  op => temp_out2);
 
 u4 : pipo port map(
  Din => temp_out1, 
  clk => clk,
  en  => oe,
  Q   => dout1);
  
  u5 : pipo port map(
  Din => temp_out2, 
  clk => clk,
  en  => oe,
  Q   => dout2);
  
end architecture ram_arc; 