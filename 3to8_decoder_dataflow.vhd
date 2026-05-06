library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity threeto8_deocder_dataflow is
port(
a : in  STD_LOGIC_VECTOR (2 downto 0); 
           y : out STD_LOGIC_VECTOR (7 downto 0));

end threeto8_deocder_dataflow;
architecture Dataflow of threeto8_deocder_dataflow is
begin 
with a select
y<="00000001" when "000",
"00000010" when "001",
"00000100" when "010",
"00001000" when "011",
"00010000" when "100",
"00100000" when "101",
"01000010" when "110",
"10000000" when "111",
"00000000" when others;

end Dataflow;
