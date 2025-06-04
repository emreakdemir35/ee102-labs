library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_top_dual is
    Port (
        clk       : in  std_logic;  -- 100 MHz
        reset     : in  std_logic;
        uart_rx   : in  std_logic;  -- from onboard USB-UART (pin B18 on Basys3)
        servo1    : out std_logic;  -- to servo #1
        servo2    : out std_logic   -- to servo #2
    );
end servo_top_dual;

architecture Behavioral of servo_top_dual is

    component clk180kHz is
        Port (
            clk     : in  std_logic;
            reset   : in  std_logic;
            clk_out : out std_logic
        );
    end component;

    component servo_uart_dual is
        Port (
            clk          : in  std_logic;
            reset        : in  std_logic;
            rx           : in  std_logic;
            servo_angle1 : out std_logic_vector(7 downto 0);
            servo_angle2 : out std_logic_vector(7 downto 0)
        );
    end component;

    component servo_pwm is
        Port (
            clk   : IN  STD_LOGIC;                  
            reset : IN  STD_LOGIC;
            pos   : IN  STD_LOGIC_VECTOR(7 downto 0);
            servo : OUT STD_LOGIC
        );
    end component;

    component servo_pwm2 is
        Port (
            clk   : IN  STD_LOGIC;                 
            reset : IN  STD_LOGIC;
            pos2  : IN  STD_LOGIC_VECTOR(7 downto 0);
            servo2: OUT STD_LOGIC
        );
    end component;

    signal clk_180khz : std_logic;
    signal angle1_sig : std_logic_vector(7 downto 0);
    signal angle2_sig : std_logic_vector(7 downto 0);

begin

    ----------------------------------------------------------------------------
    -- Divide down 100 MHz to 180 kHz for ~20 ms servo period
    ----------------------------------------------------------------------------
    clk_div_inst : clk180kHz
        port map(
            clk     => clk,
            reset   => reset,
            clk_out => clk_180khz
        );

    ----------------------------------------------------------------------------
    -- Collect two angles over UART
    ----------------------------------------------------------------------------
    servo_uart_inst : servo_uart_dual
        port map(
            clk          => clk,
            reset        => reset,
            rx           => uart_rx,
            servo_angle1 => angle1_sig,
            servo_angle2 => angle2_sig
        );

    ----------------------------------------------------------------------------
    -- PWM #1
    ----------------------------------------------------------------------------
    servo_pwm_inst : servo_pwm
        port map(
            clk   => clk_180khz,
            reset => reset,
            pos   => angle1_sig,
            servo => servo1
        );

    ----------------------------------------------------------------------------
    -- PWM #2
    ----------------------------------------------------------------------------
    servo_pwm_inst2 : servo_pwm2
        port map(
            clk   => clk_180khz,
            reset => reset,
            pos2  => angle2_sig,
            servo2 => servo2
        );

end Behavioral;
