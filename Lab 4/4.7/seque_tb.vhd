library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sequen_tb is 
  
end entity;

architecture sequen_tb_arc of sequen_tb is
  
component sequen is

  port(          
        clk:  in std_logic;                       --input
        rst:  in std_logic;                       --input
        Q:    out std_logic;                      --output
        F   : out std_logic_vector(3 downto 0));  --output
end component;

signal clk,rst,Q:std_logic;
signal F : std_logic_vector(3 downto 0);
begin
  
  u0 : sequen port map(clk,rst,Q,F);
    
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
