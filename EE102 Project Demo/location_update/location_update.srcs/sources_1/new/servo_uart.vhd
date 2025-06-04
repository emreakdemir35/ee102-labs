library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_uart_dual is
    Port (
        clk          : in  std_logic;               -- 100 MHz
        reset        : in  std_logic;
        rx           : in  std_logic;               -- from USB-UART
        servo_angle1 : out std_logic_vector(7 downto 0);
        servo_angle2 : out std_logic_vector(7 downto 0)
    );
end servo_uart_dual;

architecture Behavioral of servo_uart_dual is

    component uart_rx is
        Port (
            clk      : in  std_logic;
            reset    : in  std_logic;
            rx       : in  std_logic;
            rx_data  : out std_logic_vector(7 downto 0);
            rx_valid : out std_logic
        );
    end component;

    -- We'll store 2 angles in registers, default to 90 degrees each
    signal angle1_reg : unsigned(7 downto 0) := to_unsigned(90, 8);
    signal angle2_reg : unsigned(7 downto 0) := to_unsigned(90, 8);

    -- Output wires to hold the current received byte
    signal rx_data_i  : std_logic_vector(7 downto 0);
    signal rx_valid_i : std_logic;

    -- State machine to capture two bytes
    type rx_dual_state is (WAIT_BYTE1, WAIT_BYTE2);
    signal current_state : rx_dual_state := WAIT_BYTE1;

begin

    ----------------------------------------------------------------------------
    -- Instantiate the single-byte UART receiver
    ----------------------------------------------------------------------------
    uart_rx_inst : uart_rx
        port map(
            clk      => clk,
            reset    => reset,
            rx       => rx,
            rx_data  => rx_data_i,
            rx_valid => rx_valid_i
        );

    ----------------------------------------------------------------------------
    -- State machine captures two consecutive bytes:
    --   1st byte => servo_angle1
    --   2nd byte => servo_angle2
    ----------------------------------------------------------------------------
    process(clk, reset)
    begin
        if reset = '1' then
            angle1_reg    <= to_unsigned(90, 8);
            angle2_reg    <= to_unsigned(90, 8);
            current_state <= WAIT_BYTE1;

        elsif rising_edge(clk) then
            if rx_valid_i = '1' then
                case current_state is
                    when WAIT_BYTE1 =>
                        if unsigned(rx_data_i) <= 180 then
                            angle1_reg <= unsigned(rx_data_i);
                        else
                            angle1_reg <= to_unsigned(180, 8);
                        end if;
                        current_state <= WAIT_BYTE2;

                    when WAIT_BYTE2 =>
                        if unsigned(rx_data_i) <= 180 then
                            angle2_reg <= unsigned(rx_data_i);
                        else
                            angle2_reg <= to_unsigned(180, 8);
                        end if;
                        current_state <= WAIT_BYTE1;
                end case;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- Drive outputs
    ----------------------------------------------------------------------------
    servo_angle1 <= std_logic_vector(angle1_reg);
    servo_angle2 <= std_logic_vector(angle2_reg);

end Behavioral;
