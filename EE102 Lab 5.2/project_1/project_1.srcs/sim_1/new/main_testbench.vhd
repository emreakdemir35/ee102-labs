library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------
entity mainTB is
end mainTB;
----------------------------------------------------------------------------
architecture tb of mainTB is
signal reset,clk: std_logic;
signal cathode: std_logic_vector(3 downto 0);
signal anode: std_logic_vector(6 downto 0);
begin
----------------------------------------------------------------------------
 dut: entity work.main_7segment(rtl)
 port map (clk => clk, reset=>reset,
 anode => anode,
 cat=> cathode
 );
----------------------------------------------------------------------------
 clock_process :process
 begin
 clk <= '0';
 wait for 5 ns;
 clk <= '1';
 wait for 5 ns;
 end process;
----------------------------------------------------------------------------
 stim_proc: process
 begin
 reset <= '1';
 wait for 20 ns;
 reset <= '0';
 wait;
 end process;
 
 
----------------------------------------------------------------------------
end tb;