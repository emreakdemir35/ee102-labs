----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2025 06:30:59 PM
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
use ieee.numeric_std.all;

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
           rx : in std_logic; -- connected to pin U2
           x_angle : out STD_LOGIC_VECTOR (7 downto 0);
           y_angle : out STD_LOGIC_VECTOR (7 downto 0));
end top_module;

architecture Behavioral of top_module is

    signal x_angle_signal: signed(9 downto 0);
    signal y_angle_signal: signed(9 downto 0);


begin





end Behavioral;
