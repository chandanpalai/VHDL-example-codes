library ieee;
use ieee.std_logic_1164.all;

entity lfsr_fa_mux is

port(
  A  : in   std_logic_vector(3 downto 0);
  B  : in   std_logic_vector(3 downto 0);
  C  : in   std_logic;
  EM : in   std_logic;
  clk: in   std_logic;
  rst: in   std_logic;
  S  : out  std_logic_vector(3 downto 0);  
  Carry : out std_logic);                    
end entity;

architecture lfsr_fa_mux_arch of lfsr_fa_mux is

component lfsr is
  generic (m : integer := 4;
  ip : std_logic_vector(3 downto 0):= "1011"); 

port (
    clk : in  std_logic;                                     -- input
   	rst : in  std_logic;                                     -- input
    Q   : out std_logic_vector(m-1 downto 0));               -- output

end component lfsr; 

component lfsr1 is
  generic (m : integer := 4;
  ip : std_logic_vector(3 downto 0):= "1011"); 

port (
    clk : in  std_logic;                                     -- input
   	rst : in  std_logic;                                     -- input
    Q   : out std_logic);               -- output

end component lfsr1; 

component my_2x1 is
  
  port (
    I : in  std_logic_vector(1 downto 0);                  -- input
    S : in  std_logic;                                     -- input
    Y : out std_logic);                                    -- output

end component my_2x1;

component fa4fa is
  generic (
    m : integer := 3);
  
  port (
    A     : in  std_logic_vector(m downto 0);  -- input
    B     : in  std_logic_vector(m downto 0);  -- input
    Cin   : in  std_logic;                     -- input
    S     : out std_logic_vector(m downto 0);  -- output
    Carry : out std_logic);                    -- output

end component fa4fa;

signal temps,tempa,tempam : std_logic_vector(3 downto 0);
signal tempb,tempbm : std_logic_vector(3 downto 0);
signal tempc,tempcm,tempcy : std_logic;

begin

u0 : lfsr generic map(m=>4,ip=>"1010")
port map(
  clk=>clk,
  rst=>rst,
Q=>tempa);
U_loop1:for i in 3 downto 0 generate  
u1 : my_2x1 port map(
I(0)=>tempa(i),
I(1)=>A(i),
S=>EM,
Y=>tempam(i));
end generate U_loop1;

 
u2 : lfsr generic map(m=>4,ip=>"0110")
port map(
  clk=>clk,
  rst=>rst,
Q=>tempb);
U_loop2:for j in 3 downto 0 generate 
u3 : my_2x1 port map(
I(0)=>tempb(j),
I(1)=>B(j),
S=>EM,
Y=>tempbm(j));
end generate U_loop2;

u4 : lfsr1 generic map(m=>4,ip=>"0101")
port map(
  clk=>clk,
  rst=>rst,
Q=>tempc);

u5 : my_2x1 port map(
I(0)=>tempc,
I(1)=>C,
S=>EM,
Y=>tempcm);

u6 : fa4fa port map(
  A=>tempam,
  B=>tempbm,
  Cin=>tempcm,
  S=>temps,
Carry=>tempcy);
  
S<=temps;
Carry<=tempcy;
end architecture lfsr_fa_mux_arch;