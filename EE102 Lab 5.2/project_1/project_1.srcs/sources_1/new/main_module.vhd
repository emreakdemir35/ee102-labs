library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------
entity main_7segment is
 Port ( clk: in std_logic; -- clock input
 reset: in std_logic; -- reset input
 cat: out std_logic_vector(3 downto 0);
 anode: out std_logic_vector(6 downto 0)
 );
end main_7segment;
----------------------------------------------------------------------------
()architecture rtl of main_7segment is
 signal phase_counter: std_logic_vector(1 downto 0);
 signal sec_enable: std_logic;
 signal number: std_logic_vector(15 downto 0);
begin
----------------------------------------------------------------------------
clock: entity work.segment_clock(rtl_clock)
 port map(clk => clk, reset => reset,
 phase_counter => phase_counter,
 second_cycle => sec_enable,
 sec_en => number);
----------------------------------------------------------------------------
driver: entity work.MUX(multiplexing)
 port map(clk => clk, reset => reset, phase_counter => phase_counter, number => number,
 sec_en => sec_enable, anode => anode, cathode => cat);
end rtl;
