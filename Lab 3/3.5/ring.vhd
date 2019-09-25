library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ring is
  generic (
    m : integer := 6);
   port ( clk : in    std_logic; 
          rst : in    std_logic; 
          set : in    std_logic;
          F   : out   std_logic);
end ring;

architecture BEHAVIORAL of ring is
  
   
   component FDS
     generic( INIT : bit :=  '1');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             S : in    std_logic; 
             Q : out   std_logic);
   end component;
   
   
   component FDR
       generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             R : in    std_logic; 
             Q : out   std_logic);
   end component;
   
 
 signal temp : std_logic_vector(m downto 0) ;  
begin
  
  R_loop:for i in 0 to (m-1) generate
  
  l1: if (i=0) generate 
     u0: FDS port map (
     C=> clk,
     D=> temp(m),
     S=> set,
     Q=> temp(i));
    end generate l1;
     

  l2: if ((i>0) and (i=m-1)) generate
     u1: FDR port map (
      C=> clk,
      D=> temp(i-1),
      R=> rst,
      Q=> temp(i));
	   end generate l2;

 end generate R_loop;  
   F<= temp(m)
end BEHAVIORAL;