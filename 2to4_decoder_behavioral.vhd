library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwotoFour_decoder_behav is
port(a: in STD_LOGIC_VECTOR (1 downto 0);
y:out STD_LOGIC_VECTOR (3 downto 0));
end TwotoFour_decoder_behav;

architecture Behavioral of TwotoFour_decoder_behav is
begin 
process(a) 
begin 
case a is 
when "00"=> y <="0001";
when "01"=> y <="0010";
when "10"=> y <="0100";
when "11"=> y <="1000";
when others => y <="0000";
end case;
end process;
end Behavioral;

