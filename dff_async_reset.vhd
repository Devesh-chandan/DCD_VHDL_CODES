----------------------------------------------------------------------------------
-- File: dff_async_reset.vhd
-- Description: D-Flip Flop equipped with an Asynchronous Reset module.
-- Reference: Brown, Page 422, Fig 7.39
-- Type: Sequential Circuit
--
-- Asynchronous controls must act completely independently of the clock edge.
-- Hence, the reset signal is included in the sensitivity list alongside the clock.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_async_reset is
    Port ( d   : in  STD_LOGIC;  -- Input Data
           clk : in  STD_LOGIC;  -- Clock Event Trigger
           rst : in  STD_LOGIC;  -- Active High Asynchronous Reset
           q   : out STD_LOGIC); -- Data Output
end dff_async_reset;

architecture Behavioral of dff_async_reset is
begin
    -- Both signals are placed inside the list to enable instant evaluation if either changes.
    process(clk, rst)
    begin
        -- Highest priority is given to the asynchronous condition. It fires instantly 
        -- independently of the clock rising edge.
        if (rst = '1') then
            q <= '0';
            
        -- Second priority relies on normal clock operation
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
end Behavioral;
