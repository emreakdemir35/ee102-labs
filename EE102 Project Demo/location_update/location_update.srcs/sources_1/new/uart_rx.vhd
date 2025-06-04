library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_rx is
    Port (
        clk      : in  std_logic;  -- e.g., 100 MHz
        reset    : in  std_logic;
        rx       : in  std_logic;  -- UART RX line
        rx_data  : out std_logic_vector(7 downto 0);
        rx_valid : out std_logic   -- pulses '1' for 1 clock when new data arrives
    );
end uart_rx;

architecture Behavioral of uart_rx is

    constant BAUD_RATE  : integer := 115200;
    constant CLOCK_FREQ : integer := 100_000_000;  -- Basys 3 default
    constant BIT_TICKS  : integer := CLOCK_FREQ / BAUD_RATE; -- ~868 for 115200

    type rx_state_type is (IDLE, START, DATA, STOP);
    signal rx_state  : rx_state_type := IDLE;
    signal bit_cnt   : integer range 0 to 7 := 0;    
    signal baud_cnt  : integer range 0 to BIT_TICKS-1 := 0;

    signal shift_reg : std_logic_vector(7 downto 0) := (others => '0');

    signal rx_data_reg  : std_logic_vector(7 downto 0) := (others => '0');
    signal rx_valid_reg : std_logic := '0';

begin

    rx_data  <= rx_data_reg;
    rx_valid <= rx_valid_reg;

    process(clk, reset)
    begin
        if reset = '1' then
            rx_state     <= IDLE;
            bit_cnt      <= 0;
            baud_cnt     <= 0;
            shift_reg    <= (others => '0');
            rx_data_reg  <= (others => '0');
            rx_valid_reg <= '0';

        elsif rising_edge(clk) then

            -- default every cycle
            rx_valid_reg <= '0';

            case rx_state is

                when IDLE =>
                    -- Wait for start bit (rx = '0')
                    if rx = '0' then
                        rx_state <= START;
                        baud_cnt <= 0;
                    end if;

                when START =>
                    -- Wait ~1.5 bit times total:
                    --  first half-bit to confirm still low, 
                    --  then proceed to sample in the middle of each bit
                    if baud_cnt = BIT_TICKS/2 then
                        if rx = '0' then
                            rx_state <= DATA;
                            bit_cnt  <= 0;
                        else
                            rx_state <= IDLE; -- false start
                        end if;
                        baud_cnt <= 0;
                    else
                        baud_cnt <= baud_cnt + 1;
                    end if;

                when DATA =>
                    if baud_cnt = BIT_TICKS-1 then
                        -- sample next bit
                        shift_reg(bit_cnt) <= rx;
                        baud_cnt <= 0;
                        if bit_cnt = 7 then
                            rx_state <= STOP;
                        else
                            bit_cnt <= bit_cnt + 1;
                        end if;
                    else
                        baud_cnt <= baud_cnt + 1;
                    end if;

                when STOP =>
                    -- finish last bit time for stop bit
                    if baud_cnt = BIT_TICKS-1 then
                        baud_cnt     <= 0;
                        rx_state     <= IDLE;
                        rx_data_reg  <= shift_reg;
                        rx_valid_reg <= '1';   -- signal that new data is ready
                    else
                        baud_cnt <= baud_cnt + 1;
                    end if;

            end case;
        end if;
    end process;

end Behavioral;
