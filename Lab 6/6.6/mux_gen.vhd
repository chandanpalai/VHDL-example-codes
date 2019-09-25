library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity mux_gen is

port(ip : in size ((2**n)-1 downto 0);
	sel : in std_logic_vector(n-1 downto 0);
	op : out std_logic_vector(m-1 downto 0)
	);	
end entity;

architecture arc of mux_gen is

begin

op<=ip(conv_integer(sel));


end;
 	