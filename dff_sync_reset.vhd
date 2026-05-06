----------------------------------------------------------------------------------
-- File: dff_sync_reset.vhd
-- Description: D-Flip Flop incorporating Synchronous Reset logic.
-- Reference: Brown, Page 423, Fig 7.40
-- Type: Sequential Circuit
--
-- A synchronous reset relies entirely on the primary clock. Therefore, the 
-- reset signal ONLY takes effect directly on the active clock edge.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_sync_reset is
    Port ( d   : in  STD_LOGIC; 
           clk : in  STD_LOGIC; 
           rst : in  STD_LOGIC; -- Synchronous Reset Line
           q   : out STD_LOGIC);
end dff_sync_reset;

architecture Behavioral of dff_sync_reset is
begin
    -- Because the reset does not operate independently of clock, the reset is NOT 
    -- included in the sensitivity list.
    process(clk)
    begin
        -- All evaluation is restricted only to the rising clock transition
        if rising_edge(clk) then
            
            -- Only on edge occurrence will the reset state be checked
            if (rst = '1') then
                q <= '0'; -- Perform clearing maneuver
            else
                q <= d;   -- Standard capture
            end if;
            
        end if;
    end process;
end Behavioral;
