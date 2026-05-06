library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TwotoFour_decoder_dataflow is
port(
a:in STD_LOGIC_VECTOR (1 downto 0);
y:out STD_LOGIC_VECTOR (3 downto 0));
 end TwotoFour_decoder_dataflow;

architecture Dataflow of TwotoFour_decoder_dataflow is 
begin 

y(0)<= (not a(1)) and (not a(0));
y(1)<= (not a(1)) and a(0);
y(2)<= a(1) and (not a(0));
y(3)<= a(1) and a(0);



end Dataflow;
