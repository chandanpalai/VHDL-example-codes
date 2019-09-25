library ieee;
use ieee.std_logic_1164.all;

entity multi is

generic (
    m : integer := 4);
  
  port (
    A     : in  std_logic_vector(m-1 downto 0);                           -- input
    B     : in  std_logic_vector(m-1 downto 0);                           -- input
    Y     : out std_logic_vector((2*m)-1 downto 0)                      -- output
  );
    
end entity multi;

architecture multi_arc of multi is

component fa4fa is
  generic (
    m : integer := 4);
  
  port (
    A     : in  std_logic_vector(m-1 downto 0);  -- input
    B     : in  std_logic_vector(m-1 downto 0);  -- input
    Cin   : in  std_logic;                     -- input
    S     : out std_logic_vector(m-1 downto 0);  -- output
    Carry : out std_logic);                    -- output

end component fa4fa;

component my_and is
  
  port (
    A : in  std_logic;                  -- input
    B : in  std_logic;                  -- input
    Y : out std_logic);                 -- output

end component my_and;

signal temp1,temp2,temp3,temp4,temp1f,temp2f,temp3f : std_logic_vector(m-1 downto 0);
signal tempf1,tempf2,tempf3 : std_logic_vector(m-1 downto 0);
signal tempc1,tempc2,tempc3 : std_logic;

begin

U_loop1 : for i in m-1 downto 0 generate
  
u0 : my_and port map(
  A => A(i),
  B => B(0),
  Y => temp1(i));
  
end generate U_loop1;

 U_loop2 : for i in m-1 downto 0 generate
  
u1 : my_and port map(
  A => A(i),
  B => B(1),
  Y => temp2(i));
  
end generate U_loop2;

 U_loop3 : for i in m-1 downto 0 generate
  
u2 : my_and port map(
  A => A(i),
  B => B(2),
  Y => temp3(i));
  
end generate U_loop3;   

 U_loop4 : for i in m-1 downto 0 generate
  
u3 : my_and port map(
  A => A(i),
  B => B(3),
  Y => temp4(i));
  
end generate U_loop4;

temp1f <= '0' & temp1(m-1 downto 1);

u4 : fa4fa port map(
   A => temp1f,
   B => temp2,
   Cin => '0',
   S => tempf1,
   Carry => tempc1);
  
temp2f<= tempc1 & tempf1(m-1 downto 1);  

u5 : fa4fa port map(
   A => temp2f,
   B => temp3,
   Cin => '0',
   S => tempf2,
   Carry => tempc2);  

temp3f<= tempc2 & tempf2(m-1 downto 1);

u6 : fa4fa port map(
   A => temp3f,
   B => temp4,
   Cin => '0',
   S => tempf3,
   Carry => tempc3); 	
   
 Y <= tempc3 & tempf3 & tempf2(0) & tempf1(0) & temp1(0);
 
end architecture multi_arc;