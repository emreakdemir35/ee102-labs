library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4digit is
    Port ( clk : in STD_LOGIC;
           digits : in STD_LOGIC_VECTOR(15 downto 0);
           sel_digit : out STD_LOGIC_VECTOR(3 downto 0);
           an : out STD_LOGIC_VECTOR(3 downto 0));
end mux_4digit;

architecture Behavioral of mux_4digit is
    signal select : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal data : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            select <= select + 1;
        end if;
    end process;

    -- Select the appropriate digit
    process(select)
    begin
        case select is
            when "00" => 
                data <= digits(3 downto 0);
                an <= "1110"; -- Enable first digit
            when "01" => 
                data <= digits(7 downto 4);
                an <= "1101"; -- Enable second digit
            when "10" => 
                data <= digits(11 downto 8);
                an <= "1011"; -- Enable third digit
            when others => 
                data <= digits(15 downto 12);
                an <= "0111"; -- Enable fourth digit
        end case;
    end process;

    sel_digit <= data;
end Behavioral;
