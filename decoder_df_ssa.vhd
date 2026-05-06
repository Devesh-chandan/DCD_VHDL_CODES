----------------------------------------------------------------------------------
-- File: decoder_df_ssa.vhd
-- Description: 2-to-4 Decoder modeling using Dataflow style.
-- Reference: J Bhaskar, Page 37, Fig 2.3.2
-- Approach: Simple Signal Assignment (SSA)
-- 
-- The dataflow modeling approach expresses the circuit behavior in terms of
-- boolean equations without instantiating lower-level components.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Main Entity
entity decoder_df_ssa is
    Port ( a  : in  STD_LOGIC_VECTOR (1 downto 0); -- 2-bit Input
           en : in  STD_LOGIC;                     -- Enable input
           y  : out STD_LOGIC_VECTOR (3 downto 0)  -- 4-bit Output
         );
end decoder_df_ssa;

-- Dataflow Architecture
architecture Dataflow of decoder_df_ssa is
begin
    -- Simple Signal Assignment (SSA)
    -- Evaluate continuous boolean expressions and assign them directly to outputs.
    
    -- Active for "00" input when enabled
    y(0) <= en and (not a(1)) and (not a(0));
    
    -- Active for "01" input when enabled
    y(1) <= en and (not a(1)) and a(0);
    
    -- Active for "10" input when enabled
    y(2) <= en and a(1) and (not a(0));
    
    -- Active for "11" input when enabled
    y(3) <= en and a(1) and a(0);

end Dataflow;
