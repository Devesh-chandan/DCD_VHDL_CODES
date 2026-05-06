----------------------------------------------------------------------------------
-- File: mux_21_case_behav.vhd
-- Description: 2:1 Multiplexer via behavioral modeling using explicit case matching.
-- Reference: Brown, Page 356, Fig 6.45
-- Approach: Behavioral Case Pattern
-- 
-- A "case" statement works neatly when there is only one control line matching 
-- against exact finite values.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_21_case_behav is
    Port ( i0  : in  STD_LOGIC;
           i1  : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           y   : out STD_LOGIC);
end mux_21_case_behav;

architecture Behavioral of mux_21_case_behav is
begin
    -- Evaluates behavior sequentially whenever sensitive signals change.
    process(i0, i1, sel)
    begin
        -- The switch-case framework ensures full coverage over conditions.
        case sel is
            when '0' =>      -- First path chosen if switch is off
                y <= i0;
                
            when '1' =>      -- Alternative path taken if switch is on
                y <= i1;
                
            when others =>   -- Crucial fallback pattern for undef states/X/Z
                y <= '0';
        end case;
    end process;
end Behavioral;
