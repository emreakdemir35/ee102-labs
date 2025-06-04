library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_main is
end tb_main;

architecture Behavioral of tb_main is
    -- Testbench signals
    signal reset, clk: std_logic;
    signal an: std_logic_vector(3 downto 0);
    signal cat: std_logic_vector(6 downto 0);
begin
    -- Instantiate DUT (Device Under Test)
    dut: entity work.top_module
        port map (
            clk => clk,
            reset => reset,
            an => an,
            cat => cat
        );

    -- Clock generation process (50 MHz -> 20 ns period)
    clock : process
    begin
        while true loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Simulation process (stimulus)
    sim: process
    begin
        -- Initial reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Let the system run and observe cathode outputs
        wait for 200 ms;  -- Run for a long enough time to observe all values

        -- Print cathode values (if simulator supports it)
        report "Simulation complete. Check waveform for cathode values." severity note;

        -- Stop simulation
        wait;
    end process;
end Behavioral;
