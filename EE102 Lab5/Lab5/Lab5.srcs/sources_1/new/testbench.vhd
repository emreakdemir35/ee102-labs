library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench entity for SevenSegmentCounter
entity SevenSegmentCounter_tb is
end SevenSegmentCounter_tb;

architecture behavior of SevenSegmentCounter_tb is

    -- Component declaration for the SevenSegmentCounter
    component SevenSegmentCounter
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               seg : out STD_LOGIC_VECTOR(6 downto 0);
               an : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    -- Signals for the SevenSegmentCounter
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal seg : STD_LOGIC_VECTOR(6 downto 0);
    signal an : STD_LOGIC_VECTOR(3 downto 0);

    -- Clock period constant (100 MHz input clock)
    constant clk_period : time := 10 ns;  -- 100 MHz clock period (10 ns)
    
begin
    -- Instantiate the SevenSegmentCounter component (the top module)
    uut: SevenSegmentCounter
        Port map ( clk => clk,
                   reset => reset,
                   seg => seg,
                   an => an );

    -- Clock generation process
    clk_process :process
    begin
        -- Toggle the clock every 5 ns to generate a 100 MHz clock
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Test sequence for reset and simulation
    stim_proc: process
    begin
        -- Apply reset for 20 ns to initialize the system
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        -- Simulate for 1 ms (1000 us)
        wait for 1000 us;
        
        -- Test complete, check if the system is working as expected
        assert false report "Testbench completed" severity note;
        wait;
    end process;

end behavior;
