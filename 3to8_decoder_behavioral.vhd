library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity threeto8_decoder_behavioral is
port (
a: in STD_LOGIC_VECTOR (2 downto 0);
y: out STD_LOGIC_VECTOR (7 downto 0));
end threeto8_decoder_behavioral;

architecture Behavioral of threeto8_decoder_behavioral is 
begin 
process(a)
begin 
case a is 
when "000" => y <= "00000001";
            when "001" => y <= "00000010";
            when "010" => y <= "00000100";
            when "011" => y <= "00001000";
            when "100" => y <= "00010000";
            when "101" => y <= "00100000";
            when "110" => y <= "01000000";
            when "111" => y <= "10000000";
            when others => y <= "00000000";
end case;
end process;
end Behavioral;


