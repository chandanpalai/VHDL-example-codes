library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.abc.all;

entity mem is
  
 port(
		din : in  std_logic_vector(m-1 downto 0);
		clk : in  std_logic;
		en  : in  std_logic_vector((2**n)-1 downto 0);
		dout: out size((2**n)-1 downto 0));
		
end entity;

architecture mem_arc of mem is

component pipo is

  port (
    Din : in  std_logic_vector(m-1 downto 0);                  -- input
    clk : in  std_logic;                                       -- input
    en  : in  std_logic;                                       -- input
    Q   : out std_logic_vector(m-1 downto 0)                   -- output
	);               

end component pipo;

--signal temp_en : std_logic_vector((2**n)-1 downto 0);
--signal temp_out: size((2**n)-1 downto 0);

begin

 U_loop : for i in (2**n)-1 downto 0 generate
 
  u1 : pipo port map(
   Din => din,
   clk => clk,
   en => en(i),
   Q =>  dout(i)); 
   
 end generate;   

 end architecture mem_arc; 