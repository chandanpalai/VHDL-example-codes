library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;
use work.abc.all;

entity ram6x3_tb is
constant bus_size: integer :=3;
constant limit :real:= 1000.0 ;
end entity;

architecture ram6x3_arc_tb of ram6x3_tb is

component ram is

port(
		din        : in  std_logic_vector(m-1 downto 0);     --here m=3
		clk        : in  std_logic;
		radd2      : in  std_logic_vector(n-1 downto 0);     --here n=3
		wadd       : in  std_logic_vector(n-1 downto 0);
		we         : in  std_logic;
		oe         : in  std_logic;
		dout1,dout2: out std_logic_vector(m-1 downto 0));
		
end component;

signal din  : std_logic_vector(m-1 downto 0);
signal clk  : std_logic ;
signal radd2: std_logic_vector(n-1 downto 0);
signal wadd : std_logic_vector(n-1 downto 0);
signal we   : std_logic;
signal oe   : std_logic;
signal dout1: std_logic_vector(m-1 downto 0);
signal dout2: std_logic_vector(m-1 downto 0);

begin

u0 : ram port map(
  din => din,
  clk => clk,
  radd2 => radd2,
  wadd => wadd,
  we => we,
  oe => oe,
  dout1 => dout1,
  dout2 => dout2);
  
  process
    begin
   clk <= '0';
   wait for 5 ns;
   clk <= '1';
   wait for 5 ns;
   end process;
   
  process	
	  variable seed1,seed2:positive:=1;
      variable random1,random2 :real;
      variable random_integer1,random_integer2:integer;
		
      begin
		  we<='1';oe<='0';
		  uniform(seed1,seed2,random1);
        random_integer1:=integer(random1*limit);
        din<=conv_std_logic_vector(random_integer1,bus_size);
			
			uniform(seed1,seed2,random2);
        random_integer2:=integer(random2*limit);
        wadd<= conv_std_logic_vector(random_integer2,3);
        wait for 20 ns;
        we<='0';		  
		 radd2<=conv_std_logic_vector(random_integer1,3);
		--  wait for 25 ns;
		  oe<='1';
		wait for 20 ns;
    end process;
    
    end architecture ram6x3_arc_tb;