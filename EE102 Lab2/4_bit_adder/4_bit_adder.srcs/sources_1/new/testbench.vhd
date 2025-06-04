LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_top_module_1 IS
END tb_top_module_1;

ARCHITECTURE behavior OF tb_top_module_1 IS
    -- Signals for connecting to the DUT (Device Under Test)
    SIGNAL i_SW : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL clk   : STD_LOGIC := '0';
    SIGNAL o_LED : STD_LOGIC_VECTOR(4 downto 0);

    -- Clock period definition
    CONSTANT clk_period : TIME := 10 ns;

BEGIN
    -- Instantiate the top module
    uut: ENTITY work.top_module_1
        PORT MAP (
            i_SW => i_SW,
            clk => clk,
            o_LED => o_LED
        );

    -- Clock generation
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period / 2;
        clk <= '1';
        WAIT FOR clk_period / 2;
    END PROCESS;

    -- Stimulus process
    stim_proc: PROCESS
    BEGIN
        -- Test vector for input 11111111 (expected output 10000)
        i_SW <= "11111111"; -- This represents 255 in binary
        WAIT FOR 20 ns;

        -- Check other test cases if necessary
        -- e.g., i_SW <= "00000000"; WAIT FOR 20 ns;
        -- or i_SW <= "01010101"; WAIT FOR 20 ns;

        -- End of simulation
        WAIT;
    END PROCESS;
END behavior;
