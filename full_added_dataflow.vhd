library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_adder_dataflow is 
port (
a:in STD_LOGIC;
b:in STD_LOGIC;
cin:in STD_LOGIC;
sum: out STD_LOGIC;
cout: out STD_LOGIC);
end full_adder_dataflow;

architecture Dataflow of full_adder_dataflow is
begin 
sum<=a xor b xor cin;
cout<=(a and b) or (cin and (a xor b));
end Dataflow;


