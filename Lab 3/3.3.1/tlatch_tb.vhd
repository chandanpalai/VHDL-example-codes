library ieee;
use ieee.std_logic_1164.all;

entity tlatchd_tb is
end entity tlatchd_tb;

architecture tlatchd_tb_arc of tlatchd_tb is

  component tlatch is

    generic ( de: time := 3ns);
    port (
    T  : in  std_logic;                 -- input
    En : in  std_logic;                 -- input
    Q  : out std_logic);                -- output
    
  end component tlatch;

  signal T,En : std_logic;
  signal Q : std_logic := '0';
  
begin  -- architecture tlatch_tb_arc

  u0 : tlatch port map (
    T  => T,
    En => En,
    Q  => Q);

  process
    begin

      En<='0';T<='0';
      wait for 10 ns;

       En<='1';T<='0';
      wait for 10 ns;

       En<='1';T<='1';
      wait for 10 ns;

       En<='0';T<='1';
      wait for 10 ns;

       En<='1';T<='1';
      wait for 10 ns;

       En<='0';T<='1';
      wait for 10 ns;

       En<='0';T<='0';
      wait for 10 ns;

       En<='1';T<='1';
      wait for 10 ns;

       En<='1';T<='0';
      wait for 10 ns;

       En<='0';T<='1';
      wait for 10 ns;

       En<='1';T<='1';
      wait for 10 ns;

      wait;

    end process;     

end architecture tlatchd_tb_arc;
