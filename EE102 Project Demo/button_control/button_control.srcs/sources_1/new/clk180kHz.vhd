library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk180kHz is
    Port (
        clk     : in  STD_LOGIC;   -- 100 MHz input clock
        reset   : in  STD_LOGIC;
        clk_out : out STD_LOGIC    -- 180 kHz output clock
    );
end clk180kHz;

architecture Behavioral of clk180kHz is
    signal counter : integer range 0 to 278 := 0;
    signal clk_reg : std_logic := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            clk_reg <= '0';
        elsif rising_edge(clk) then
            if counter = 278 then
                counter <= 0;
                clk_reg <= not clk_reg;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;
end Behavioral;
