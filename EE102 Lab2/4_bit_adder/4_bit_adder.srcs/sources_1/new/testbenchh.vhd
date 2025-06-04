library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench entity (No ports, as it is used for simulation)
entity tb_top_module is
end tb_top_module;

architecture behavior of tb_top_module is

    -- Component Declaration for the Unit Under Test (UUT)
    component top_module is
        Port ( 
            i_SW : in STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit input
            clk  : in STD_LOGIC;                       -- Clock signal
            o_LED : out STD_LOGIC_VECTOR (4 downto 0)  -- 5-bit output (sum + carry)
        );
    end component;

    -- Signals to connect to UUT
    signal i_SW : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- Input signal initialized to 0
    signal clk  : STD_LOGIC := '0';  -- Clock signal initialized to 0
    signal o_LED : STD_LOGIC_VECTOR(4 downto 0);  -- Output signal to monitor

    -- Clock period (10 ns for this example)
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: top_module
        Port map (
            i_SW => i_SW,
            clk => clk,
            o_LED => o_LED
        );

    -- Clock Generation Process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus Process to apply test cases
    stim_proc: process
    begin
        -- Test Case 1: Adding 00000000 + 00000000
        i_SW <= "00000000";  -- Input value 0
        wait for 20 ns;  -- Wait for the clock to trigger

        -- Test Case 2: Adding 00000001 + 00000001
        i_SW <= "00000001";  -- Input value 1
        wait for 20 ns;

        -- Test Case 3: Adding 00001111 + 00001111
        i_SW <= "00001111";  -- Input value 15
        wait for 20 ns;

        -- Test Case 4: Adding 11111111 + 00000001 (max value for 8-bit + 1)
        i_SW <= "11111111";  -- Input value 255
        wait for 20 ns;

        -- Test Case 5: Adding 10000000 + 10000000
        i_SW <= "10000000";  -- Input value 128
        wait for 20 ns;

        -- Test Case 6: Adding 01010101 + 10101010 (random values)
        i_SW <= "01010101";  -- Input value 85
        wait for 20 ns;

        -- Test Case 7: Adding 11110000 + 00001111
        i_SW <= "11110000";  -- Input value 240
        wait for 20 ns;

        -- Test Case 8: Adding 00000010 + 00000011
        i_SW <= "00000010";  -- Input value 2
        wait for 20 ns;

        -- End of stimulus
        wait;
    end process;

end behavior;
