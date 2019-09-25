library ieee;
use ieee.std_logic_1164.all;

entity slr_tb is

constant m : integer := 6;
 end entity slr_tb;

architecture slr_tb_arc of slr_tb is

  component slr is
 generic (
    m : integer := 6);

  port (
    D    : in  std_logic_vector(m-1 downto 0);  -- input
    clk  : in  std_logic;                       -- input
    en   : in  std_logic;                       -- input
    load : in  std_logic;                       -- input
    Q    : out std_logic);                      -- output

  end component slr;
  
  signal clk : std_logic := '0';
  signal en,load,Q : std_logic;
  signal D : std_logic_vector(m-1 downto 0);
  
  begin
    
    u0 : slr generic map(m=>m) port map (
    D    => D,
    en   => en,
    clk  => clk,
    load => load,
    Q    => Q);
    
    process
    begin
      clk<=not clk;
      wait for 5 ns;
    end process;
    
     process
      begin
        D<="101100";en<='1';load<='1';
        wait for 10 ns;
        
        D<="101100";en<='1';load<='0';
        wait for 70 ns;
        
        D<="101100";en<='0';load<='0';
        wait for 20 ns; 
        
        D<="010110";en<='1';load<='1';
        wait for 10 ns;       
        
        D<="101100";en<='1';load<='0';
        wait for 80 ns;
        
		   D<="110010";en<='0';load<='1';
        wait for 10 ns;       
		  
		   D<="110010";en<='1';load<='1';
        wait for 20 ns; 
			
			 D<="010110";en<='1';load<='0';
        wait for 90 ns;
		  
		  wait;
      end process;
end architecture slr_tb_arc;
