library ieee;
use ieee.std_logic_1164.all;

entity piso_8b_tb is
  
  generic (
    m : integer := 8);

end entity piso_8b_tb;

architecture piso_8b_tb_arc of piso_8b_tb is

component piso is
  
  generic (
    m : integer := 8);

  port (
    D    : in  std_logic_vector(m-1 downto 0);  -- input
    clk  : in  std_logic;                       -- input
    en   : in  std_logic;                       -- input
    load : in  std_logic;                       -- input
    Q    : out std_logic);                      -- output

end component piso;

signal D    : std_logic_vector(m-1 downto 0);
signal clk  : std_logic:='1';
signal en   : std_logic;                       
signal load : std_logic;                       
signal Q    : std_logic;     

begin

u0 : piso port map(
	D => D,
	clk => clk,
	en => en,
	load => load,
	Q => Q);
	
process
  begin                 
  
  clk <= not clk;
  wait for 5 ns;
  
end process;

process
  begin
  
    D <= "01010101"; load <= '1'; en <= '1';
	wait for 20 ns;
	
    D <= "01011001"; load <= '0'; en <= '1';
	wait for 100 ns;
	
	D <= "01101110"; load <= '1'; en <= '1';
	wait for 20 ns;
	
	D <= "10101010"; load <= '0'; en <= '0';
	wait for 100 ns;
	
	D <= "11010110"; load <= '0'; en <= '1';
	wait for 120 ns;
	
	D <= "10010101"; load <= '1'; en <= '0';
	wait for 20 ns;
	
	D <= "01010101"; load <= '1'; en <= '1';
	wait for 20 ns;
	
	D <= "01011011"; load <= '0'; en <= '1';
	wait for 90 ns;
	
	D <= "11011011"; load <= '1'; en <= '1';
	wait for 20 ns;
	
	D <= "10011001"; load <= '0'; en <= '1';
	wait for 140 ns;


	
	wait;
	end process;
	
	end architecture piso_8b_tb_arc;