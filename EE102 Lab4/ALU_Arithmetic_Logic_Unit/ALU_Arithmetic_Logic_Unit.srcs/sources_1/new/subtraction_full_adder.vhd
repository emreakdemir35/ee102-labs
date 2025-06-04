----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2025 08:31:08 AM
-- Design Name: 
-- Module Name: subtraction_full_adder - Behavioral
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
--use UNISIM.VComponents.all;

entity subtraction_full_adder is
  Port ( a_i: in std_logic_vector(3 downto 0);
         b_i: in std_logic_vector(7 downto 4);
         output: out std_logic_vector(4 downto 0)
        );
end subtraction_full_adder;

architecture Behavioral of subtraction_full_adder is
    component half_adder is
            port (
                a_i : in STD_LOGIC;
                b_i : in STD_LOGIC;
                carry : out STD_LOGIC;
                sum : out STD_LOGIC
            );
        end component;
    component full_adder is
        port (
           a_i : in STD_LOGIC;
           b_i : in STD_LOGIC;
           ci : in STD_LOGIC;
           ciH : out STD_LOGIC;
           si : out STD_LOGIC
        );
    end component;
    signal c_in : STD_LOGIC := '1';
    signal temp : std_logic_vector (3 downto 0) := (others => '0');
    signal complement_b : std_logic_vector (3 downto 0) := (others => '0');
begin
    complement_b <= not(b_i);
    full_adder1 : full_adder
        port map (
           a_i => a_i(0),
           b_i => complement_b(0),
           ci => c_in,
           ciH => temp(0),
           si => output(0)
        );
     full_adder2 : full_adder
        port map (
           a_i => a_i(1),
           b_i => complement_b(1),
           ci => temp(0),
           ciH => temp(1),
           si => output(1)
        );
      full_adder3 : full_adder
        port map (
           a_i => a_i(2),
           b_i => complement_b(2),
           ci => temp(1),
           ciH => temp(2),
           si => output(2)
        );
      full_adder4 : full_adder
        port map (
           a_i => a_i(3),
           b_i => complement_b(3),
           ci => temp(2),
           ciH => temp(3),
           si => output(3)
        );
    output(4) <= '0';
end Behavioral;
