library ieee;
use ieee.std_logic_1164.all;

entity t_l is
  
  port (
    pass   : in  std_logic;             -- input
    clk    : in  std_logic;             -- input
    rst    : in  std_logic;             -- input
    Red    : out std_logic;             -- output
    Green  : out std_logic;             -- output
    Yellow : out std_logic);            -- output

end entity t_l;

architecture t_l_arc of t_l is

  type state is (R,R_Y,G,G_Y);          -- states
  signal pre_state : state;
  
begin  -- architecture t_l_arc
process(clk,rst,pass)
  variable count : integer := 0;
  
  begin
  
  if (rst='1') then
    pre_state<=R;
    Red<='1';
    Yellow<='0';
    Green<='0';
    count:=0;

    elsif(clk'event and clk='1') then

      case pre_state is
		
        when R => Red<='1';Yellow<='0';Green<='0';
          count:=count+1;
			 
                  if ( pass='1' ) then
						pre_state<=G;
						
						elsif (count<20) then
                    pre_state<=R;
                    
						  else
                      pre_state<=R_Y;
                    end if;
                    
        when R_Y => Red<='1';Yellow<='1';Green<='0';
          count:=count+1;
                   if (count<2) then
                    pre_state<=R_Y;
                    else
                      pre_state<=G;
                    end if;

        when G => Red<='0';Yellow<='0';Green<='1';
          count:=count+1;
                   if (count<10 or pass='1') then
                    pre_state<=G;
                    else
                      pre_state<=G_Y;
                    end if;

         when G_Y => Red<='0';Yellow<='1';Green<='1';
          count:=count+1;
                   if (count<2) then
                    pre_state<=R_Y;
                    else
                      pre_state<=R;
                    end if;            

      end case;
    
  end if;
  
  end process;
  
end architecture t_l_arc;
