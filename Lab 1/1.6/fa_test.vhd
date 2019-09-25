library ieee;
use ieee.std_logic_1164.all;

entity fa_test is
  
end entity fa_test;

architecture mux_arch of fa_test is

component full_adder 
  
  port (
    A  : in  std_logic;
    B  : in  std_logic;
    C  : in  std_logic;
    sum  : out std_logic;
    carry  : out std_logic);

end component;

signal A : std_logic;
signal B : std_logic;
signal C : std_logic;
signal sum : std_logic;
signal carry : std_logic;
begin  -- architecture mux_arch

 u0: full_adder port map (A,B,C,sum,carry);

 process
   begin
     A<='0';B<='1';C<='1';
	  wait for 10 ns;
	  A<='1';B<='1';C<='1';
	  wait for 10 ns;
	  A<='0';B<='0';C<='1';
	  wait for 10 ns;
	  A<='0';B<='1';C<='0';
	  wait for 10 ns;
	  A<='1';B<='1';C<='0';
	  wait for 10 ns;
	  A<='1';B<='0';C<='1';
	  wait for 10 ns;
	  A<='1';B<='0';C<='0';
	  wait for 10 ns;
	  A<='0';B<='0';C<='0';
	  wait for 10 ns;
	  A<='0';B<='1';C<='1';
	  wait for 10 ns;
     wait;
   end process;
end architecture mux_arch;
