library ieee;
use ieee.std_logic_1164.all;
  
entity moor_non_tb is
end moor_non_tb;
 
architecture moor_non_tb_arc of moor_non_tb is 
 

 
    component moor_non
    port(
         ip : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         op : OUT  std_logic
        );
    end component;
    
   signal ip : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal op : std_logic;
 
begin
   u0 : moor_non port map (
          ip => ip,
          clk => clk,
          rst => rst,
          op => op
        );

   
   process
   begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
   end process;
 

   
   process
   begin		
      rst<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='0';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
      rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='0';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='0';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='0';
		wait for 10 ns;
		
		rst<='0';ip<='0';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='0';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='0';
		wait for 10 ns;
      
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='0';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
		rst<='0';ip<='1';
		wait for 10 ns;
		
      wait;
   end process;

end architecture moor_non_tb_arc;