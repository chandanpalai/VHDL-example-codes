library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity up_down_tb is
end entity up_down_tb;

architecture up_down_tb_arc of up_down_tb is

  component up_down_count 

    port (
    up_down : in  std_logic;                      -- input
    clk     : in  std_logic;                      -- input
    rst     : in  std_logic;                      -- input
    Q       : out std_logic_vector(3 downto 0));  -- output

  end component up_down_count;

  signal up_down : std_logic;
  signal clk : std_logic := '0';
  signal rst : std_logic ;
  signal Q : std_logic_vector(3 downto 0);
  
begin  -- architecture up_down_tb_arc

  u0 : up_down_count port map (
    up_down => up_down,
    clk     => clk := '0',
    rst     => rst,
    Q       => Q);

    process
      begin
         clk<=not clk;
        wait for 5 ns;
      end process;

      process
        begin
        rst<= '1';
        wait for 10 ns;
        rst<= '0';
         up_down<='1';
        wait for 80 ns;
         rst<= '0';
         wait for 10 ns;
          up_down<='0';
        wait for 90 ns;
         rst<= '1'; 
         wait for 10ns;
         up_down<='1';
        wait for 30 ns;
         rst<= '0'; 
         up_down<='0';
        wait for 60 ns;
        
        end process;
      
  
end architecture up_down_tb_arc;
