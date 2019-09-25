library ieee;
use ieee.std_logic_1164.all;

entity fa4_tb is
  
end entity fa4_tb;

architecture fa4_tb_arch of fa4_tb is

  component fa4 is
    port (
    A     : in  std_logic_vector(3 downto 0);       -- input
    B     : in  std_logic_vector(3 downto 0);       -- input
    Cin   : in  std_logic;                          -- input
    Sum   : out std_logic_vector(3 downto 0);       -- output
    Carry : out std_logic);                         -- output
  end component fa4;

   signal  A     :  std_logic_vector(3 downto 0);       -- input
   signal  B     :  std_logic_vector(3 downto 0);       -- input
   signal  Cin   :  std_logic;                          -- input
   signal  Sum   :  std_logic_vector(3 downto 0);       -- output
   signal  Carry :  std_logic;                          -- output
begin  -- architecture fa4_tb_arch

  u0: fa4 port map (A,B,Cin,Sum,Carry);

  process
    begin
      A<="1001";B<="0110";Cin<='1';
      wait for 10 ns;
      A<="0001";B<="0110";Cin<='0';
      wait for 10 ns;
      A<="0001";B<="1111";Cin<='0';
      wait for 10 ns;
      A<="0110";B<="1110";Cin<='1';
      wait for 10 ns;
      A<="0111";B<="0100";Cin<='1';
      wait for 10 ns;
      A<="1111";B<="1111";Cin<='0';
      wait for 10 ns;

      wait;
    end process;
end architecture fa4_tb_arch;
