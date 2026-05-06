----------------------------------------------------------------------------------
-- File: mux_21_with_select_ssa.vhd
-- Description: 2:1 Multiplexer using Selected Signal Assignment (with/select).
-- Reference: Brown, Page 341, Fig 6.27
-- Approach: Selected Signal Assignment (SSA)
-- 
-- Dataflow style: Uses the concurrent "with...select" construct to assign values
-- to the output based on the precise value of the select signal.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_21_with_select_ssa is
    Port ( i0  : in  STD_LOGIC;  -- Input 0
           i1  : in  STD_LOGIC;  -- Input 1
           sel : in  STD_LOGIC;  -- Select bit
           y   : out STD_LOGIC); -- Multiplexer output
end mux_21_with_select_ssa;

architecture Dataflow of mux_21_with_select_ssa is
begin
    -- Selected Signal Assignment structure
    with sel select
        -- Output is i0 when select is '0'
        y <= i0 when '0',
             -- Output is i1 when select is '1'
             i1 when '1',
             -- Recommended to handle "others" for robust simulation since
             -- STD_LOGIC has other states like 'U', 'X', 'Z', etc.
             '0' when others;
end Dataflow;
