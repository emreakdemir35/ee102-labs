----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2025 11:58:17 PM
-- Design Name: 
-- Module Name: shift - Behavioral
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

entity logical_left_shift is
    Port ( a_i : in STD_LOGIC_VECTOR(3 downto 0);
           output : out STD_LOGIC_VECTOR (4 downto 0));
end logical_left_shift;

architecture Behavioral of logical_left_shift is
    signal shifting: std_logic_vector(3 downto 0);
begin
    shifting(1) <= a_i(0);
    shifting(2) <= a_i(1);
    shifting(3) <= a_i(2);
    shifting(0) <= '0';
    
    output(0) <= shifting(0);
    output(1) <= shifting(1);
    output(2) <= shifting(2);
    output(3) <= shifting(3);
    output(4) <= '0';

end Behavioral;
