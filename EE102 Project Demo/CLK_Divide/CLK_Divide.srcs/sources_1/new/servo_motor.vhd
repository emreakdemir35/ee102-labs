library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_pwm is
    PORT (
        clk   : IN  STD_LOGIC;                   -- 180 kHz clock
        reset : IN  STD_LOGIC;
        pos   : IN  STD_LOGIC_VECTOR(6 downto 0); -- 7-bit position input (0-127)
        servo : OUT STD_LOGIC
    );
end servo_pwm;

architecture Behavioral of servo_pwm is
    signal cnt  : unsigned(11 downto 0);  -- 12 bits to count up to 3600
    signal pwmi : unsigned(11 downto 0);
begin
    -- Scale pos from 0-127 to 90-450
    pwmi <= resize((unsigned(pos) * 360) / 127 + 90, 12);

    -- 20 ms period counter (3600 cycles @ 180 kHz)
    counter: process (reset, clk)
    begin
        if reset = '1' then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            if cnt = 3599 then
                cnt <= (others => '0');
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    -- Generate PWM signal
    servo <= '1' when cnt < pwmi else '0';
end Behavioral;
