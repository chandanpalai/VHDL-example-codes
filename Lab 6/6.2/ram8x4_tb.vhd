library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity ram8x4_tb is
end entity ram8x4_tb;

architecture ram8x4_tb_arc of ram8x4_tb is

component ram8x4 is

port(
		din : in  std_logic_vector(m-1 downto 0);
		clk : in  std_logic;
		radd: in  std_logic_vector(n-1 downto 0);
		wadd: in  std_logic_vector(n-1 downto 0);
		we  : in  std_logic;
		dout: out std_logic_vector(m-1 downto 0));
		
end component; 

signal din : std_logic_vector(m-1 downto 0);
signal clk : std_logic ;
signal radd: std_logic_vector(n-1 downto 0);
signal wadd: std_logic_vector(n-1 downto 0);
signal we  : std_logic;
signal dout: std_logic_vector(m-1 downto 0):=(others=>'0');

begin

u0 : ram8x4 port map(
	din => din,
	clk => clk,
	radd => radd,
	wadd => wadd,
	we => we,
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

din<="0101"; we<='1'; wadd<="110"; radd<="110";
wait for 20 ns;

din<="0110"; we<='1'; wadd<="101"; radd<="101";
wait for 20 ns;
din<="1011"; we<='1'; wadd<="100"; radd<="100";
wait for 20 ns;
din<="0011"; we<='1'; wadd<="110"; radd<="110";
wait for 20 ns;
din<="0111"; we<='1'; wadd<="000"; radd<="000";
wait for 20 ns;
din<="1100"; we<='1'; wadd<="111"; radd<="111";
wait for 20 ns;
din<="1101"; we<='1'; wadd<="000"; radd<="000";
wait for 20 ns;
din<="0100"; we<='1'; wadd<="010"; radd<="010";
wait for 20 ns;
din<="1001"; we<='1'; wadd<="001"; radd<="001";
wait for 20 ns;
din<="0101"; we<='1'; wadd<="111"; radd<="111";
wait for 20 ns;
din<="0100"; we<='0'; wadd<="110"; radd<="110";
wait for 20 ns;
din<="1110"; we<='0'; wadd<="110"; radd<="110";
wait for 20 ns;
din<="0010"; we<='0'; wadd<="010"; radd<="010";
wait for 20 ns;
din<="1011"; we<='0'; wadd<="000"; radd<="000";
wait for 20 ns;
 radd<="100";
wait for 20 ns;
 radd<="001";
wait for 20 ns;
radd<="110";
wait for 20 ns;
din<="0000"; we<='1'; wadd<="101"; radd<="101";
wait for 20 ns;
end process;

end architecture ram8x4_tb_arc;