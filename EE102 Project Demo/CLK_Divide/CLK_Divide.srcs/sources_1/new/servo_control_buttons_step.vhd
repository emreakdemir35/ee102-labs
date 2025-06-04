library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_control_buttons_step is
    PORT(
        clk       : IN  STD_LOGIC;
        reset     : IN  STD_LOGIC;
        btn_left  : IN  STD_LOGIC;
        btn_right : IN  STD_LOGIC;
        pos       : OUT STD_LOGIC_VECTOR(6 downto 0)
    );
end servo_control_buttons_step;

architecture Behavioral of servo_control_buttons_step is
    signal position       : unsigned(6 downto 0) := to_unsigned(90, 7);  -- Start at 90°
    constant STEP_SIZE    : unsigned(6 downto 0) := to_unsigned(15, 7);
    constant MIN_POSITION : unsigned(6 downto 0) := to_unsigned(0, 7);
    constant MAX_POSITION : unsigned(6 downto 0) := to_unsigned(180, 7);

    signal btn_left_prev  : std_logic := '1';
    signal btn_right_prev : std_logic := '1';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            position <= to_unsigned(90, 7); -- Center
            btn_left_prev  <= '1';
            btn_right_prev <= '1';
        elsif rising_edge(clk) then
            -- Rising edge detect (active-low)
            if btn_left = '0' and btn_left_prev = '1' then
                if position > MIN_POSITION + STEP_SIZE then
                    position <= position - STEP_SIZE;
                else
                    position <= MIN_POSITION;
                end if;
            elsif btn_right = '0' and btn_right_prev = '1' then
                if position < MAX_POSITION - STEP_SIZE then
                    position <= position + STEP_SIZE;
                else
                    position <= MAX_POSITION;
                end if;
            end if;

            btn_left_prev  <= btn_left;
            btn_right_prev <= btn_right;
        end if;
    end process;

    pos <= std_logic_vector(position);
end Behavioral;
