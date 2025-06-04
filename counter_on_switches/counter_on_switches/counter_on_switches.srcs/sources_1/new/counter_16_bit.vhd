library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD;

entity counter_16_bit is
    Port ( clk: in STD_LOGIC;
           reset: in std_logic;
           sixteen_bit_input : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0)
           );
end counter_16_bit;

architecture Behavioral of counter_16_bit is
signal clk_counter_signal: std_logic_vector(27 downto 0);
signal sixteen_binary: std_logic_vector(15 downto 0):= (others => '0');

begin
    process(clk) begin
        if (reset = '1') then
            clk_counter_signal <= (others => '0');
            sixteen_binary <= (others => '0');
        else 
        if rising_edge(clk) then
            clk_counter_signal <= clk_counter_signal + '1';
            if clk_counter_signal = "1001100110011001" then
                sixteen_binary <= sixteen_binary + '1';
                clk_counter_signal <= (others => '0');
            end if;
        end if;
     end if;
    end process;
    
output <= sixteen_binary;   
    
end Behavioral;
