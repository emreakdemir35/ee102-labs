library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_pwm is
    Port (
        clk   : IN  STD_LOGIC;                   -- 180 kHz clock
        reset : IN  STD_LOGIC;
        pos   : IN  STD_LOGIC_VECTOR(7 downto 0);-- 0..180
        servo : OUT STD_LOGIC
    );
end servo_pwm;

architecture Behavioral of servo_pwm is

    signal cnt        : unsigned(11 downto 0) := (others => '0'); -- 0..3599
    signal pwmi       : unsigned(11 downto 0);
    signal pos_clamped: unsigned(7 downto 0);

begin

    -- optional clamp if pos might exceed 180
    process(pos)
    begin
        if unsigned(pos) > 180 then
            pos_clamped <= to_unsigned(180, 8);
        else
            pos_clamped <= unsigned(pos);
        end if;
    end process;

    -- Map 0..180 -> 0.5..2.5 ms => 90..450 ticks
    pwmi <= resize(pos_clamped * 2 + to_unsigned(90, 7), 12);

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

    servo <= '1' when cnt < pwmi else '0';

end Behavioral;
