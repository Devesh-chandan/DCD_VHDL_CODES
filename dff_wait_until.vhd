----------------------------------------------------------------------------------
-- File: dff_wait_until.vhd
-- Description: Standard D-Flip Flop leveraging the "wait until" statement.
-- Reference: Brown, Page 421, Fig 7.38
-- Type: Sequential Circuit
--
-- An alternative to using a sensitivity list is pausing process execution safely
-- using a "wait until" trigger.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_wait_until is
    Port ( d   : in  STD_LOGIC;  -- Payload
           clk : in  STD_LOGIC;  -- Clock signal
           q   : out STD_LOGIC); -- Register state
end dff_wait_until;

architecture Behavioral of dff_wait_until is
begin
    -- NOTE: NO sensitivity list. The wait statement defines the trigger.
    process
    begin
        -- Pauses interpretation within this block until next positive clock edge
        wait until (clk'event and clk='1');
        
        -- Store data inside register
        q <= d;
    end process;
end Behavioral;
