library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_top is
    Port (
        clk        : in  STD_LOGIC;  -- Input system clock (e.g., 100 MHz)
        reset      : in  STD_LOGIC;
        btn_left   : in  STD_LOGIC;
        btn_right  : in  STD_LOGIC;
        servo      : out STD_LOGIC
    );
end servo_top;

architecture Behavioral of servo_top is

    -- COMPONENT DECLARATIONS

    COMPONENT clk180kHz
        Port (
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            clk_out : out STD_LOGIC
        );
    END COMPONENT;

    COMPONENT servo_pwm
        PORT (
            clk   : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            pos   : IN  STD_LOGIC_VECTOR(6 downto 0);
            servo : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT servo_control_buttons_step
        PORT(
            clk       : IN  STD_LOGIC;
            reset     : IN  STD_LOGIC;
            btn_left  : IN  STD_LOGIC;
            btn_right : IN  STD_LOGIC;
            pos       : OUT STD_LOGIC_VECTOR(6 downto 0)
        );
    END COMPONENT;

    -- INTERNAL SIGNALS
    signal clk_divided : STD_LOGIC;
    signal pos_sig     : STD_LOGIC_VECTOR(6 downto 0);

begin

    -- INSTANTIATIONS

    clk_divider_inst : clk180kHz
        PORT MAP (
            clk     => clk,
            reset   => reset,
            clk_out => clk_divided
        );

    servo_ctrl_inst : servo_control_buttons_step
        PORT MAP (
            clk       => clk,
            reset     => reset,
            btn_left  => btn_left,
            btn_right => btn_right,
            pos       => pos_sig
        );

    pwm_inst : servo_pwm
        PORT MAP (
            clk   => clk_divided,
            reset => reset,
            pos   => pos_sig,
            servo => servo
        );

end Behavioral;
