library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Full Adder Entity Declaration
entity full_adder is
    Port ( 
        Xi : in STD_LOGIC;       -- First input bit
        Yi : in STD_LOGIC;       -- Second input bit
        Ci : in STD_LOGIC;       -- Carry-in bit
        Si : out STD_LOGIC;      -- Sum output bit
        CiH : out STD_LOGIC      -- Carry-out bit
    );
end full_adder;

-- Full Adder Architecture (Behavioral)
architecture Behavioral of full_adder is
begin
    -- Process that describes the full adder behavior
    process(Xi, Yi, Ci)
    begin
        -- Sum (Si) is the XOR of the three inputs
        Si <= (Xi XOR Yi) XOR Ci;

        -- Carry-out (CiH) is calculated using the logic:
        -- Carry-out is the OR of:
        -- 1) The AND of Xi and Yi
        -- 2) The AND of the carry-in (Ci) and the XOR of Xi and Yi
        CiH <= (Xi AND Yi) OR (Ci AND (Xi XOR Yi));
    end process;
end Behavioral;
