----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2025 11:19:54 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
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

entity top_module is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end top_module;

architecture Behavioral of top_module is

signal switches: std_logic_vector(15 downto 0);

begin
clock: entity work.counter_16_bit(Behavioral)
    port map(clk => clk, reset => reset, sixteen_bit_input => switches , output => LED);

end Behavioral;


