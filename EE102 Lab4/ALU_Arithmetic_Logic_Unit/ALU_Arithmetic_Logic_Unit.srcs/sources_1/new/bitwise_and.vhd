----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2025 12:13:14 AM
-- Design Name: 
-- Module Name: bitwise_OR - Behavioral
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

entity bitwise_AND is
    Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
           b_i : in STD_LOGIC_VECTOR (7 downto 4);
           output : out STD_LOGIC_VECTOR (4 downto 0));
end bitwise_AND;

architecture Behavioral of bitwise_AND is
    signal operation: STD_LOGIC_VECTOR (3 downto 0);
begin
    operation(0) <= a_i(0) and b_i(4);
    operation(1) <= a_i(1) and b_i(5);
    operation(2) <= a_i(2) and b_i(6);
    operation(3) <= a_i(3) and b_i(7);
    
    output(0) <= operation(0);
    output(1) <= operation(1);
    output(2) <= operation(2);
    output(3) <= operation(3);
    output(4) <= '0';
    
end Behavioral;
