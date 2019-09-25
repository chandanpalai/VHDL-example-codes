library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity ram4x5_tb is
end entity ram4x5_tb;
 
architecture behavior of ram4x5_tb is 
 
    component ram4x5
   port(
		din : in  std_logic_vector(m-1 downto 0);
		clk : in  std_logic;
		add : in  std_logic_vector(n-1 downto 0);
		we  : in  std_logic;
		dout: out std_logic_vector(m-1 downto 0));
    end component;
    
   signal din : std_logic_vector(m-1 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal add : std_logic_vector(n-1 downto 0) := (others => '0');
   signal we : std_logic := '0';
   signal dout : std_logic_vector(m-1 downto 0);
 
BEGIN
 
   u0: ram4x5 port map (
          din => din,
          clk => clk,
          add => add,
          we => we,
          dout => dout
        );

 process
   begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
   end process;
 

 process
   begin		

din<="01011"; we<='1'; add<="11"; 
wait for 20 ns;

din<="01001"; we<='1'; add<="01"; 
wait for 20 ns;  

din<="11110"; we<='1'; add<="00"; 
wait for 20 ns;

din<="01001"; we<='1'; add<="10"; 
wait for 20 ns;

din<="00101"; we<='0'; add<="10"; 
wait for 20 ns;

din<="10101"; we<='0'; add<="10"; 
wait for 20 ns;

din<="01000"; we<='0'; add<="00";
wait for 20 ns;

din<="00111"; we<='0'; add<="11";
wait for 20 ns;

din<="01110"; we<='1'; add<="01";
wait for 20 ns;

din<="11011"; we<='1'; add<="11";
wait for 20 ns;

din<="00101"; we<='1'; add<="10";
wait for 20 ns;

din<="10101"; we<='1'; add<="00";
wait for 20 ns;

din<="11111"; we<='0'; add<="10";
wait for 20 ns;

din<="00000"; we<='0'; add<="01";
wait for 20 ns;

din<="01000"; we<='1'; add<="10";
wait for 20 ns;

      wait;
   end process;

END;
