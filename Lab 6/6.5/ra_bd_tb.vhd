library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;
use work.abc.all;

entity ram8x5_bd_tb is

constant bus_size: integer :=5;
constant limit :real:= 1000.0 ;

end entity;


architecture ram8x5_bd_tb_arc of ram8x5_bd_tb is
  
component ram8x5_bd is

port(
		din_out : inout  std_logic_vector(m-1 downto 0);
		clk     : in     std_logic;
		add    : in     std_logic_vector(n-1 downto 0);
		we_re   : in     std_logic);
		
end component ram8x5_bd;

signal din_out : std_logic_vector(m-1 downto 0);
signal clk : std_logic;
signal add : std_logic_vector(n-1  downto 0);
signal we_re : std_logic;

begin
  
  u0 : ram8x5_bd port map(din_out,clk,add,we_re);
  
  process											
      begin
        
        clk<='0';
		  wait for 5 ns;
        
		  clk<='1'; 
		  wait for 5 ns;
        
    end process;
    
    process	
	  variable seed1,seed2:positive:=1;
      variable random1,random2 :real;
      variable random_integer1,random_integer2:integer;
		
      begin
		  we_re<='1';
		  uniform(seed1,seed2,random1);
        random_integer1:=integer(random1*limit);
        
		  din_out<=conv_std_logic_vector(random_integer1,bus_size);
		
        uniform(seed1,seed2,random2);
        random_integer2:=integer(random2*limit);
        add<= conv_std_logic_vector(random_integer2,3);
        wait for 20 ns;

		  din_out<=(others=>'Z');	
		  add<=conv_std_logic_vector(random_integer1,3);

		  we_re<='0';
		wait for 20 ns;
    end process;
    
end architecture;