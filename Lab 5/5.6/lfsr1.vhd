library ieee;
use ieee.std_logic_1164.all;

entity lfsr1 is
  generic (m : integer := 4;
  ip : std_logic_vector(3 downto 0):= "1010"); 

port (
    clk : in  std_logic;                                     -- input
    rst : in  std_logic;                                     -- input
    Q   : out std_logic);                                    -- output

end entity lfsr1;

architecture lfsr1_arch of lfsr1 is

  component dffe is
  
  port (
    D   : in  std_logic;                -- input
    clk : in  std_logic;                -- input
    pre : in  std_logic;                -- input
	  rst : in  std_logic;                -- input
    Q   : out std_logic);               -- output

end component dffe;
  
  component my_xor is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end component my_xor;

signal temp,rtemp,ptemp : std_logic_vector(m-1 downto 0);
signal xtemp : std_logic;
begin

  u0 : dffe port map (
    D => xtemp,
    clk=>clk,
    pre=>ptemp(3),
    rst=>rtemp(3),
  Q=>temp(3));
  
  U_loop:for i in m-2 downto 0 generate
  
  u1 : dffe port map (
    D => temp(i+1),
    clk=>clk,
    pre=>ptemp(i),
    rst=>rtemp(i),
  Q=>temp(i));
  
end generate U_loop;

u2 : my_xor port map(
  A=>temp(3),
  B=>temp(0),
Y=>xtemp);


rtemp<=not ip when rst='1' else 
		(others =>'0');

ptemp<=ip when rst='1' else 
		(others =>'0');		

Q<=temp(0);

end;
