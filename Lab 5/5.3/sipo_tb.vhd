library ieee;
use ieee.std_logic_1164.all;

entity sipo_tb is
   
 constant m : integer := 8;
 
end entity sipo_tb;

architecture sipo_tb_arc of sipo_tb is

  component sipo is
     generic (
      m : integer := 8);

    port (
      S   : in  std_logic;                      -- input
      rst : in  std_logic;                      -- input
      clk : in  std_logic;                      -- input
      Q   : out std_logic_vector(m-1 downto 0));  -- output

  end component sipo;

  signal S,rst : std_logic;
  signal clk : std_logic := '0';
  signal Q : std_logic_vector(m-1 downto 0);
  
begin  -- architecture sipo_tb_arc

  u0 : sipo generic map(m=>m) port map (
    S   => S,
    rst => rst,
    clk => clk,
    Q   => Q);

  process
    begin
      clk<=not clk;
      wait for 5 ns;
    end process;

    process
      begin
        rst<='1';S<='1';
        wait for 10 ns;
        
        rst<='0';S<='0';
        wait for 10 ns;

        rst<='0';S<='1';
        wait for 10 ns;

        rst<='0';S<='1';
        wait for 10 ns;

        rst<='0';S<='0';
        wait for 10 ns;

        rst<='0';S<='1';
        wait for 10 ns;

        rst<='0';S<='0';
        wait for 10 ns;

        rst<='0';S<='1';
        wait for 10 ns;

        rst<='0';S<='1';
        wait for 10 ns;

        rst<='0';S<='1';
        wait for 10 ns;
        
        rst<='0';S<='0';
        wait for 10 ns;
      
		wait;
      end process;
end architecture sipo_tb_arc;
