library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Testbench is
end Testbench;

architecture Behavioral of testBench is
    component top_module is
    port(
     i_SW : in STD_LOGIC_VECTOR (7 downto 0);
     o_LED : out STD_LOGIC_VECTOR (7 downto 0)
    );
    end component;
    signal i_SW : std_logic_vector(7 downto 0) := "00000000";
    signal o_LED : std_logic_vector(7 downto 0);
    begin
    
    UUT : top_module port map(i_SW ,o_LED);
    
    STIM_PROCESS : process begin
    for k in 0 to 255 loop
     i_SW <= std_logic_vector(to_unsigned(k, 8));
     wait for 10 ns;
    end loop;
    assert false report "FINISHED" severity failure;
    end process;

end Behavioral;