library ieee;
use ieee.std_logic_1164.all;

entity piso_5b_tb is
  
  generic (
    m : integer := 5);

end entity piso_5b_tb;

architecture piso_5b_tb_arc of piso_5b_tb is

component piso is
  
  generic (
    m : integer := 5);

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
  
  D <= "01010"; load <= '1'; en <= '1';
	wait for 20 ns;
	
   D <= "01011"; load <= '0'; en <= '1';
	wait for 70 ns;
	
	D <= "01101"; load <= '1'; en <= '1';
	wait for 20 ns;
	
	D <= "11010"; load <= '0'; en <= '0';
	wait for 20 ns;
	
	D <= "11010"; load <= '0'; en <= '1';
	wait for 70 ns;
	
	D <= "11010"; load <= '1'; en <= '0';
	wait for 20 ns;
	
	D <= "01011"; load <= '1'; en <= '1';
	wait for 20 ns;
	
	D <= "01101"; load <= '0'; en <= '1';
	wait for 70 ns;
	
		D <= "01101"; load <= '1'; en <= '1';
	wait for 20 ns;
	
		D <= "01101"; load <= '0'; en <= '1';
	wait for 70 ns;


	
	wait;
	end process;
	
	end architecture piso_5b_tb_arc;