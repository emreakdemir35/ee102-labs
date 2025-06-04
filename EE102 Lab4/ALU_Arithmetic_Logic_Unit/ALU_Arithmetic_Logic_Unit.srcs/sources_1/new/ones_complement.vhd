----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2025 12:09:14 AM
-- Design Name: 
-- Module Name: ones_complement - Behavioral
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

entity ones_complement is
    Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
           output: out STD_LOGIC_VECTOR (4 downto 0)
          );
end ones_complement;

architecture Behavioral of ones_complement is
    signal complement: STD_LOGIC_VECTOR (3 downto 0);
begin
    complement(0) <= not a_i(0);
    complement(1) <= not a_i(1);
    complement(2) <= not a_i(2);
    complement(3) <= not a_i(3);
    
    output(0) <= complement(0);
    output(1) <= complement(1);
    output(2) <= complement(2);
    output(3) <= complement(3);
    output(4) <= '0';
    
    
    
end Behavioral;
