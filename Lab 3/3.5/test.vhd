library ieee;
use ieee.std_logic_1164.all;

entity ring_tb is
  constant m:std_logic_vector:="101010";
  constant n:std_logic_vector:="010101";
end entity;
architecture con of ring_tb is

    COMPONENT ring
   PORT( Q	:	OUT	STD_LOGIC; 
          clk	:	IN	STD_LOGIC; 
          set	:	IN	STD_LOGIC_VECTOR (5 DOWNTO 0); 
          rst	:	IN	STD_LOGIC_VECTOR (5 DOWNTO 0));
   END COMPONENT;
   
                                                                                                                                 
signal preset:std_logic_vector(5 downto 0):=m ;
signal reset:std_logic_vector(5 downto 0):=n ;
signal clk:std_logic:='0';
signal y:std_logic;
begin


   UUT: ring PORT MAP(
		Q =>y , 
		clk =>clk , 
		set =>preset , 
		rst =>reset 
   );

    process
      begin
     
      clk<='1';
      wait for 10 ns;
      clk<='0';
      wait for 10 ns;
      reset<="000000";
       preset<="000000";
    end process;
  end ;
 