library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package lu_au is 

function A_inv(A : std_logic_vector(3 downto 0)) return std_logic_vector;
function B_inv(B : std_logic_vector(3 downto 0)) return std_logic_vector;
function A_and_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector;
function A_or_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector;
function A_nand_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector;
function A_nor_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector;
function A_xor_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector;
function A_xnor_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector;
procedure transfer_A(A : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0));
procedure transfer_B(B : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0));
procedure increment_A(A : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0));
procedure increment_B(B : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0));
procedure decrement_A(A : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0));
procedure decrement_B(B : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0));
procedure add_A_B(A,B : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0));
procedure add_A_B_Cin(A,B : std_logic_vector(3 downto 0); Cin : std_logic; signal Y : out std_logic_vector(4 downto 0));

end package;

package body lu_au is

function A_inv(A : std_logic_vector(3 downto 0)) return std_logic_vector is
variable Y : std_logic_vector(3 downto 0);
begin
        Y:= not A;
        return Y;
end function;        
        
function B_inv(B : std_logic_vector(3 downto 0)) return std_logic_vector is
variable Y : std_logic_vector(3 downto 0);
begin
        Y:= not B;
        return Y;
end function;        

function A_and_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector is
variable Y : std_logic_vector(3 downto 0);
begin
        Y:= A and B;
        return Y;
end function;        

function A_or_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector is
variable Y : std_logic_vector(3 downto 0);
begin
        Y:= A or B;
        return Y;
end function;        

function A_nand_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector is
variable Y : std_logic_vector(3 downto 0);
begin
        Y:= not (A and B);
        return Y;
end function;        

function A_nor_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector is
variable Y : std_logic_vector(3 downto 0);
begin
        Y:= not (A or B);
        return Y;
end function;        

function A_xor_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector is
variable Y : std_logic_vector(3 downto 0);
begin
        Y:=A xor B;
        return Y;
end function;        

function A_xnor_B(A : std_logic_vector(3 downto 0);B : std_logic_vector(3 downto 0)) return std_logic_vector is
variable Y : std_logic_vector(3 downto 0);
begin
        Y:=A xnor B;
        return Y;
end function;        

procedure transfer_A(A : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0)) is
begin 
        Y<= '0' & A;
end procedure;         

procedure transfer_B(B : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0)) is
begin 
        Y<= '0' & B;
end procedure;     

procedure increment_A(A : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0)) is
begin 
        Y<= conv_std_logic_vector((conv_integer(A) + 1),5);
end procedure;             

procedure increment_B(B : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0)) is
begin 
        Y<= conv_std_logic_vector((conv_integer(B) + 1),5);
end procedure;             

procedure decrement_A(A : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0)) is
begin 
        Y<= conv_std_logic_vector((conv_integer(A) - 1),5);
end procedure;    

procedure decrement_B(B : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0)) is
begin 
        Y<= conv_std_logic_vector((conv_integer(B) - 1),5);
end procedure;                      

procedure add_A_B(A,B : std_logic_vector(3 downto 0); signal Y : out std_logic_vector(4 downto 0)) is
begin 
        Y<= conv_std_logic_vector((conv_integer(A) + conv_integer(B)),5);
end procedure;             

procedure add_A_B_Cin(A,B : std_logic_vector(3 downto 0); Cin : std_logic; signal Y : out std_logic_vector(4 downto 0)) is
  begin

    Y        <= conv_std_logic_vector((conv_integer(A)+conv_integer(B)+conv_integer(Cin)), 5);
end procedure;             

end lu_au;