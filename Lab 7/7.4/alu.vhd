library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.lu_au.all;

entity alu is
 
 port(
        A     : in  std_logic_vector(3 downto 0);
        B     : in  std_logic_vector(3 downto 0);
        Cin   : in  std_logic;
        rst   : in  std_logic;
        Sle   : in  std_logic_vector(3 downto 0);
        Y     : out std_logic_vector(4 downto 0)
        );

end entity alu;

architecture alu_arc of alu is

component logical_unit is 

      port(
        A   : in  std_logic_vector(3 downto 0);
        B   : in  std_logic_vector(3 downto 0);
        rst : in  std_logic;
        Sle : in  std_logic_vector(2 downto 0);
        Y   : out std_logic_vector(4 downto 0)
        );

end component logical_unit;

component arith_unit is 

      port(
        A   : in  std_logic_vector(3 downto 0);
        B   : in  std_logic_vector(3 downto 0);
        Cin : in  std_logic;
        rst : in  std_logic;
        Sle : in  std_logic_vector(2 downto 0);
        Y   : out std_logic_vector(4 downto 0)
        );

end component arith_unit; 

component my_2x1 is
  
  port (
    A : in  std_logic_vector(4 downto 0);                  -- input
    B : in  std_logic_vector(4 downto 0);                  -- input
    C : in  std_logic;                                     -- input
    D : out std_logic_vector(4 downto 0));                 -- output

end component my_2x1;

signal temp1,temp2 : std_logic_vector(4 downto 0);

begin

u0 : logical_unit port map(
    A=>A,
    B=>B,
    rst=>rst,
    Sle=>Sle(2 downto 0),
    Y=>temp1);
    
u1 : arith_unit port map(
    A=>A,
    B=>B,
    Cin=>Cin,
    rst=>rst,
    Sle=>Sle(2 downto 0),
    Y=>temp2);    
    
u2 : my_2x1 port map(
     A=>temp2,
     B=>temp1,
     C=>Sle(3),
     D=>Y);
        
end architecture alu_arc;        