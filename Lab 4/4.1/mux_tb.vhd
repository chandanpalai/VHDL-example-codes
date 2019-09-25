library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end entity mux_tb;

architecture mux_tb_arc of mux_tb is
  
component mux is
  
  port (
    I : in  std_logic_vector(7 downto 0);  -- input
    S : in  std_logic_vector(2 downto 0);  -- input
    Y : out std_logic);                    -- output
    
 end component mux;
 
 signal I : std_logic_vector(7 downto 0);
 signal S : std_logic_vector(2 downto 0);
 signal Y : std_logic;
 
 begin
   
   u0 : mux port map (
     I => I,
     S => S,
     Y => Y);
     
     process
       begin
         
         I<="10001010"; S<="111";
         wait for 10 ns;
         
         I<="10101010"; S<="101";
         wait for 10 ns;
         
         I<="10001110"; S<="011";
         wait for 10 ns;
         
         I<="11101010"; S<="100";
         wait for 10 ns;
         
         I<="01001010"; S<="001";
         wait for 10 ns;
         
         I<="11110010"; S<="010";
         wait for 10 ns;
         
         I<="10101110"; S<="110";
         wait for 10 ns;
         
         I<="01001010"; S<="111";
         wait for 10 ns;
         
         I<="11101010"; S<="000";
         wait for 10 ns;
         
         I<="11001011"; S<="000";
         wait for 10 ns;
         
         I<="10001010"; S<="111";
         wait for 10 ns;
         
         wait;
         
    end process;
    
  end architecture mux_tb_arc;