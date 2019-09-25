library ieee;
use ieee.std_logic_1164.all;

entity mod7_tb is
end entity mod7_tb;

architecture mod7_tb_arc of mod7_tb is

component mod7 is
        
  port (
    clk : in  std_logic;                      -- input
    rst : in  std_logic;                      -- input
    Q   : out std_logic_vector(2 downto 0));  -- output

end component mod7;

signal clk : std_logic := '1';                    
signal rst : std_logic := '1';                      
signal Q   : std_logic_vector(2 downto 0);  

begin
  u0 : mod7 port map (
      clk => clk,
      rst => rst,
      Q => Q);
     
  process
    begin
      clk<=not clk;
      wait for 5 ns;
      rst <='0';
  end process;    
   
end architecture mod7_tb_arc;      