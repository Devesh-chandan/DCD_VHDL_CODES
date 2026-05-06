library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UpDownCounter is
		port(clk:in STD_LOGIC;
		  		reset : in STD_LOGIC;
          M:in STD_LOGIC;
          count: out STD_LOGIC_VECTOR(3 downto 0));
end UpDownCounter;

architecture BEhavioral of UpDownCounter is
     signal temp_count:unsigned(3 downto 0) :="0000";
begin
     process(clk,reset)
     begin
     if reset='1' then
        temp_count<="0000";
     elsif rising_edge(clk)then 
     if M='0' then
        temp_count<=temp_count+1;
     else
        temp_count<=temp_count-1;
     end if;
end if;
end process;
count <=std_logic_vector(temp_count);
end Behavioral;
