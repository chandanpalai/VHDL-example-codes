library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.lu_au.all;


entity arith_unit is 

port(
A   : in  std_logic_vector(3 downto 0);
B   : in  std_logic_vector(3 downto 0);
Cin : in  std_logic;
rst : in  std_logic;
Sle : in  std_logic_vector(2 downto 0);
Y   : out std_logic_vector(4 downto 0)
);

end entity arith_unit;

architecture arith_unit_arc of arith_unit is

begin

process(sle,rst,A,B,Cin)
  begin
    
if rst='1' then
Y<="00000";
else
case sle is

        when "000"=> transfer_A(A,Y);
        when "001"=> transfer_B(B,Y);
        when "010"=> increment_A(A,Y);
        when "011"=> increment_B(B,Y);
        when "100"=> decrement_A(A,Y);
        when "101"=> decrement_B(B,Y);
        when "110"=> add_A_B(A,B,Y);
        when "111"=> add_A_B_Cin(A,B,Cin,Y);
        when others=> Y <="00000";
        
end case;

end if;

end process;

end architecture arith_unit_arc;        