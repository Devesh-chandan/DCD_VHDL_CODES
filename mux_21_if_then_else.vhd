----------------------------------------------------------------------------------
-- File: mux_21_if_then_else.vhd
-- Description: 2:1 Multiplexer in Behavioral mode using if-then-else.
-- Reference: Brown, Page 351, Fig 6.38
-- Approach: Behavioral Modeling
-- 
-- Employs a process block containing a sequential "if-then-else" statement.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_21_if_then_else is
    Port ( i0  : in  STD_LOGIC;
           i1  : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           y   : out STD_LOGIC);
end mux_21_if_then_else;

architecture Behavioral of mux_21_if_then_else is
begin
    -- The process re-evaluates anytime an input signal changes 
    -- (i0, i1, or sel are inside the sensitivity list)
    process(i0, i1, sel)
    begin
        -- Standard sequential if-then-else construct
        if (sel = '1') then    -- Checking if the selection line is HIGH
            y <= i1;           -- Route source 1 to output
        else
            y <= i0;           -- Route source 0 to output
        end if;
    end process;
end Behavioral;
