library ieee;
use ieee.std_logic_1164.all;

entity d_tb is
end entity d_tb;

architecture d_tb_arc of d_tb is

  component dasynrst is

     port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output
     
  end component dasynrst;

  signal D,clk,rst : std_logic;
  signal Q : std_logic := '0';
  
begin  -- architecture d_tb_arc

u0 : dasynrst port map (
  D   => D,
  clk => clk,
  rst => rst,
  Q   => Q);

process
  begin

    rst<='1';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';clk<='1';D<='1';
    wait for 10 ns;

     rst<='0';clk<='1';D<='0';
    wait for 10 ns;

     rst<='0';clk<='0';D<='1';
    wait for 10 ns;

     rst<='0';clk<='1';D<='1';
    wait for 10 ns;

     rst<='1';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';clk<='1';D<='1';
    wait for 10 ns;

     rst<='1';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';clk<='1';D<='0';
    wait for 10 ns;

     rst<='0';clk<='0';D<='1';
    wait for 10 ns;

     rst<='0';clk<='1';D<='1';
    wait for 10 ns;
wait;
  end process;    

end architecture d_tb_arc;
  
