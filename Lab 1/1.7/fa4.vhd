library ieee;
use ieee.std_logic_1164.all;

entity fa4 is
  
  port (
    A     : in  std_logic_vector(3 downto 0);       -- input
    B     : in  std_logic_vector(3 downto 0);       -- input
    Cin   : in  std_logic;              -- input
    Sum   : out std_logic_vector(3 downto 0);       -- output
    Carry : out std_logic);             -- output

end entity fa4;

architecture fa4_arch of fa4 is

  signal C : std_logic_vector(2 downto 0);
  
begin  -- architecture fa4_arch

  Sum(0)<= A(0) xor B(0) xor Cin;
  C(0)<= (A(0) and B(0)) or (A(0) and Cin) or (B(0) and Cin);

   Sum(1)<= A(1) xor B(1) xor C(0);
  C(1)<= (A(1) and B(1)) or (A(1) and C(0)) or (B(1) and C(0));

   Sum(2)<= A(2) xor B(2) xor C(1);
  C(2)<= (A(2) and B(2)) or (A(2) and C(1)) or (B(2) and C(1));

    Sum(3)<= A(3) xor B(3) xor C(2);
  Carry<= (A(3) and B(3)) or (A(3) and C(2)) or (B(3) and C(2));

end architecture fa4_arch;
