----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2025 11:15:41 PM
-- Design Name: 
-- Module Name: 4-bit adder - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity four_bit_adder is
    Port (
           a_i: in std_logic_vector(3 downto 0);
           b_i: in std_logic_vector(7 downto 4);
           output: out std_logic_vector(4 downto 0)
           );
end four_bit_adder;

architecture Behavioral of four_bit_adder is
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
    signal c_in : STD_LOGIC := '0';
    signal temp : std_logic_vector (3 downto 0) := (others => '0');
    
begin
    full_adder1 : full_adder
        port map (
           a_i => a_i(0),
           b_i => b_i(4),
           ci => c_in,
           ciH => temp(0),
           si => output(0)
        );
     full_adder2 : full_adder
        port map (
           a_i => a_i(1),
           b_i => b_i(5),
           ci => temp(0),
           ciH => temp(1),
           si => output(1)
        );
      full_adder3 : full_adder
        port map (
           a_i => a_i(2),
           b_i => b_i(6),
           ci => temp(1),
           ciH => temp(2),
           si => output(2)
        );
      full_adder4 : full_adder
        port map (
           a_i => a_i(3),
           b_i => b_i(7),
           ci => temp(2),
           ciH => temp(3),
           si => output(3)
        );
    output(4) <= temp(3);
end Behavioral;