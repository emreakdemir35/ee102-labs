library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.textio.ALL;

entity top_module_tb is
end top_module_tb;

architecture Behavioral of top_module_tb is

    component top_module
        Port (
            i_SW  : in  STD_LOGIC_VECTOR (7 downto 0);
            o_LED : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    signal i_SW_tb  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal o_LED_tb : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: top_module
        port map (
            i_SW  => i_SW_tb,
            o_LED => o_LED_tb
        );

    process
    begin
        for i in 0 to 255 loop
            i_SW_tb <= std_logic_vector(to_unsigned(i, 8));
            wait for 10 ns;
        end loop;
        
        -- Stop simulation
        wait;
    end process;

end Behavioral;
