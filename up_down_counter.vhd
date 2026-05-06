----------------------------------------------------------------------------------
-- File: up_down_counter.vhd
-- Description: Multidirectional N-bit counter with mode control toggle.
-- Reference: Extra task provided below Table 8
-- Type: Sequential Circuit
--
-- This counter is able to progress numeric value upward or downward. 
-- The direction of counting hinges around the incoming 'mode' flag.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Allows numeric increments (+) on data registers.

entity up_down_counter is
    Port ( clk   : in  STD_LOGIC;  -- Sequential advancement clock
           rst   : in  STD_LOGIC;  -- Async Reset Line
           mode  : in  STD_LOGIC;  -- High ('1') = Count UP, Low ('0') = Count DOWN
           count : out STD_LOGIC_VECTOR (7 downto 0)); -- Internal running count
end up_down_counter;

architecture Behavioral of up_down_counter is
    -- Unsigned is mandatory for mathematical numeric adjustments.
    -- Intermediaries are utilized to prevent direct output reads.
    signal count_int : unsigned(7 downto 0);
begin
    process(clk, rst)
    begin
        -- Highest priority clears the array completely.
        if rst = '1' then
            -- "Others => 0" initializes the entire 8-bit bus to zeroes efficiently.
            count_int <= (others => '0');
            
        -- Primary count logic only processes during shifting clock edges.
        elsif rising_edge(clk) then
            
            if mode = '1' then
                count_int <= count_int + 1; -- Count forwards/upwards
            else
                count_int <= count_int - 1; -- Count in reverse/downwards
            end if;
            
        end if;
    end process;
    
    -- Recast the unsigned intermediary back logically against the STD_LOGIC_VECTOR external port.
    count <= std_logic_vector(count_int);
    
end Behavioral;
