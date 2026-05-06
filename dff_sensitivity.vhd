----------------------------------------------------------------------------------
-- File: dff_sensitivity.vhd
-- Description: Standard D-Flip Flop leveraging the sensitivity list.
-- Reference: Brown, Page 421, Fig 7.37
-- Type: Sequential Circuit
--
-- Relies solely on passing changes into the process list via clk events.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_sensitivity is
    Port ( d   : in  STD_LOGIC;  -- Data payload
           clk : in  STD_LOGIC;  -- System Clock
           q   : out STD_LOGIC); -- Stored State
end dff_sensitivity;

architecture Behavioral of dff_sensitivity is
begin
    -- Typical flip-flop approach involves solely adding the clock here 
    -- as there are no asynchronous inputs in this design.
    process(clk)
    begin
        -- Method 'rising_edge(clk)' filters explicitly against 0 -> 1 transitions.
        if rising_edge(clk) then
            q <= d; -- Store incoming data
        end if;
    end process;
end Behavioral;
