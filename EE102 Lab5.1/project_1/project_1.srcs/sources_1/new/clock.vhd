library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock is
    Port (
        clk          : in  STD_LOGIC;
        reset        : in  STD_LOGIC;
        clock_count  : out STD_LOGIC_VECTOR (27 downto 0);
        phase_count  : out STD_LOGIC_VECTOR (1 downto 0);
        sec          : out STD_LOGIC_VECTOR (15 downto 0);
        sec_en       : out STD_LOGIC
    );
end clock;

architecture clk_arch of clock is
    signal clk_count : STD_LOGIC_VECTOR(27 downto 0) := (others => '0');
    signal seconds   : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                clk_count <= (others => '0');
                seconds   <= (others => '0');
            else
                if clk_count = x"5F5E0FF" then
                    seconds   <= seconds + '1';
                    clk_count <= (others => '0');
                else
                    clk_count <= clk_count + '1';
                end if;
            end if;
        end if;
    end process;

    sec_en      <= '1' when clk_count = x"5F5E0FF" else '0';
    phase_count <= clk_count(19 downto 18);
    clock_count <= clk_count;
    sec         <= seconds;
end clk_arch;