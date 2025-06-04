architecture Behavioral of top_module_1 is
    component full_adder is
        Port ( Xi : in STD_LOGIC;
               Yi : in STD_LOGIC;
               Ci : in STD_LOGIC;
               CiH : out STD_LOGIC;
               Si : out STD_LOGIC);
    end component;

    signal i_SW_reg : STD_LOGIC_VECTOR(7 downto 0);
    signal c0: STD_LOGIC := '0';
    signal c1: STD_LOGIC := '0';
    signal c2: STD_LOGIC := '0';
    signal c3: STD_LOGIC := '0';
    signal c4: STD_LOGIC := '0';
    signal c5: STD_LOGIC := '0';

begin
    process(clk)
    begin
        if rising_edge(clk) then
            i_SW_reg <= i_SW;  -- Capture the current state of switches
        end if;
    end process;

    -- Full Adder Instantiations and Carry Propagation
    full_adder_1 : full_adder
        port map(
           Xi => i_SW_reg(0),
           Yi => i_SW_reg(4),
           Ci => c0,
           CiH => c1,
           Si => o_LED(0)
        );

    full_adder_2 : full_adder
        port map(
           Xi => i_SW_reg(1),
           Yi => i_SW_reg(5),
           Ci => c1,
           CiH => c2,
           Si => o_LED(1)
        );

    full_adder_3 : full_adder
        port map(
           Xi => i_SW_reg(2),
           Yi => i_SW_reg(6),
           Ci => c2,
           CiH => c3,
           Si => o_LED(2)
        );

    full_adder_4 : full_adder
        port map(
           Xi => i_SW_reg(3),
           Yi => i_SW_reg(7),
           Ci => c3,
           CiH => c4,
           Si => o_LED(3)
        );

    o_LED(4) <= c4;  -- Final carry-out
end Behavioral;
