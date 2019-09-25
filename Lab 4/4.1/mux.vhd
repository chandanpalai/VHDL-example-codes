library ieee;
use ieee.std_logic_1164.all;

entity mux is
  
  port (
    I : in  std_logic_vector(7 downto 0);  -- input
    S : in  std_logic_vector(2 downto 0);  -- input
    Y : out std_logic);                    -- output

end entity mux;

architecture mux_arc of mux is

  
begin  -- architecture mux_arc

  process(S,I)
    begin
      
      case S is
        when "000" => Y<=I(0);
       when "001" => Y<=I(1);
       when "010" => Y<=I(2);
       when "011" => Y<=I(3);
       when "100" => Y<=I(4);
       when "101" => Y<=I(5);
       when "110" => Y<=I(6);
       when "111" => Y<=I(7);  
       when others => NULL;
    end case;
      
 end process; 
end architecture mux_arc;
