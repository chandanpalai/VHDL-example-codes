library ieee;
use ieee.std_logic_1164.all;

entity sequ_over is
port(
	ip  : in  std_logic;
	clk : in  std_logic;
	rst : in  std_logic;
	op  : out std_logic
	); 
end sequ_over;

architecture sequ_over_arc of sequ_over is

type my_state is (idle,S1,S11,S110);

signal state : my_state;

begin 
process(clk,rst)
begin

if rst='1' then
state<=idle;
op<='0';
 
 elsif clk'event and clk='1' then
 
 case state is 
 
 when idle => 
 if ip = '1' then
 state<=S1;
 else
 state<=idle;
 end if;
 op<='0';

 when S1 =>
 if ip = '1' then
 state<=S11;
 else
 state<=idle;
 end if;
 op<='0';

 when S11 => 
 if ip = '0' then
 state<=S110;
 else 
 state<=S11;
 end if;
 op<='0';
 
 when S110 => 
 if ip = '1' then
 state<=S1;
 op<='1';
 else
 state<=idle;
 op<='0';
 end if;
 
 end case;

 end if;
 
 end process;

 end architecture sequ_over_arc;