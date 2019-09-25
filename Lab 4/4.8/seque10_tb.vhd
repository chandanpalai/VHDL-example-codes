library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seque10_tb is 
  
end entity;

architecture seque10_tb_arc of seque10_tb is
  
component seque10 is

  port(          
        clk:  in std_logic;                       --input
        rst:  in std_logic;                       --input
        Q:    out std_logic;                      --output
        F   : out std_logic_vector(4 downto 0));  --output
end component;

signal clk,rst,Q:std_logic;
signal F : std_logic_vector(4 downto 0);

begin
  
  u0 : seque10 port map(clk,rst,Q,F);
    
   process
      begin
        rst<='1';
        wait for 10 ns;
        rst<='0';
        wait for 90 ns;
        rst<='1';
        wait for 10 ns;  
        rst<='0';
        wait for 700 ns; 
      end process;
      
      process
        begin
          clk<='0';
          wait for 5 ns;
          clk<='1';
          wait for 5 ns;
      end process;
  
  
end architecture;
