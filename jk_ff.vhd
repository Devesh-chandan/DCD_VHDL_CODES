----------------------------------------------------------------------------------
-- File: jk_ff.vhd
-- Description: General JK Flip-Flop Implementation.
-- Reference: Extra task provided below Table 8
-- Type: Sequential Circuit
--
-- The JK Flip-Flop provides a more complex toggle mechanism than a D type.
-- This module has J (Set), K (Reset), Clock, and an Asynchronous Reset hook.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff is
    Port ( j   : in  STD_LOGIC;  -- Set input
           k   : in  STD_LOGIC;  -- Reset input
           clk : in  STD_LOGIC;  -- Clock signal
           rst : in  STD_LOGIC;  -- Asynchronous hardware reset
           q   : out STD_LOGIC); -- Current state
end jk_ff;

architecture Behavioral of jk_ff is
    -- Signal holding inner intermediate status because we need to read it back 
    -- in the toggle scenario. Ports formatted as 'out' cannot be read directly natively.
    signal q_int : STD_LOGIC;
begin
    process(clk, rst)
    begin
        -- Top priority: Hardware overriding reset
        if rst = '1' then
            q_int <= '0';
            
        -- Logic evaluated exactly on active system clock edge
        elsif rising_edge(clk) then
            
            -- Keep memory state unchanged
            if (j = '0' and k = '0') then
                q_int <= q_int; 
                
            -- Explicit hardware internal reset request via data lines
            elsif (j = '0' and k = '1') then
                q_int <= '0';
                
            -- Explicit hardware internal set request via data lines
            elsif (j = '1' and k = '0') then
                q_int <= '1';
                
            -- The defining trait of JK: complete state inversion if J, K are high.
            else
                q_int <= not q_int; 
                
            end if;
        end if;
    end process;
    
    -- Drive intermediate logic to external user port
    q <= q_int;
end Behavioral;
