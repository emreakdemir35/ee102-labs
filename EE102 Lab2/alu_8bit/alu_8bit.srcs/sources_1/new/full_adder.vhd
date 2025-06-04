architecture Behavioral of full_adder is
    component half_adder is
        port(
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC
        );
    end component;

    signal carry_in : STD_LOGIC := '0';
    signal sum_first : STD_LOGIC := '0';
    signal carry_first : STD_LOGIC := '0';
    signal carry_second : STD_LOGIC := '0';

begin
    half_adder_1 : half_adder
        port map(
            X => Xi,
            Y => Yi,
            sum => sum_first,
            carry => carry_first
        );

    half_adder_2 : half_adder
        port map(
            X => sum_first,
            Y => carry_first,
            sum => Si,
            carry => carry_second
        );

   -- Carry-out (CiH) from the full adder is the final carry value
   CiH <= carry_second or Ci;
end Behavioral;
