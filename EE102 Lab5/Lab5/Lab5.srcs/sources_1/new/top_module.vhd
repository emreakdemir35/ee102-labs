library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SevenSegmentCounter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR(6 downto 0);
           an : out STD_LOGIC_VECTOR(3 downto 0));
end SevenSegmentCounter;

architecture Structural of SevenSegmentCounter is
    signal slow_clk : STD_LOGIC;
    signal counter : STD_LOGIC_VECTOR(15 downto 0);
    signal sel_digit : STD_LOGIC_VECTOR(3 downto 0);
begin

    -- Instantiate Clock Divider (clk_div)
    clkDiv : entity work.clk_div
        port map (clk => clk, reset => reset, slow_clk => slow_clk);

    -- Instantiate 16-bit Counter (counter_16bit)
    CounterModule : entity work.counter_16bit
        port map (clk => slow_clk, reset => reset, count => counter);

    -- Instantiate Multiplexer (mux_4digit)
    MuxModule : entity work.mux_4digit
        port map (clk => slow_clk, digits => counter, sel_digit => sel_digit, an => an);

    -- Instantiate Seven-Segment Decoder (seven_seg_decoder)
    DecoderModule : entity work.seven_seg_decoder
        port map (digit => sel_digit, seg => seg);

end Structural;
