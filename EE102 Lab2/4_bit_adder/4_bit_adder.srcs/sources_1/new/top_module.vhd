library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Top module entity declaration
entity top_module is
    Port ( 
        i_SW : in STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit input (two 8-bit numbers)
        clk  : in STD_LOGIC;                       -- Clock signal
        o_LED : out STD_LOGIC_VECTOR (4 downto 0)  -- 5-bit output (sum + carry)
    );
end top_module;

architecture Behavioral of top_module is

    -- Full Adder component declaration
    component full_adder is
        Port ( 
            Xi : in STD_LOGIC;
            Yi : in STD_LOGIC;
            Ci : in STD_LOGIC;
            Si : out STD_LOGIC;
            CiH : out STD_LOGIC
        );
    end component;

    -- Signal declarations
    signal i_SW_reg : STD_LOGIC_VECTOR(7 downto 0);
    signal c : STD_LOGIC_VECTOR(7 downto 0);  -- Carry signals for each adder
    signal sum : STD_LOGIC_VECTOR(7 downto 0);  -- Sum output from the adders

begin

    -- Process to capture input switches when clock edge occurs
    process(clk)
    begin
        if rising_edge(clk) then
            i_SW_reg <= i_SW;  -- Capture the current state of switches
        end if;
    end process;

    -- Instantiate 8 full adders for 8-bit addition
    -- For each full adder, connect the respective input and carry signals

    -- First full adder (Least significant bit)
    full_adder_1 : full_adder
        port map(
            Xi => i_SW_reg(0),
            Yi => '0',  -- Second number is assumed to be '0' for this example
            Ci => '0',  -- No carry-in for the first adder
            Si => sum(0),
            CiH => c(0)
        );

    -- Second full adder
    full_adder_2 : full_adder
        port map(
            Xi => i_SW_reg(1),
            Yi => '0',  -- Same as above, assuming second input is '0'
            Ci => c(0),
            Si => sum(1),
            CiH => c(1)
        );

    -- Third full adder
    full_adder_3 : full_adder
        port map(
            Xi => i_SW_reg(2),
            Yi => '0',
            Ci => c(1),
            Si => sum(2),
            CiH => c(2)
        );

    -- Fourth full adder
    full_adder_4 : full_adder
        port map(
            Xi => i_SW_reg(3),
            Yi => '0',
            Ci => c(2),
            Si => sum(3),
            CiH => c(3)
        );

    -- Fifth full adder
    full_adder_5 : full_adder
        port map(
            Xi => i_SW_reg(4),
            Yi => '0',
            Ci => c(3),
            Si => sum(4),
            CiH => c(4)
        );

    -- Sixth full adder
    full_adder_6 : full_adder
        port map(
            Xi => i_SW_reg(5),
            Yi => '0',
            Ci => c(4),
            Si => sum(5),
            CiH => c(5)
        );

    -- Seventh full adder
    full_adder_7 : full_adder
        port map(
            Xi => i_SW_reg(6),
            Yi => '0',
            Ci => c(5),
            Si => sum(6),
            CiH => c(6)
        );

    -- Eighth full adder (Most significant bit)
    full_adder_8 : full_adder
        port map(
            Xi => i_SW_reg(7),
            Yi => '0',
            Ci => c(6),
            Si => sum(7),
            CiH => c(7)
        );

    -- Output the sum and carry-out
    o_LED(3 downto 0) <= sum(3 downto 0);  -- Output lower 4 bits
    o_LED(4) <= c(7);                      -- Carry-out bit from the most significant bit

end Behavioral;
