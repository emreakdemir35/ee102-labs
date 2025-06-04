library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity waveform_generator_tb is
end waveform_generator_tb;

architecture Behavioral of waveform_generator_tb is

    -- Component declaration
    component waveform_generator is
        Port (
            clk_in        : in  std_logic;
            reset         : in  std_logic;
            trigger       : in  std_logic;
            duration_sel  : in  std_logic_vector(1 downto 0);
            pulse_out     : out std_logic
        );
    end component;

    -- Signals
    signal clk_in_tb       : std_logic := '0';
    signal reset_tb        : std_logic := '0';
    signal trigger_tb      : std_logic := '0';
    signal duration_sel_tb : std_logic_vector(1 downto 0) := "01"; -- Start with 70 us
    signal pulse_out_tb    : std_logic;

    constant clk_period : time := 10 ns;  -- 100 MHz

begin

    -- Instantiate DUT
    uut: waveform_generator
        port map (
            clk_in       => clk_in_tb,
            reset        => reset_tb,
            trigger      => trigger_tb,
            duration_sel => duration_sel_tb,
            pulse_out    => pulse_out_tb
        );

    -- Clock generation
    clk_gen : process
    begin
        clk_in_tb <= '0';
        wait for clk_period / 2;
        clk_in_tb <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the system
        reset_tb <= '1';
        wait for 100 ns;
        reset_tb <= '0';

        -- Wait a bit and trigger 70 us pulse
        wait for 200 ns;
        duration_sel_tb <= "01"; -- 70 us
        trigger_tb <= '1';
        wait for clk_period;
        trigger_tb <= '0';

        wait for 100 us;

        -- Trigger 50 us pulse
        duration_sel_tb <= "00"; -- 50 us
        trigger_tb <= '1';
        wait for clk_period;
        trigger_tb <= '0';

        wait for 100 us;

        -- Trigger 80 us pulse
        duration_sel_tb <= "10"; -- 80 us
        trigger_tb <= '1';
        wait for clk_period;
        trigger_tb <= '0';

        wait for 100 us;

        -- End simulation
        wait;
    end process;

end Behavioral;
