library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2to1_dataflow is
port( a:in STD_LOGIC;
b:in STD_LOGIC;
sel:in STD_LOGIC;
y:out STD_LOGIC);
end Mux2to1_dataflow;

architecture Dataflow of Mux2to1_dataflow is
begin
y<=a when (sel='0') else b;
end Dataflow;
