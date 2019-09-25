library ieee;
use ieee.std_logic_1164.all;

entity dffrs_tb is
end entity dffrs_tb;

architecture dffrs_tb_arc of dffrs_tb is

  component dasynrstpre is
     port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    pre : in  std_logic;                -- input
    Q   : out std_logic);               -- output
  end component dasynrstpre;

   signal D,clk,rst,pre : std_logic;
  signal Q : std_logic := '0';
begin  -- architecture dffrs_tb_arc

  u0 : dasynrstpre port map (
  D   => D,
  clk => clk,
  rst => rst,
  pre => pre,
  Q   => Q);

  process
    begin    
    rst<='1';pre<='0';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';pre<='1';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';pre<='0';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';pre<='0';clk<='1';D<='0';
    wait for 10 ns;

     rst<='0';pre<='0';clk<='0';D<='1';
    wait for 10 ns;

     rst<='0';pre<='0';clk<='1';D<='1';
    wait for 10 ns;

     rst<='1';pre<='0';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';pre<='0';clk<='1';D<='1';
    wait for 10 ns;

     rst<='0';pre<='0';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';pre<='0';clk<='1';D<='0';
    wait for 10 ns;

     rst<='0';pre<='1';clk<='0';D<='0';
    wait for 10 ns;

    wait;

    end process;

end architecture dffrs_tb_arc;
