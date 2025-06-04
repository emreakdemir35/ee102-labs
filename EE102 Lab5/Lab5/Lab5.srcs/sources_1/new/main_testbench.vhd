library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity testbench is
end testbench;

architecture tb of testbench is
    -- Signals to connect to the DUT (Device Under Test)
    signal reset, clk : std_logic;
    signal an : std_logic_vector(3 downto 0);
    signal seg : std_logic_vector(6 downto 0);
    
    -- Component Declaration (DUT - Top module)
    component SevenSegmentCounter is
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               seg : out STD_LOGIC_VECTOR(6 downto 0);
               an : out STD_LOGIC_VECTOR(3 downto 0) );
    end component;

begin

    -- Instantiate the Device Under Test (DUT)
    dut: SevenSegmentCounter
        port map ( clk => clk,
                   reset => reset,
                   seg => seg,
                   an => an );

    -- Clock generation process (100 MHz clock)
    clock_process : process
    begin
        -- Generate a 100 MHz clock (10 ns period)
        clk <= '0';
        report "clk = '0'" severity note;
        wait for 10 ns;
        clk <= '1';
        report "clk = '1'" severity note;
        wait for 10 ns;
    end process;

    -- Stimulus process (apply inputs and reset)
    stim_proc : process
    begin
        -- Initially apply reset
        reset <= '1';  -- Assert reset
        wait for 20 ns; -- Wait for a few clock cycles
        reset <= '0';  -- Deassert reset

        -- Run the simulation for some time (observe the output)
        wait for 200ms;  -- Simulate for 1000 ns

        
        -- End of simulation
        assert false report "Testbench completed" severity note;
        wait;
    end process;

end tb;
