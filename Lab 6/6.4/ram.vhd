library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity ram4x5 is

port(
		din : in  std_logic_vector(m-1 downto 0);
		clk : in  std_logic;
		add : in  std_logic_vector(n-1 downto 0);
		we  : in  std_logic;
		dout: out std_logic_vector(m-1 downto 0));
		
end entity;

architecture ram4x5_arc of ram4x5 is
  
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
		en  : in  std_logic_vector((2**n)-1 downto 0);
		dout: out size((2**n)-1 downto 0));
		
end component;

component mux_gen is

port(ip : in size ((2**n)-1 downto 0);
	sel : in std_logic_vector(n-1 downto 0);
	op : out std_logic_vector(m-1 downto 0)
	);	
end component;

component pipo is

  port (
    Din : in  std_logic_vector(m-1 downto 0);                -- input
    clk : in  std_logic;                                       -- input
    en  : in  std_logic;                                       -- input
    Q   : out std_logic_vector(m-1 downto 0)                   -- output
	);               

end component pipo;

signal temp_dec : std_logic_vector((2**n)-1 downto 0);
signal temp_mux : size((2**n)-1 downto 0); 
signal temp : std_logic_vector(m-1 downto 0);
 
begin
  
u0 : decoder_gen port map(
  ip => add,
  op => temp_dec,
  en => we);
    
  
  u1 : mem port map(
    din => din, 
    clk => clk,
    en => temp_dec,
    dout=> temp_mux);
    

u2 : mux_gen port map(
  ip => temp_mux,
  sel=> add,
  op => temp);
  
u3 : pipo port map(
   Din => temp,
   clk => clk,
   en => '1',
   Q =>  dout); 
  
 end architecture ram4x5_arc; 