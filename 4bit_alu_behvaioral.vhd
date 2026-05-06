library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fourbitalu_behavioral is
port (
a:in STD_LOGIC_VECTOR (3 downto 0);
b: in STD_LOGIC_VECTOR ( 3 downto 0);
sel: in STD_LOGIC_VECTOR( 1 downto 0);
res : out STD_LOGIC_VECTOR ( 3 downto 0));
end fourbitalu_behavioral;

architecture Behavioral of fourbitalu_behavioral is 
begin 
process(a,b,sel)
begin
case sel is 
when "00" => res <= STD_LOGIC_VECTOR(unsigned(a)+ unsigned(b));
when "01" => res <= STD_LOGIC_VECTOR(unsigned(a) - unsigned(b));
when "10" => res <= a and b;
when "11" => res <=a or b;
when others => res<="0000";
end case;
end  process;
end Behavioral;

