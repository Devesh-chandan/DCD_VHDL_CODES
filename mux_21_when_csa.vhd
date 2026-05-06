----------------------------------------------------------------------------------
-- File: mux_21_when_csa.vhd
-- Description: 2:1 Multiplexer using Conditional Signal Assignment (when/else).
-- Reference: Brown, Page 344, Fig 6.31
-- Approach: Conditional Signal Assignment (CSA)
-- 
-- Dataflow style: Uses the concurrent "when...else" statement to enforce priority 
-- conditions determining what is driven onto the output.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_21_when_csa is
    Port ( i0  : in  STD_LOGIC; -- Input 0
           i1  : in  STD_LOGIC; -- Input 1
           sel : in  STD_LOGIC; -- Mode selection line
           y   : out STD_LOGIC  -- Chosen output
         );
end mux_21_when_csa;

architecture Dataflow of mux_21_when_csa is
begin
    -- Conditional Signal Assignment (CSA)
    -- Will evaluate boolean expressions in order.
    
    y <= i1 when (sel = '1')    -- Pass i1 if select line is active high
         else i0;               -- Otherwise pass i0
         
end Dataflow;
