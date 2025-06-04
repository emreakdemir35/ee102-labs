library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_pwm2 is
    Port (
        clk   : IN  STD_LOGIC;                     -- 180 kHz clock
        reset : IN  STD_LOGIC;
        pos2  : IN  STD_LOGIC_VECTOR(7 downto 0);  -- 0..180
        servo2: OUT STD_LOGIC
    );
end servo_pwm2;

architecture Behavioral of servo_pwm2 is

    signal cnt          : unsigned(11 downto 0) := (others => '0');  -- 0..3599
    signal pwmi         : unsigned(11 downto 0);
    signal pos2_clamped : unsigned(7 downto 0);

begin

    ----------------------------------------------------------------------------
    -- (Optional) Clamp pos2 within [0..180] to avoid invalid PWM range
    ----------------------------------------------------------------------------
    process(pos2)
    begin
        if unsigned(pos2) > 180 then
            pos2_clamped <= to_unsigned(180, 8);
        else
            pos2_clamped <= unsigned(pos2);
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- Convert pos2_clamped to PWM ticks:
    -- 0°   => 0.5 ms =>  90 ticks
    -- 180° => 2.5 ms => 450 ticks
    ----------------------------------------------------------------------------
    pwmi <= resize(pos2_clamped * 2 + to_unsigned(90, 7), 12);

    ----------------------------------------------------------------------------
    -- Count 0..3599 for 3600 ticks at 180 kHz => 20 ms total cycle
    ----------------------------------------------------------------------------
    process(clk, reset)
    begin
        if reset = '1' then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            if cnt = to_unsigned(3599, 12) then
                cnt <= (others => '0');
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- Servo output = '1' while cnt < pwmi, else '0'
    ----------------------------------------------------------------------------
    servo2 <= '1' when (cnt < pwmi) else '0';

end Behavioral;
