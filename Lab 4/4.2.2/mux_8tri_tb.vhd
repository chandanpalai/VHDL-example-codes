library ieee;
use ieee.std_logic_1164.all;

entity mux_8tri_tb is
end entity mux_8tri_tb;

architecture mux_8tri_tb_arc of mux_8tri_tb is

component tri8_mux is
        
  port (
    I : in  std_logic_vector(3 downto 0);  -- input
    S : in  std_logic_vector(1 downto 0);  -- input
    Y : out std_logic);                    -- output

end component tri8_mux;

signal I : std_logic_vector(3 downto 0);  
signal S : std_logic_vector(1 downto 0); 
signal Y : std_logic;                   

begin
  u0 : tri8_mux port map (
      I=>I,
      S=>S,
    Y=>Y);
     
  process
    begin
      
      I<="0110"; S<="11";
      wait for 10 ns;
      
      I<="0110"; S<="01";
      wait for 10 ns;
      
      I<="1100"; S<="10";
      wait for 10 ns;
      
      I<="0010"; S<="00";
      wait for 10 ns;
      
      I<="0010"; S<="10";
      wait for 10 ns;
      
      I<="1000"; S<="11";
      wait for 10 ns;
      
      I<="0110"; S<="10";
      wait for 10 ns;
      
wait;
      
end process;

end architecture mux_8tri_tb_arc;      