library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity ram4x8 is

port(
		din : in  std_logic_vector(m-1 downto 0);
		clk : in  std_logic;
		radd: in  std_logic_vector(n-1 downto 0);
		wadd: in  std_logic_vector(n-1 downto 0);
		we  : in  std_logic;
		oe  : in  std_logic;
		dout: out std_logic_vector(m-1 downto 0));
		
end entity;

architecture ram4x8_arc of ram4x8 is
  
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

signal temp_dec : std_logic_vector((2**n)-1 downto 0);
signal temp_mux : size((2**n)-1 downto 0); 
signal temp_out : std_logic_vector(m-1 downto 0); 
begin
  
u0 : decoder_gen port map(
  ip => wadd,
  op => temp_dec,
  en => we);
    
  
  u1 : mem port map(
    din => din, 
    clk => clk,
    en => temp_dec,
    dout=> temp_mux);
    

u2 : mux_gen port map(
  ip => temp_mux,
  sel=> radd,
  op => temp_out);
  
 dout <= temp_out when oe='1' else
          (others=>'0');
 end architecture ram4x8_arc; 