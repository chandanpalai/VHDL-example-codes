library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity even_tb is
end entity even_tb;

architecture even_tb_arc of even_tb is

component even is 
  
  port (
    din  : in  std_logic_vector(4 downto 0);   -- input
    load : in  std_logic;                      -- input
    clk  : in  std_logic;                      -- input
    rst  : in  std_logic;                      -- input
    Q    : out std_logic_vector(4 downto 0));  -- output

end component even;

signal din  : std_logic_vector(4 downto 0);   
signal load : std_logic;                      
signal clk  : std_logic := '0';                      
signal rst  : std_logic;                      
signal Q    : std_logic_vector(4 downto 0);  

begin

u0 : even port map (
   din => din,
   load => load,
   clk => clk ,
   rst => rst,
   Q => Q);
   
   process 
     begin
     clk<=not clk;
     wait for 5 ns;
   end process;

   process
        begin
        rst<= '1';load<='0';din<="10011";
        wait for 10 ns;
        
        rst<= '0';load<='0';din<="10011";
        wait for 90 ns;
        
        rst<= '0';load<='1';din<="10011";
        wait for 10 ns;
        
        rst<= '0';load<='0';din<="10011";
        wait for 70 ns; 
        
        rst<= '1';load<='1';din<="11100";
        wait for 10 ns; 
        
        rst<= '0';load<='1';din<="10011";
        wait for 10 ns;       
        
        rst<= '0';load<='0';din<="10011";
        wait for 60 ns;
        
end process;

end architecture even_tb_arc;        