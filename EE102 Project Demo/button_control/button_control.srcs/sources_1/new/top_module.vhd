library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_top is
    Port (
        clk       : in  STD_LOGIC;  -- 100 MHz
        reset     : in  STD_LOGIC;
        btn_down  : in  STD_LOGIC;  -- '1' = pressed
        btn_top   : in  STD_LOGIC;  -- '1' = pressed
        btn_left  : in  STD_LOGIC;  -- '1' = pressed
        btn_right : in  STD_LOGIC;  -- '1' = pressed
        servo     : out STD_LOGIC;
        servo2    : out STD_LOGIC
    );
end servo_top;

architecture Behavioral of servo_top is

    component clk180kHz is
        Port (
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            clk_out : out STD_LOGIC
        );
    end component;

    component servo_control_buttons_step is
        PORT(
            clk       : IN  STD_LOGIC;
            reset     : IN  STD_LOGIC;
            btn_left  : IN  STD_LOGIC;
            btn_right : IN  STD_LOGIC;
            pos       : OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component button_top_down is
        PORT(
            clk      : IN  STD_LOGIC;
            reset    : IN  STD_LOGIC;
            btn_down : IN  STD_LOGIC;
            btn_top  : IN  STD_LOGIC;
            pos2     : OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component servo_pwm is
        PORT (
            clk   : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            pos   : IN  STD_LOGIC_VECTOR(7 downto 0);
            servo : OUT STD_LOGIC
        );
    end component;

    component servo_pwm2 is
        PORT (
            clk   : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            pos2  : IN  STD_LOGIC_VECTOR(7 downto 0);
            servo2: OUT STD_LOGIC
        );
    end component;

    signal clk_180kHz : STD_LOGIC;
    signal pos_sig    : STD_LOGIC_VECTOR(7 downto 0);
    signal pos_sig2   : STD_LOGIC_VECTOR(7 downto 0);

begin

    clk_div_inst : clk180kHz
        port map (
            clk     => clk,
            reset   => reset,
            clk_out => clk_180kHz
        );

    -- Horizontal servo with left/right
    button_logic_inst : servo_control_buttons_step
        port map (
            clk       => clk,
            reset     => reset,
            btn_left  => btn_left,
            btn_right => btn_right,
            pos       => pos_sig
        );

    -- Vertical servo with top/down
    button_logic_inst2 : button_top_down
        port map (
            clk      => clk,
            reset    => reset,
            btn_down => btn_down,
            btn_top  => btn_top,
            pos2     => pos_sig2
        );

    pwm_inst : servo_pwm
        port map (
            clk   => clk_180kHz,
            reset => reset,
            pos   => pos_sig,
            servo => servo
        );

    pwm_inst2 : servo_pwm2
        port map (
            clk   => clk_180kHz,
            reset => reset,
            pos2  => pos_sig2,
            servo2=> servo2
        );
end Behavioral;
