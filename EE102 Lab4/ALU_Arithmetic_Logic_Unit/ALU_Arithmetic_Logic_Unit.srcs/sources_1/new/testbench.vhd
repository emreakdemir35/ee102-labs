library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tb_top_module is
end tb_top_module;

architecture behavior of tb_top_module is
    -- Component declaration for the top_module
    component top_module is
        Port ( input_1 : in  std_logic_vector(3 downto 0);
               input_2 : in  std_logic_vector(7 downto 4);
               selection: in std_logic_vector(2 downto 0);
               output: out std_logic_vector(4 downto 0)
               );
    end component;
    
    -- Signals for the inputs and outputs of the top module
    signal input_1 : std_logic_vector(3 downto 0);
    signal input_2 : std_logic_vector(7 downto 4);
    signal selection : std_logic_vector(2 downto 0);
    signal output : std_logic_vector(4 downto 0);

begin
    -- Instantiate the top_module
    uut: top_module
        port map (
            input_1 => input_1,
            input_2 => input_2,
            selection => selection,
            output => output
        );

    -- Stimulus process
    stimulus : process
    begin
        -- Test case 1
        input_1 <= "0011";   -- input_1 = 1
        input_2 <= "0001";  -- input_2 = 16
        selection <= "000";   -- Test the 4-bit adder
        wait for 10 ns;
        
        -- Test case 2
        input_1 <= "1110";   -- input_1 = 2
        input_2 <= "0001";  -- input_2 = 12
        selection <= "001";   -- Test the subtraction full adder
        wait for 10 ns;
        
        -- Test case 3
        input_1 <= "0101";   -- input_1 = 5
        selection <= "010";   -- Test the rotate function
        wait for 10 ns;
        
        -- Test case 4
        input_1 <= "1100";   -- input_1 = 10
        selection <= "011";   -- Test the logical left shift
        wait for 10 ns;

        -- Test case 5
        input_1 <= "1100";   -- input_1 = 12
        selection <= "100";   -- Test the ones complement
        wait for 10 ns;
        
        -- Test case 6
        input_1 <= "1110";   -- input_1 = 15
        input_2 <= "1010";  -- input_2 = 3
        selection <= "101";   -- Test the bitwise XOR
        wait for 10 ns;
        
        -- Test case 7
        input_1 <= "0000";   -- input_1 = 0
        input_2 <= "1111";  -- input_2 = 63
        selection <= "110";   -- Test the bitwise OR
        wait for 10 ns;

        -- Test case 8
        input_1 <= "0101";   -- input_1 = 4
        input_2 <= "1100";  -- input_2 = 3
        selection <= "111";   -- Test the bitwise AND
        wait for 10 ns;

        -- End simulation
        wait;
    end process;
end behavior;
