library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Sub-Module: XOR Gate
entity xor_gate is
    Port ( i1, i2 : in STD_LOGIC; o : out STD_LOGIC);
end xor_gate;
architecture Dataflow of xor_gate is
begin
    o <= i1 xor i2;
end Dataflow;

-- Sub-Module: AND Gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity and_gate is
    Port ( i1, i2 : in STD_LOGIC; o : out STD_LOGIC);
end and_gate;
architecture Dataflow of and_gate is
begin
    o <= i1 and i2;
end Dataflow;

-- Main Entity: Half Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ha_structural is
    Port ( a, b : in STD_LOGIC; sum, carry : out STD_LOGIC);
end ha_structural;

architecture Structural of ha_structural is
    component xor_gate
        Port ( i1, i2 : in STD_LOGIC; o : out STD_LOGIC);
    end component;
    
    component and_gate
        Port ( i1, i2 : in STD_LOGIC; o : out STD_LOGIC);
    end component;
begin
    U1: xor_gate port map (a, b, sum);
    U2: and_gate port map (a, b, carry);
end Structural;
