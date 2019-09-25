library ieee;
use ieee.std_logic_1164.all;

entity unishift_tb is
 
 generic (
    m : integer := 8);
	 
end entity unishift_tb; 

architecture unishift_tb_arc of unishift_tb is

component unishift is
  
  generic (
    m : integer := 8);

  port (
    Din      : in  std_logic_vector(m-1 downto 0);  -- input
    clk      : in  std_logic;                       -- input
    rst      : in  std_logic;                       -- input
    ld_shift : in  std_logic;                       -- input
    rs_ls    : in  std_logic ;                      -- input
    Dout     : out std_logic);                      -- output

end component unishift; 

signal Din      : std_logic_vector(m-1 downto 0);    
signal clk      : std_logic := '0';                    
signal rst      : std_logic;                   
signal ld_shift : std_logic;                    
signal rs_ls    : std_logic;                      
signal Dout     : std_logic;      

begin

u0 : unishift port map(
	Din => Din,
	clk => clk,
	rst => rst,
	ld_shift => ld_shift,
	rs_ls => rs_ls,
	Dout => Dout);

process 
	begin

clk <= not clk;
wait for 5 ns;

end process;

process
	begin
rst <= '1';
wait for 10 ns;

Din<="11001010"; ld_shift<='1'; rs_ls <='1'; rst<='0'; 	
wait for 10 ns; 

Din<="11001010"; ld_shift<='0'; rs_ls <='1'; rst<='0'; 	
wait for 100 ns; 

Din<="01101010"; ld_shift<='1'; rs_ls <='0'; rst<='0'; 	
wait for 10 ns; 

Din<="01101010"; ld_shift<='0'; rs_ls <='0'; rst<='0'; 	
wait for 100 ns; 

Din<="11010110"; ld_shift<='1'; rs_ls <='1'; rst<='1'; 	
wait for 10 ns; 	

Din<="10011001"; ld_shift<='0'; rs_ls <='0'; rst<='0'; 	
wait for 100 ns; 

Din<="00110110"; ld_shift<='1'; rs_ls <='1'; rst<='0'; 	
wait for 20 ns; 

Din<="00110101"; ld_shift<='1'; rs_ls <='1'; rst<='0'; 	
wait for 100 ns; 

wait;

end process;

end architecture unishift_tb_arc;