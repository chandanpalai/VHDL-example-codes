library ieee;
use ieee.std_logic_1164.all;

entity sequen is
  
  port (
    clk : in  std_logic;                      -- input
    rst : in  std_logic;                      -- input
    Q   : out std_logic;                      -- output
    F   : out std_logic_vector(3 downto 0));  -- output

end entity sequen;

architecture seque_arc of sequen is

  component dffrp is

    port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    rst : in  std_logic;                -- input
    pre : in  std_logic;                -- input
    Q   : out std_logic);               -- output

  end component dffrp;

  signal temp : std_logic_vector(2 downto 0);
  signal op : std_logic_vector(3 downto 0);
  signal i : std_logic;
   signal rst1 : std_logic_vector(3 downto 0);
   signal pre1 : std_logic_vector(3 downto 0);
begin  -- architecture seque_arc
  
  i <= ((not op(3)) and op(2) and (not op(0))) or ((not op(2)) and op(1) and (not op(0)));

  u0 : dffrp port map (
    D   => i,
    clk => clk,
    rst => rst1(3),
    pre => pre1(3),
    Q   => op(3));

   u1 : dffrp port map (
    D   => op(3),
    clk => clk,
    rst => rst1(2),
    pre => pre1(2),
    Q   => op(2));

  u2 : dffrp port map (
    D   => op(2),
    clk => clk,
    rst => rst1(1),
    pre => pre1(1),
    Q   => op(1));

  u3 : dffrp port map (
    D   => op(1),
    clk => clk,
    rst => rst1(0),
    pre => pre1(0),
    Q   => op(0));
   
    
    rst1 <= "0110" when rst='1' else
           "0000"; 
           
    pre1 <= "1001" when rst='1' else
           "0000"; 
    
    Q <=op(0);       
    F <=op; 
end architecture seque_arc;
