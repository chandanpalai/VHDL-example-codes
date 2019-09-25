library ieee;
use ieee.std_logic_1164.all;

entity ha_test is
  
end entity ha_test;

architecture mux_arch of ha_test is

component half_adder 
  
  port (
    A  : in  std_logic;
    B  : in  std_logic;
    sum  : out std_logic;
    carry  : out std_logic);

end component;

signal A : std_logic;
signal B : std_logic;
signal sum : std_logic;
signal carry : std_logic;
begin  -- architecture mux_arch

 u0: half_adder port map (A,B,sum,carry);

 process
   begin
     A<='0';B<='1';
	  wait for 10 ns;
	  A<='1';B<='1';
	  wait for 10 ns;
	  A<='0';B<='0';
	  wait for 10 ns;
	  A<='1';B<='0';
	  wait for 10 ns;
	  A<='1';B<='1';
	  wait for 10 ns;
	  A<='0';B<='1';
	  wait for 10 ns;
	  A<='0';B<='0';
	  wait for 10 ns;
	  A<='1';B<='1';
	  wait for 10 ns;
     wait;
   end process;
end architecture mux_arch;
