library ieee;
use ieee.std_logic_1164.all;

entity fa4fa is
  generic (
    m : integer := 3);
  
  port (
    A     : in  std_logic_vector(m downto 0);  -- input
    B     : in  std_logic_vector(m downto 0);  -- input
    Cin   : in  std_logic;                     -- input
    S     : out std_logic_vector(m downto 0);  -- output
    Carry : out std_logic);                    -- output

end entity fa4fa;

architecture fa4fa_arc of fa4fa is

  component faha is

     port (
    A     : in  std_logic;              -- input
    B     : in  std_logic;              -- input
    Cin   : in  std_logic;              -- input
    Carry : out std_logic;              -- output
    Sum   : out std_logic);             -- output
     
  end component faha;

  signal temp : std_logic_vector(m downto 0) ;
  
begin  -- architecture fa4fa_arc

U_loop: for i in 0 to m generate
   l1: if (i=0) generate
     u0 : faha port map (
    A     => A(i),
    B     => B(i),
    Cin   => Cin,
    Sum   => S(i),
    Carry => temp(i));
  end generate l1;

   l2: if ((i>0) and (i<m)) generate

        
     u1 : faha 
       port map (
    A     => A(i),
    B     => B(i),
    Cin   => temp(i-1),
    Sum   => S(i),
    Carry => temp(i));
   end generate l2;

    l3: if (i=m) generate

     u3 : faha port map (
    A     => A(i),
    B     => B(i),
    Cin   => temp(i-1),
    Sum   => S(i),
    Carry => Carry);
    end generate l3;
end generate U_loop;
  
 


   --  u2 : faha port map (
   -- A     => A(2),
   -- B     => B(2),
   -- Cin   => temp2,
   -- Sum   => S(2),
   -- Carry => temp3);

    
end architecture fa4fa_arc;
