library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity segment_driver is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           phase_count : in STD_LOGIC_VECTOR (1 downto 0);
           num : in STD_LOGIC_VECTOR (15 downto 0);
           sec_en : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end segment_driver;

architecture driver of segment_driver is
    signal led_in: std_logic_vector(3 downto 0);
begin
    process(phase_count) 
    begin
        case phase_count is
            when "00" => 
                an <= "0111";
                led_in <= num(15 downto 12);
            when "01" => 
                an <= "1011";
                led_in <= num(11 downto 8);
            when "10" => 
                an <= "1101";
                led_in <= num(7 downto 4);
            when "11" => 
                an <= "1110";
                led_in <= num(3 downto 0);
            when others => 
                an <= "1111";
                led_in <= "0000";
        end case;
    end process;

    -- Assign `led_in` to `cat` using a simple decoder (if not handled elsewhere)
    process(led_in)
    begin
        case led_in is
            when "0000" => cat <= "0000001"; -- 0
            when "0001" => cat <= "1001111"; -- 1
            when "0010" => cat <= "0010010"; -- 2
            when "0011" => cat <= "0000110"; -- 3
            when "0100" => cat <= "1001100"; -- 4
            when "0101" => cat <= "0100100"; -- 5
            when "0110" => cat <= "0100000"; -- 6
            when "0111" => cat <= "0001111"; -- 7
            when "1000" => cat <= "0000000"; -- 8
            when "1001" => cat <= "0000100"; -- 9
            when "1010" => cat <= "0000010"; -- A
            when "1011" => cat <= "1100000"; -- B
            when "1100" => cat <= "0110001"; -- C
            when "1101" => cat <= "1000010"; -- D
            when "1110" => cat <= "0110000"; -- E
            when "1111" => cat <= "0111000"; -- F
            when others => cat <= "1111111"; -- Default case
        end case;
    end process;
    
    CAT: entity work.cathode_reg(reg)
       port map(led_in=>led_in, cat => cat);
    
end driver;
