library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Define sub-modules first so the main entity can "see" them
entity not_gate is 
    Port ( i : in STD_LOGIC; o : out STD_LOGIC); 
end not_gate;
architecture Dataflow of not_gate is 
begin 
    o <= not i; 
end Dataflow;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity and3_gate is 
    Port ( i1, i2, i3 : in STD_LOGIC; o : out STD_LOGIC); 
end and3_gate;
architecture Dataflow of and3_gate is 
begin 
    o <= i1 and i2 and i3; 
end Dataflow;

-- Now define the Main Entity
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity decoder_struct is
    Port ( a  : in  STD_LOGIC_VECTOR(1 downto 0);
           en : in  STD_LOGIC;
           y  : out STD_LOGIC_VECTOR(3 downto 0));
end decoder_struct;

architecture Structural of decoder_struct is
    signal not_a : STD_LOGIC_VECTOR(1 downto 0);
    
    component not_gate
        Port ( i : in STD_LOGIC; o : out STD_LOGIC);
    end component;
    
    component and3_gate
        Port ( i1, i2, i3 : in STD_LOGIC; o : out STD_LOGIC);
    end component;
begin
    U_NOT0: not_gate port map (a(0), not_a(0));
    U_NOT1: not_gate port map (a(1), not_a(1));
    
    U_AND0: and3_gate port map (en, not_a(1), not_a(0), y(0));
    U_AND1: and3_gate port map (en, not_a(1), a(0),     y(1));
    U_AND2: and3_gate port map (en, a(1),     not_a(0), y(2));
    U_AND3: and3_gate port map (en, a(1),     a(0),     y(3));
end Structural;
