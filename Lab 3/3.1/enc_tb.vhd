library ieee;
use ieee.std_logic_1164.all;

entity penc_tb is   
end entity penc_tb;

architecture penc_tb_arc of penc_tb is
component penc
port (
    I : in  std_logic_vector(7 downto 0);   -- input
    Y : out std_logic_vector(2 downto 0));  -- output    
end component;

signal I1 : std_logic_vector(7 downto 0);
signal Y1 : std_logic_vector(2 downto 0);

begin

u0: penc port map(
        I=>I1,
        Y=>Y1);
        
 process
 begin
 
 I1<="00000100";
 wait for 10 ns;  
 
 I1<="00100001";
 wait for 10 ns;
 
 I1<="00010000";
 wait for 10 ns;
 
 I1<="10000000";
 wait for 10 ns;
 
 I1<="10010000";
 wait for 10 ns;
 
 I1<="00000010";
 wait for 10 ns;
 
 I1<="00010000";
 wait for 10 ns;
 
 I1<="01010000";
 wait for 10 ns;
 
 I1<="01000000";
 wait for 10 ns;
 
 I1<="00010000";
 wait for 10 ns;
 
 wait; 
 end process;
 end architecture;     