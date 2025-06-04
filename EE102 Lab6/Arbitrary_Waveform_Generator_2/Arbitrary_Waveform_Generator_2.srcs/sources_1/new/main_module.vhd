library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity waveform_generator is
    Port (
        clk_in        : in  std_logic;         -- Main 100 MHz input clock
        reset         : in  std_logic;         -- Active-high reset
        trigger       : in  std_logic;         -- Signal to start pulse
        duration_sel  : in  std_logic_vector(1 downto 0); -- 00:50us, 01:70us, 10:80us
        pulse_out     : out std_logic          -- Output pulse
    );
end waveform_generator;

architecture Behavioral of waveform_generator is

    -- Clock signal from Clocking Wizard
    signal clk_100MHz     : std_logic;

    -- Signals for pulse logic
    signal pulse_active   : std_logic := '0';
    signal pulse_counter  : integer := 0;
    signal duration_target: integer := 7000;

    -- Clocking Wizard component (generated from IP catalog)
    component clk_wiz_0
        port (
            clk_in1    : in  std_logic;
            clk_out1   : out std_logic;
            reset      : in  std_logic;
            locked     : out std_logic
        );
    end component;

    signal clk_locked : std_logic;

begin

    -- Instantiate Clocking Wizard
    clk_wiz_inst : clk_wiz_0
        port map (
            clk_in1  => clk_in,
            clk_out1 => clk_100MHz,
            reset    => reset,
            locked   => clk_locked
        );

    -- Duration selection logic
    process(duration_sel)
    begin
        case duration_sel is
            when "00" => duration_target <= 5000; -- 50 us
            when "01" => duration_target <= 7000; -- 70 us
            when "10" => duration_target <= 8000; -- 80 us
            when others => duration_target <= 7000;
        end case;
    end process;

    -- Pulse generator logic
    process(clk_100MHz)
    begin
        if rising_edge(clk_100MHz) then
            if reset = '1' or clk_locked = '0' then
                pulse_active  <= '0';
                pulse_counter <= 0;
            elsif trigger = '1' and pulse_active = '0' then
                pulse_active  <= '1';
                pulse_counter <= 0;
            elsif pulse_active = '1' then
                if pulse_counter < duration_target then
                    pulse_counter <= pulse_counter + 1;
                else
                    pulse_active <= '0';
                end if;
            end if;
        end if;
    end process;

    pulse_out <= pulse_active;

end Behavioral;
