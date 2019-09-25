library ieee;
use ieee.std_logic_1164.all;

entity asser_tb is
end entity asser_tb;

architecture asser_tb_arc of asser_tb is

component asser is
  
  port (
    din : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end component asser;

component dff is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end component dff; 

signal clkd : std_logic;
signal din : std_logic;                
signal clk : std_logic:='0';               
signal Q   : std_logic;   
signal temp : std_logic;
             

begin
  
u0 : dff port map(
D=>din,
clk=>clk,
Q=>temp);

u1 : dff port map(
D=>temp,
clk=>clk,
Q=>Q); 

u2 : asser port map(din,clk,Q); 
 
process(clk)
variable c : time := 0 ns;
begin 
 if (clk'event and clk='1') then   
 c:=din'last_event;
 assert(c>=2 ns)
 report "setup violation of first D Flip Flop"
 severity warning;
 end if;
 end process; 
 
 
 process(clk)
variable c : time := 0 ns;
begin  
 if (clk'event and clk='1') then   
 c:=temp'last_event;
 assert(c>=2 ns)
 report "setup violation of second D Flip Flop"
 severity warning;
 end if;
 end process; 

 
 clkd<=clk after 3 ns;

 
 process(clkd)
begin  
 if (clkd'event and clkd= '1') then   
 assert(din'last_event>=3 ns)
 report "hold violation of first D Flip Flop"
 severity error;
 end if;
 end process; 

 
 process(clkd)
begin 
 if (clkd'event and clkd= '1') then  
 assert(temp'last_event>=3 ns)
 report "hold violation of second D Flip Flop"
 severity error;
 end if;
 end process; 

  
process
  begin
    
    clk <= not clk;
    wait for 5 ns;
    
 end process;   
 
 
process
  begin
  
  din<='0';
wait for 4 ns;

din<='1';
wait for 10 ns;

din<='0';
wait for 10 ns;

din<='1';
wait for 10 ns;

din<='0';
wait for 10 ns;

din<='1';
wait for 10 ns;  

din<='0';
wait for 10 ns;  

wait;

end process;

end architecture asser_tb_arc;