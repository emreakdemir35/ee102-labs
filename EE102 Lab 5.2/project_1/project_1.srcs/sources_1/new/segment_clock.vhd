----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2025 09:02:50 AM
-- Design Name: 
-- Module Name: segment_clock - Behavioral
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
--library UNISIMlibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD;
----------------------------------------------------------------------------
entity segment_clock is
 Port ( clk: in std_logic;
 reset: in std_logic;
 clk_counter: out std_logic_vector(27 downto 0);
 phase_counter: out std_logic_vector(1 downto 0);
 sec_en: out std_logic_vector(15 downto 0);
 second_cycle: out std_logic);
end segment_clock;
----------------------------------------------------------------------------
architecture rtl_clock of segment_clock is
 signal clk_counter1: std_logic_vector(27 downto 0);
 signal binary: std_logic_vector(15 downto 0):= (others => '0');
begin
----------------------------------------------------------------------------
 process(CLK) begin
 if(reset = '1') then
 clk_counter1 <= (others => '0');
 binary <= (others => '0');
 else
 if rising_edge(CLK) then
 clk_counter1 <= clk_counter1 + '1';
 if clk_counter1 =x"98968A" then
 binary <= binary + '1';
 clk_counter1 <= (others => '0');
 end if;
 end if;
 end if;
 end process;
----------------------------------------------------------------------------
second_cycle <= '1' when clk_counter1 =x"5F5E0FF" else '0';
phase_counter <= clk_counter1(1 downto 0);
clk_counter <= clk_counter1;
sec_en <= binary;
----------------------------------------------------------------------------
end rtl_clock;
