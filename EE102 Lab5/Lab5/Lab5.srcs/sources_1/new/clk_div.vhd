library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_div is
    Port ( clk : in STD_LOGIC;      -- FPGA system clock (e.g., 100MHz)
           reset : in STD_LOGIC;    -- Reset signal (button)
           slow_clk : out STD_LOGIC -- Slower clock output
    );
end clk_div;

architecture Behavioral of clk_div is
    signal counter : INTEGER := 0;
    signal clk_internal : STD_LOGIC := '0';  -- Internal signal for slow clock
    constant MAX_COUNT : INTEGER := 5000; -- Adjust this for the desired frequency
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            clk_internal <= '0';
        elsif rising_edge(clk) then
            if counter = MAX_COUNT then
                clk_internal <= NOT clk_internal; -- Toggle the internal clock
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    slow_clk <= clk_internal; -- Assign internal signal to output port

end Behavioral;
