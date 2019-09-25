library ieee;
use ieee.std_logic_1164.all;

entity lfsr is
  generic (m : integer := 4;
  ip : std_logic_vector(3 downto 0):= "1011"); 

port (
    clk : in  std_logic;                                     -- input
    rst : in  std_logic;                                     -- input
    Q   : out std_logic_vector(m-1 downto 0));                                    -- output

end entity lfsr;

architecture lfsr_arch of lfsr is

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

signal tempq,rtemp,ptemp : std_logic_vector(m-1 downto 0);
signal xtemp : std_logic;
begin

  u0 : dffe port map (
    D => xtemp,
    clk=>clk,
    pre=>ptemp(3),
    rst=>rtemp(3),
  Q=>tempq(3));
  
  U_loop:for i in m-2 downto 0 generate
  
  u1 : dffe port map (
    D => tempq(i+1),
    clk=>clk,
    pre=>ptemp(i),
    rst=>rtemp(i),
  Q=>tempq(i));
  
end generate U_loop;

u2 : my_xor port map(
  A=>tempq(3),
  B=>tempq(0),
Y=>xtemp);


rtemp<=not ip when rst='1' else 
		(others =>'0');

ptemp<=ip when rst='1' else 
		(others =>'0');		

Q<=tempq;

end;
