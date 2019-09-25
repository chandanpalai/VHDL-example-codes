library ieee;
use ieee.std_logic_1164.all;

entity mc_tb is
  
end entity mc_tb;

architecture mc_tb_arc of mc_tb is

  component mc is

    port (
    A : in  std_logic_vector(1 downto 0);  -- input
    B : in  std_logic_vector(1 downto 0);  -- input
    AequalB : out std_logic;                     -- A=B
    AlessthanB : out std_logic;                     -- A<B
    AmorethanB : out std_logic);                    -- A>B

  end component mc;

  signal A,B : std_logic_vector(1 downto 0) := "00";
  signal AequalB, AlessthanB, AmorethanB : std_logic := '0';
  
begin  -- architecture mc_tb_arc

u0 : mc port map (
  A => A,
  B => B,
  AequalB =>  AequalB,
  AlessthanB => AlessthanB,
  AmorethanB => AmorethanB);

process
  begin

    A<="00";B<="00";
    wait for 10 ns;

    A<="10";B<="01";
    wait for 10 ns;

    A<="01";B<="11";
    wait for 10 ns;

    A<="11";B<="11";
    wait for 10 ns;

    A<="01";B<="10";
    wait for 10 ns;

    A<="11";B<="10";
    wait for 10 ns;

    A<="11";B<="00";
    wait for 10 ns;
    
    A<="11";B<="11";
    wait for 10 ns;

    wait;
  end process;
  
end architecture mc_tb_arc;
