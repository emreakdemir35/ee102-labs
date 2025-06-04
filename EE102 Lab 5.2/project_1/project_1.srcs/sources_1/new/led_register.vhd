library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port ( led_combination: in std_logic_vector(3 downto 0);
           hexadecimal: out std_logic_vector(6 downto 0));
end decoder;

architecture dec of decoder is
begin
    process(led_combination)  -- label the process
    begin
        case led_combination is
            when "0000" => hexadecimal <= "0000001";
            when "0001" => hexadecimal <= "1001111";
            when "0010" => hexadecimal <= "0010010";
            when "0011" => hexadecimal <= "0000110";
            when "0100" => hexadecimal <= "1001100";
            when "0101" => hexadecimal <= "0100100";
            when "0110" => hexadecimal <= "0100000";
            when "0111" => hexadecimal <= "0001111";
            when "1000" => hexadecimal <= "0000000";
            when "1001" => hexadecimal <= "0000100";
            when "1010" => hexadecimal <= "0000010";
            when "1011" => hexadecimal <= "1100000";
            when "1100" => hexadecimal <= "0110001";
            when "1101" => hexadecimal <= "1000010";
            when "1110" => hexadecimal <= "0110000";
            when "1111" => hexadecimal <= "0111000";
            when others => hexadecimal <= "1111111";
        end case;
    end process;  -- close process here

end dec;
