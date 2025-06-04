library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cathode_reg is
    Port (
        led_in : in STD_LOGIC_VECTOR (3 downto 0);
        cat    : out STD_LOGIC_VECTOR (6 downto 0)
    );
end cathode_reg;

architecture reg of cathode_reg is
begin
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
end reg;
