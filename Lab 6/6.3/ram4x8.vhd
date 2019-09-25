library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity ram4x8_tb is
end entity ram4x8_tb;

architecture ram4x8_tb_arc of ram4x8_tb is

component ram4x8 is

port(
		din : in  std_logic_vector(m-1 downto 0);
		clk : in  std_logic;
		radd: in  std_logic_vector(n-1 downto 0);
		wadd: in  std_logic_vector(n-1 downto 0);
		we  : in  std_logic;
		oe  : in  std_logic;
		dout: out std_logic_vector(m-1 downto 0));
		
end component;

signal din : std_logic_vector(m-1 downto 0);
signal clk : std_logic;
signal radd: std_logic_vector(n-1 downto 0);
signal wadd: std_logic_vector(n-1 downto 0);
signal we  : std_logic;
signal oe  : std_logic;
signal dout: std_logic_vector(m-1 downto 0);

begin

u0 : ram4x8 port map(
	din => din,
	clk => clk,
	radd => radd,
	wadd => wadd,
	we => we,
	oe => oe,
	dout => dout);
	
process 
	begin	
	
clk <= '0';
wait for 5 ns;

clk <= '1';
wait for 5 ns;

end process;

process
  begin 

din<="01010111"; we<='1'; oe<='0'; wadd<="11"; radd<="11";
wait for 20 ns;

din<="01010001"; we<='1'; oe<='1'; wadd<="01"; radd<="01";
wait for 20 ns;  

din<="11101110"; we<='1'; oe<='1'; wadd<="00"; radd<="00";
wait for 20 ns;

din<="01011011"; we<='1'; oe<='0'; wadd<="10"; radd<="10";
wait for 20 ns;

din<="01010111"; we<='0'; oe<='1'; wadd<="10"; radd<="00";
wait for 20 ns;

din<="01010111"; we<='0'; oe<='1'; wadd<="10"; radd<="11";
wait for 20 ns;

din<="01010111"; we<='0'; oe<='1'; wadd<="00"; radd<="01";
wait for 20 ns;

din<="01010111"; we<='0'; oe<='1'; wadd<="11"; radd<="10";
wait for 20 ns;

din<="01011100"; we<='1'; oe<='1'; wadd<="01"; radd<="01";
wait for 20 ns;

din<="11110111"; we<='1'; oe<='0'; wadd<="11"; radd<="11";
wait for 20 ns;

din<="01010100"; we<='1'; oe<='0'; wadd<="10"; radd<="10";
wait for 20 ns;

din<="11011101"; we<='1'; oe<='0'; wadd<="00"; radd<="00";
wait for 20 ns;

din<="01010111"; we<='0'; oe<='1'; wadd<="10"; radd<="11";
wait for 20 ns;

din<="01010111"; we<='0'; oe<='1'; wadd<="01"; radd<="01";
wait for 20 ns;

din<="01010111"; we<='1'; oe<='1'; wadd<="10"; radd<="00";
wait for 20 ns;

wait;

end process;

end architecture ram4x8_tb_arc;