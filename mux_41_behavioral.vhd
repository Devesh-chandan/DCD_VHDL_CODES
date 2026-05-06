library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4to1_behav is 
port(i:in STD_LOGIC_VECTOR(3 downto 0);
sel: in STD_LOGIC_VECTOR(1 downto 0);
y:out STD_LOGIC);
end Mux4to1_behav;

architecture Behavioral of Mux4to1_behav is
begin 
process(sel,i)
begin 
case sel is
when "00"=>y<=i(0);
when "01"=>y<=i(1);
when "10"=>y<=i(2);
when "11"=>y<=i(3);
when others=>y<='0';
end case;
end process;
end Behavioral;


