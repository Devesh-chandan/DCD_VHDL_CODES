----------------------------------------------------------------------------------
-- File: mux_21_if_behav.vhd
-- Description: 2:1 Multiplexer in Behavioral mode using simple "if" logic.
-- Reference: Brown, Page 352, Fig 6.39
-- Approach: Behavioral Modeling (default assignment, unclosed if)
-- 
-- Employs a process utilizing a default value assignment ahead of a standalone 
-- "if" structure without an "else". This allows overriding values dynamically.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_21_if_behav is
    Port ( i0  : in  STD_LOGIC;
           i1  : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           y   : out STD_LOGIC);
end mux_21_if_behav;

architecture Behavioral of mux_21_if_behav is
begin
    -- Requires sensitivity to all combinatorial inputs to react upon value change
    process(i0, i1, sel)
    begin
        -- Start with a default assignment. If logic evaluates to false, 
        -- the signal retains this value.
        y <= i0; 
        
        -- Override the default condition if the test logic evaluates true.
        if (sel = '1') then 
            y <= i1;
        end if;
        
    end process;
end Behavioral;
