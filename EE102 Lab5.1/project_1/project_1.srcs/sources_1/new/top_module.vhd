library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end top_module;

architecture Behavioral of top_module is
    signal phase_count: std_logic_vector(1 downto 0);
    signal sec_en: std_logic;
    signal num: std_logic_vector(15 downto 0);
    signal led_in: std_logic_vector(3 downto 0);  -- Added missing signal
begin
    -- Clock Module Instance
    clock_inst: entity work.clock
        port map(clk => clk, reset => reset,
                 phase_count => phase_count,
                 sec_en => sec_en,
                 sec => num);

    -- Segment Driver Instance
    driver_inst: entity work.segment_driver
        port map(clk => clk, reset => reset, phase_count => phase_count,
                 num => num, sec_en => sec_en, an => an, cat => cat);

    -- Cathode Register Instance
    cathode_inst: entity work.cathode_reg
        port map(led_in => num(3 downto 0), cat => cat);  -- Fix input

end Behavioral;
