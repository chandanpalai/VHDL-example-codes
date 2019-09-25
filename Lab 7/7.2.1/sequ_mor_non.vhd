library ieee;
use ieee.std_logic_1164.all;

entity moor_non is
port(
	ip  : in  std_logic;
	clk : in  std_logic;
	rst : in  std_logic;
	op  : out std_logic
	); 
end moor_non;

architecture moor_non_arc of moor_non is

type my_state is (idle,S1,S11,S110,S1101,S11011);

signal state : my_state;

begin
  
  op<= '1' when state=S11011 else
        '0';  

process(clk,rst)
  begin

 if rst='1' then 
 state<=idle;


 elsif clk'event and clk='1' then
  
	case state is 
	
	when idle=> 
	if ip='1' then
	state<=S1;
	else
	state<=idle;
	end if;
	

	when S1=> 
	if ip='1' then
	state<=S11;
	else
	state<=idle;
	end if;
		
	
	when S11=>
	if ip='0' then
	state<=S110;
	else
	state<=S11;
	end if;
	
	
	when S110=> 
	if ip='1' then
	state<=S1101;
	else
	state<=idle;
	end if;
	
	
	when S1101=>
	if ip='1' then
	state<=S11011;
	else
	state<=idle;
	end if;
	
	
	when S11011=> 
	if ip='1' then
	state<=S1;
	else
	state<=idle;
	end if;
	
	end case;
	end if;
	
	end process;
	
	end architecture moor_non_arc;