----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2025 11:37:33 PM
-- Design Name: 
-- Module Name: subtraction - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity subtraction is
    Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
           b_i : in STD_LOGIC_VECTOR (7 downto 4);
           bout : out STD_LOGIC;
           output : out STD_LOGIC_VECTOR (4 downto 0));
end subtraction;

architecture Behavioral of subtraction is
    signal Borrow : STD_LOGIC_VECTOR(3 downto 0);
begin
    output(0) <= a_i(0) xor '0';
    Borrow(0) <= (not a_i(0) and b_i(4)) or ((a_i(0) xor b_i(4)) and '0');
    
    output(1) <= a_i(1) xor Borrow(0);
    Borrow(1) <= (not a_i(1) and b_i(5)) or ((a_i(1) xor b_i(5)) and Borrow(0));
    
    output(2) <= a_i(2) xor Borrow(1);
    Borrow(2) <= (not a_i(2) and b_i(6)) or ((a_i(2) xor b_i(6)) and Borrow(1));
    
    output(3) <= a_i(3) xor Borrow(2);
    Borrow(3) <= (not a_i(3) and b_i(7)) or ((a_i(3) xor b_i(7)) and Borrow(2));
  
    bout <= Borrow(3);
    output(4) <= '0';
end Behavioral;
