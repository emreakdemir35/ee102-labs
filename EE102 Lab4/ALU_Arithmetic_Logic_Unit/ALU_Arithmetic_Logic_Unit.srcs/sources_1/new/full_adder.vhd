----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2025 07:06:27 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( a_i : in STD_LOGIC;
           b_i : in STD_LOGIC;
           ci : in STD_LOGIC;
           ciH : out STD_LOGIC;
           si : out STD_LOGIC
     );
end full_adder;

architecture Behavioral of full_adder is
    component half_adder is
        port (
            a_i : in STD_LOGIC;
            b_i : in STD_LOGIC;
            carry : out STD_LOGIC;
            sum : out STD_LOGIC
        );
    end component;
    signal x_1 : STD_LOGIC := '0';
    signal y_1 : STD_LOGIC := '0';
    signal f_0 : STD_LOGIC := '0';
begin
    half_adder1 : half_adder
        port map (
            a_i  => a_i,
            b_i => b_i,
            sum => x_1,
            carry  => y_1
        );
    
    half_adder2 : half_adder
        port map (
            a_i => x_1,
            b_i => ci,
            sum => si,
            carry => f_0
        );
    ciH <= f_0 or y_1;
end Behavioral;
