library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module_tb is
end entity;

architecture testbench of top_module_tb is
    -- DUT (Device Under Test) Component Declaration
    component top_module
        port (
            input_1  : in std_logic_vector(3 downto 0);
            input_2  : in std_logic_vector(3 downto 0);
            selection : in std_logic_vector(2 downto 0);
            output   : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Signals
    signal input_1_tb  : std_logic_vector(3 downto 0);
    signal input_2_tb  : std_logic_vector(3 downto 0);
    signal selection_tb : std_logic_vector(2 downto 0);
    signal output_tb   : std_logic_vector(4 downto 0);
    signal X_tb        : std_logic_vector(10 downto 0);

begin
    -- Instantiate the DUT
    uut: top_module
        port map (
            input_1  => input_1_tb,
            input_2  => input_2_tb,
            selection => selection_tb,
            output   => output_tb
        );

    -- Test Process
    process
    begin
        for i in 0 to 2047 loop  -- Iterate through all possible 11-bit values
            X_tb <= std_logic_vector(to_unsigned(i, 11));  -- Assign i to X_tb
            
            -- Extract values
            input_1_tb  <= X_tb(3 downto 0);
            input_2_tb  <= X_tb(7 downto 4);
            selection_tb <= X_tb(10 downto 8);
            
            wait for 10 ns;  -- Wait to simulate propagation delay
            end loop;
    end process;
end architecture;
            
       