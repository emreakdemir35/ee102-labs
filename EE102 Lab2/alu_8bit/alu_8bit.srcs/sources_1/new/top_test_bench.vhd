library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top_module_1 is
end tb_top_module_1;

architecture behavior of tb_top_module_1 is
    -- Component declaration for the Unit Under Test (UUT)
    component top_module_1
        Port ( i_SW : in STD_LOGIC_VECTOR (7 downto 0);
               clk   : in STD_LOGIC;
               o_LED : out STD_LOGIC_VECTOR (4 downto 0));
    end component;

    -- Signals for connecting to UUT
    signal i_SW : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal clk : STD_LOGIC := '0';
    signal o_LED : STD_LOGIC_VECTOR (4 downto 0);

begin
    -- Instantiate the top module (UUT)
    uut: top_module_1
        port map (
            i_SW => i_SW,
            clk => clk,
            o_LED => o_LED
        );

    -- Clock generation
    clk_process: process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    -- Test procedure
    stim_proc: process
    begin
        -- Test case 1: Input switches as 00000000 (no switches pressed)
        i_SW <= "01000100";
        wait for 20 ns;

        -- Test case 2: Input switches as 00001111
        i_SW <= "00011111";
        wait for 20 ns;

        -- Test case 3: Input switches as 11110000
        i_SW <= "11110000";
        wait for 20 ns;

        -- Test case 4: Input switches as 11111111
        i_SW <= "11111111";
        wait for 20 ns;

        -- End the simulation
        wait;
    end process;
end behavior;
