
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tb IS
END tb;
 
ARCHITECTURE tb_arc OF tb IS 
 

 
    COMPONENT sequ
    PORT(
         ip : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         op : OUT  std_logic
        );
    END COMPONENT;
    
   signal ip : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal op : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 

   u0 : sequ PORT MAP (
          ip => ip,
          clk => clk,
          rst => rst,
          op => op
        );

   
   process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
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
		
		rst<='0';ip<='0';
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
      
      wait;
   end process;

END architecture tb_arc;
