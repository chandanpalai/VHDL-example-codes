library ieee;
use ieee.std_logic_1164.all;

entity dffrse_tb is
end entity dffrse_tb;

architecture dffrs_tb_arc of dffrse_tb is

  component dasynrstpreen is
     port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    en  : in  std_logic;                -- input
    pre : in  std_logic;                -- input
    Q   : out std_logic);               -- output
  end component dasynrstpreen;

  signal D,clk,rst,pre,en : std_logic;
  signal Q : std_logic := '0';
    
begin  -- architecture dffrs_tb_arc

  u0: dasynrstpreen port map (
  D   => D,
  clk => clk,
  rst => rst,
  pre => pre,
  en  => en,
  Q   => Q);

  process is
  begin 
    rst<='1';pre<='0';en<='0';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';pre<='1';en<='0';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';pre<='0';en<='1';clk<='1';D<='0';
    wait for 10 ns;

     rst<='0';pre<='0';en<='1';clk<='0';D<='1';
    wait for 10 ns;

     rst<='0';pre<='0';en<='1';clk<='1';D<='1';
    wait for 10 ns;

     rst<='0';pre<='0';en<='0';clk<='0';D<='0';
    wait for 10 ns;

     rst<='1';pre<='0';en<='1';clk<='1';D<='1';
    wait for 10 ns;

     rst<='0';pre<='1';en<='1';clk<='0';D<='0';
    wait for 10 ns;

     rst<='0';pre<='0';en<='0';clk<='1';D<='1';
    wait for 10 ns;

     rst<='0';pre<='0';en<='1';clk<='0';D<='0';
    wait for 10 ns;

     rst<='1';pre<='0';en<='1';clk<='1';D<='0';
    wait for 10 ns;

     rst<='0';pre<='1';en<='0';clk<='0';D<='0';
    wait for 10 ns;
  end process;

end architecture dffrs_tb_arc;
