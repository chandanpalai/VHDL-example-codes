library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity textio is
  generic (
    m : integer := 6);
end entity;

architecture textio_arc of textio is

  component unishift is
  
  generic (
    m : integer := 6);

  port (
    Din      : in  std_logic_vector(m-1 downto 0);  -- input
    clk      : in  std_logic;                       -- input
    rst      : in  std_logic;                       -- input
    ld_shift : in  std_logic;                       -- input
    rs_ls    : in  std_logic ;                      -- input
    Dout     : out std_logic);                      -- output

end component unishift;

signal Din : std_logic_vector(m-1 downto 0); 
signal clk : std_logic;
signal rst : std_logic;
signal ld_shift : std_logic; 
signal rs_ls : std_logic;
signal Dout : std_logic;

file infile : text open read_mode is "infile.txt";
file outfile : text open write_mode is "output.txt";

begin
  
  u0 : unishift port map(
    Din=>Din,
    clk=>clk,
    rst=>rst,
    ld_shift=>ld_shift,
    rs_ls=>rs_ls,
    Dout=>Dout);
  
  process
  
  variable rline : line;
  variable wline : line;
  
  variable rst_w,clk_w : std_logic;
  variable str : string(1 to 11);
  variable Din_w : std_logic_vector(m-1 downto 0);
  
  begin
  
  readline (infile,rline);
  write(wline,string'("rst"),left,10);  
  write(wline,string'("Operation"),left,10); 
  write(wline,string'("Data"),left,10);
  write(wline,string'("Dout"),left,10);
  writeline(outfile,wline);
  while (not (endfile(infile))) loop
  readline(infile,rline);
  read(rline,rst_w);
  read(rline,clk_w);
  read(rline,str);
  read(rline,Din_w);
  
  rst<=rst_w;
  Din<=Din_w;
  
  case str(6 to 11) is
  
  when "RSHIFT"|"rshift" => ld_shift<='0'; rs_ls<='1';
  when "LSHIFT"|"lshift" => ld_shift<='0'; rs_ls<='0';
  when "  LOAD"|"  load" => ld_shift<='1';rs_ls<='1';
  when others=>null;
    
  end case;

  wait for 10 ns;
  
  write(wline,rst_w,left,10);
	write(wline,str,left,10);
  write(wline,Din_w,left,10);
  write(wline,Dout,left,10);
	writeline(outfile,wline);
	
	end loop;
--  wait;
  
end process;

process
  begin
    
    clk<='0';
    wait for 5 ns;
    clk<='1';
    wait for 5 ns;
end process;    


end architecture textio_arc;