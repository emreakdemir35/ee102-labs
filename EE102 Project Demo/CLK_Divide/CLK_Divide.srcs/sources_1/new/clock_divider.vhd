

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk180kHz is
    Port (
        clk : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clk180kHz;

architecture Behavioral of clk180kHz is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 278 := 0;
begin
    frequency_divider: process (reset, clk) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk) then
            if (counter = 278) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end Behavioral;
