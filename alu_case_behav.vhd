----------------------------------------------------------------------------------
-- File: alu_case_behav.vhd
-- Description: Example ALU behavior parameterized by a multi-bit opcode using case.
-- Reference: Brown, Page 360, Fig 6.48
-- Approach: Behavioral representation of larger combinational logic
-- 
-- Contains addition, subtraction, bitwise AND/OR/XOR and NOT mechanisms 
-- enclosed inside an ALU block governed by an opcode selector.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Allows math manipulation of standardized logic vectors

entity alu_case_behav is
    Port ( a      : in  STD_LOGIC_VECTOR (7 downto 0); -- Operand 1
           b      : in  STD_LOGIC_VECTOR (7 downto 0); -- Operand 2
           opcode : in  STD_LOGIC_VECTOR (2 downto 0); -- Control signal
           result : out STD_LOGIC_VECTOR (7 downto 0)  -- Computed answer
         );
end alu_case_behav;

architecture Behavioral of alu_case_behav is
begin
    -- Re-calculates on any variable change inside sensitivity list
    process(a, b, opcode)
    begin
        -- Utilizing "case" handles specific opcode matches elegantly
        case opcode is
            when "000" => 
                -- Addition: converting to unsigned ensures proper math
                result <= std_logic_vector(unsigned(a) + unsigned(b));
                
            when "001" => 
                -- Subtraction
                result <= std_logic_vector(unsigned(a) - unsigned(b));
                
            when "010" => 
                -- Logical AND (bitwise)
                result <= a and b;
                
            when "011" => 
                -- Logical OR (bitwise)
                result <= a or b;
                
            when "100" => 
                -- Logical XOR (exclusive OR, bitwise)
                result <= a xor b;
                
            when "101" => 
                -- Logical NOT (inverting 'a')
                result <= not a;
                
            when others => 
                -- Catch-all for undefined opcodes or metavalues => return zeros
                result <= (others => '0');
        end case;
    end process;
end Behavioral;
