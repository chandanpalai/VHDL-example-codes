library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity decoder_gen is
port(
	ip:in std_logic_vector(n-1 downto 0);
	op: out std_logic_vector((2**n)-1 downto 0);
	en:in std_logic
);
end decoder_gen;

architecture decoder_arc of decoder_gen is

begin
process(ip,en)
begin
op<=(others=>'0');
if(en='1') then
op(conv_integer(ip))<='1';
end if;
end process;

   

end decoder_arc;