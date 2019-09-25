library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fa4fa_tb is
   generic (
    m : integer := 4);
end entity fa4fa_tb;

architecture fa4fa_tb_arc of fa4fa_tb is

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

  signal A,B,S : std_logic_vector(m-1 downto 0):=(others=>'0');
  signal Cin,Carry : std_logic:='0';
  
begin  -- architecture fa4fa_tb_arc

 u0 : fa4fa port map (
    A  => A,
    B  => B,
    Cin  => Cin,
    Carry => Carry,
    S  => S);
    
     process
    begin

      LA:for i in 0 to 2**m-2 loop
        A<=A+1;
        wait for 10 ns;
       LB:for j in 0 to 2**m-2 loop
        B<=B+1;
        wait for 10 ns; 
    end loop LB;
    end loop LA;
    Cin<=not Cin;
    
    end process;
end architecture fa4fa_tb_arc;
