----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2025 05:41:24 PM
-- Design Name: 
-- Module Name: test_bench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.alllibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
end tb_full_adder;

architecture behavior of tb_full_adder is
    -- Component declaration for the Unit Under Test (UUT)
    component full_adder
        Port ( Xi : in STD_LOGIC;
               Yi : in STD_LOGIC;
               Ci : in STD_LOGIC;
               CiH : out STD_LOGIC;
               Si : out STD_LOGIC);
    end component;

    -- Signals for connecting to UUT
    signal Xi : STD_LOGIC := '0';
    signal Yi : STD_LOGIC := '0';
    signal Ci : STD_LOGIC := '0';
    signal CiH : STD_LOGIC;
    signal Si : STD_LOGIC;

begin
    -- Instantiate the full adder (UUT)
    uut: full_adder
        port map (
            Xi => Xi,
            Yi => Yi,
            Ci => Ci,
            CiH => CiH,
            Si => Si
        );

    -- Test procedure
    stim_proc: process
    begin
        -- Test case 1: 0 + 0 + 0
        Xi <= '0'; Yi <= '0'; Ci <= '0';
        wait for 10 ns;  -- Wait for 10 ns to check output

        -- Test case 2: 1 + 0 + 0
        Xi <= '1'; Yi <= '0'; Ci <= '0';
        wait for 10 ns;

        -- Test case 3: 0 + 1 + 0
        Xi <= '0'; Yi <= '1'; Ci <= '0';
        wait for 10 ns;

        -- Test case 4: 1 + 1 + 0
        Xi <= '1'; Yi <= '1'; Ci <= '0';
        wait for 10 ns;

        -- Test case 5: 0 + 0 + 1
        Xi <= '0'; Yi <= '0'; Ci <= '1';
        wait for 10 ns;

        -- Test case 6: 1 + 0 + 1
        Xi <= '1'; Yi <= '0'; Ci <= '1';
        wait for 10 ns;

        -- Test case 7: 0 + 1 + 1
        Xi <= '0'; Yi <= '1'; Ci <= '1';
        wait for 10 ns;

        -- Test case 8: 1 + 1 + 1
        Xi <= '1'; Yi <= '1'; Ci <= '1';
        wait for 10 ns;

        -- End the simulation
        wait;
    end process;
end behavior;


entity test_bench is
--  Port ( );
end test_bench;

architecture Behavioral of test_bench is

begin


end Behavioral;
