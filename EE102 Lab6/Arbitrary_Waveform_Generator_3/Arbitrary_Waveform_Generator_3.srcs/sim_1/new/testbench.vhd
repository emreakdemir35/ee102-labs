library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    -- Signals for clock, reset, and output
    signal clk_i     : std_logic := '0';  -- Input clock
    signal rst_i     : std_logic := '1';  -- Reset signal
    signal dout_o    : std_logic;         -- Output clock

    -- Clock generation process for 100 MHz (period = 10 ns)
    constant clk_period : time := 100 ns;   -- Clock period is 10 ns (100 MHz)

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.clock_main
        port map (
            clk_in => clk_i,
            reset  => rst_i,
            dout_o => dout_o
        );

    -- Clock generation process: 100 MHz
    clk_proc: process
    begin
        while true loop
            clk_i <= '0';
            wait for clk_period / 2;
            clk_i <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Reset release after 100 ns
    reset_proc: process
    begin
        rst_i <= '1';  -- Assert reset
        wait for 10 ns;  -- Hold reset for 100 ns
        rst_i <= '0';  -- Deassert reset
        wait;
    end process;

end Behavioral;
