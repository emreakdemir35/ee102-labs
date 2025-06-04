library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_control_buttons_step is
    PORT(
        clk       : IN  STD_LOGIC;
        reset     : IN  STD_LOGIC;
        btn_left  : IN  STD_LOGIC;  -- Active-high: '1' = pressed
        btn_right : IN  STD_LOGIC;  -- Active-high: '1' = pressed
        pos       : OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end servo_control_buttons_step;

architecture Behavioral of servo_control_buttons_step is

    signal position       : unsigned(7 downto 0) := to_unsigned(90, 8);  -- Start at 90° (neutral)
    constant STEP_SIZE    : unsigned(7 downto 0) := to_unsigned(15, 8);  -- Degrees per step
    constant MIN_POSITION : unsigned(7 downto 0) := to_unsigned(0, 8);   -- 0°
    constant MAX_POSITION : unsigned(7 downto 0) := to_unsigned(180, 8);-- 180°

    -- For repeating steps after a delay
    signal delay_counter : unsigned(24 downto 0) := (others => '0');
    constant DELAY_LIMIT : unsigned(24 downto 0) := to_unsigned(20_000_000, 25); 
    -- 20,000,000 ticks at 100 MHz = 0.2 s

    signal move_enable   : std_logic := '0';

begin

    process(clk, reset)
    begin
        if reset = '1' then
            position      <= to_unsigned(90, 8); -- neutral
            delay_counter <= (others => '0');
            move_enable   <= '0';

        elsif rising_edge(clk) then

            -- If left or right button is pressed ('1'), increment a counter.
            if (btn_left = '1') or (btn_right = '1') then
                if delay_counter = DELAY_LIMIT then
                    move_enable   <= '1';
                    delay_counter <= (others => '0');
                else
                    delay_counter <= delay_counter + 1;
                    move_enable   <= '0';
                end if;
            else
                delay_counter <= (others => '0');
                move_enable   <= '0';
            end if;

            -- When move_enable is set, step left or right
            if move_enable = '1' then
                if (btn_left = '1') and (position >= STEP_SIZE) then
                    position <= position - STEP_SIZE;
                elsif (btn_right = '1') and (position <= (MAX_POSITION - STEP_SIZE))
