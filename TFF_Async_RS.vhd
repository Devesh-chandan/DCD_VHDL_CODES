library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TFF_Async_RS is
    Port ( T     : in  STD_LOGIC;
           clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           set   : in  STD_LOGIC;
           Q     : out STD_LOGIC);
end TFF_Async_RS;

architecture Behavioral of TFF_Async_RS is
    signal q_state : STD_LOGIC := '0';
begin
    process(clk, reset, set)
    begin
        if reset = '1' then
            q_state <= '0';
        elsif set = '1' then
            q_state <= '1';
        elsif rising_edge(clk) then
            if T = '1' then
                q_state <= not q_state;
            end if;
        end if;
    end process;
    Q <= q_state;
end Behavioral;