library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.lu_au.all;

entity logical_unit is 

port(
A   : in  std_logic_vector(3 downto 0);
B   : in  std_logic_vector(3 downto 0);
rst : in  std_logic;
Sle : in  std_logic_vector(2 downto 0);
Y   : out std_logic_vector(4 downto 0)
);

end entity logical_unit;

architecture logical_unit_arc of logical_unit is

begin

process(sle,rst,A,B)
  begin
    
if rst='1' then
Y<="00000";
else

case sle is
        when "000" => Y <= '0' & A_inv(A);
        when "001" => Y <= '0' & B_inv(B);
        when "010" => Y <= '0' & A_and_B(A,B);
        when "011" => Y <= '0' & A_or_B(A,B);
        when "100" => Y <= '0' & A_nand_B(A,B);
        when "101" => Y <= '0' & A_nor_B(A,B);
        when "110" => Y <= '0' & A_xor_B(A,B);
        when "111" => Y <= '0' & A_xnor_B(A,B);
        when others=> Y <= "00000";
        
end case;

end if;

end process;

end architecture logical_unit_arc;