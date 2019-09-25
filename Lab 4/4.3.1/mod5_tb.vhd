library ieee;
use ieee.std_logic_1164.all;

entity mod5_tb is
end entity mod5_tb;

architecture mod5_tb_arc of mod5_tb is

component mod5 is
        
  port (
    clk : in  std_logic;                      -- input
    rst : in  std_logic;                      -- input
    Q   : out std_logic_vector(2 downto 0));  -- output

end component mod5;

signal clk : std_logic := '1';                    
signal rst : std_logic := '1';                      
signal Q   : std_logic_vector(2 downto 0);  

begin
  u0 : mod5 port map (
      clk => clk,
      rst => rst,
      Q => Q);
     
  process
    begin
      clk<=not clk;
      wait for 5 ns;
      rst <='0';
  end process;    
   
end architecture mod5_tb_arc;      