library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------
entity MUX is
 Port (clk: in std_logic;
 reset: in std_logic;
 phase_counter: in std_logic_vector(1 downto 0);
 number: in std_logic_vector(15 downto 0);
 sec_en: in std_logic;
 cathode : out std_logic_vector(3 downto 0);
 anode: out std_logic_vector(6 downto 0)
 );
end MUX;
----------------------------------------------------------------------------
architecture multiplexing of MUX is
 signal comb: std_logic_vector(3 downto 0);
 begin
----------------------------------------------------------------------------
 process(phase_counter) begin
 case phase_counter is
 when "00" => cathode <= "0111"; -- 1st digit
 comb <= number(15 downto 12);
 when "01" => cathode <= "1011"; -- 2nd digit
 comb <= number(11 downto 8);
 when "10" => cathode <= "1101"; -- 3rd digit
 comb <= number(7 downto 4);
 when "11" => cathode <= "1110"; -- 4th digit
 comb <= number(3 downto 0);
 when others => cathode <= "1111";
 end case;
 end process;
----------------------------------------------------------------------------
LED: entity work.decoder(dec)
 port map(led_combination => comb, hexadecimal => anode);
----------------------------------------------------------------------------
end multiplexing;