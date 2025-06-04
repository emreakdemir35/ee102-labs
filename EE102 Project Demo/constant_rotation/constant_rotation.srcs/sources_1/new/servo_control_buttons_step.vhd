library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_control_buttons_step is
    PORT(
        clk       : IN  STD_LOGIC;
        reset     : IN  STD_LOGIC;
        btn_left  : IN  STD_LOGIC;
        btn_right : IN  STD_LOGIC;
        pos       : OUT STD_LOGIC_VECTOR(7 downto 0)
    );
end servo_control_buttons_step;

architecture Behavioral of servo_control_buttons_step is
    signal position       : unsigned(7 downto 0) := to_unsigned(90, 8);
    constant STEP_SIZE    : unsigned(7 downto 0) := to_unsigned(15, 8);
    constant MIN_POSITION : unsigned(7 downto 0) := to_unsigned(0, 8);
    constant MAX_POSITION : unsigned(7 downto 0) := to_unsigned(180, 8);

    signal delay_counter  : unsigned(23 downto 0) := (others => '0');
    constant DELAY_LIMIT  : unsigned(23 downto 0) := to_unsigned(4_000_000, 24);
    signal move_enable    : std_logic := '0';

begin
    process(clk, reset)
    begin
        if reset = '1' then
            position      <= to_unsigned(90, 8);
            delay_counter <= (others => '0');
            move_enable   <= '0';
        elsif rising_edge(clk) then
            if btn_left = '0' or btn_right = '0' then
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

            if move_enable = '1' then
                if btn_left = '0' and position >= STEP_SIZE then
                    position <= position - STEP_SIZE;
                elsif btn_right = '0' and position <= MAX_POSITION - STEP_SIZE then
                    position <= position + STEP_SIZE;
                end if;
            end if;
        end if;
    end process;

    pos <= std_logic_vector(position);
end Behavioral;