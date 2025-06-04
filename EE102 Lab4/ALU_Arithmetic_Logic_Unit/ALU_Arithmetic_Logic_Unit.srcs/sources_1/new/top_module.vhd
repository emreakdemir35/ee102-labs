library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity top_module is
    Port ( input_1 : in  std_logic_vector(3 downto 0);
           input_2 : in  std_logic_vector(7 downto 4);
           selection: in std_logic_vector(2 downto 0);
           output: out std_logic_vector(4 downto 0)
           );
end top_module;

architecture Behavioral of top_module is
    component four_bit_adder is
    Port (
           a_i: in std_logic_vector(3 downto 0);
           b_i: in std_logic_vector(7 downto 4);
           output: out std_logic_vector(4 downto 0)
           );
    end component;
    
    component subtraction_full_adder is
     Port (
         a_i: in std_logic_vector(3 downto 0);
         b_i: in std_logic_vector(7 downto 4);
         output: out std_logic_vector(4 downto 0)
         );
    end component;
    
    component rotate is
    Port ( a_i : in STD_LOGIC_VECTOR(3 downto 0);
           output : out STD_LOGIC_VECTOR (4 downto 0));
    end component;

    component ones_complement is
        Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
           output: out STD_LOGIC_VECTOR (4 downto 0)
          );
    end component;
    
    component logical_left_shift is
        Port ( a_i : in STD_LOGIC_VECTOR(3 downto 0);
               output : out STD_LOGIC_VECTOR (4 downto 0)
             );
    end component;
    
    component bitwise_XOR is
        Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
               b_i : in STD_LOGIC_VECTOR (7 downto 4);
               output : out STD_LOGIC_VECTOR (4 downto 0)
             );
    end component;
    
    component bitwise_OR is
        Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
               b_i : in STD_LOGIC_VECTOR (7 downto 4);
               output : out STD_LOGIC_VECTOR (4 downto 0)
             );
    end component;       
    
    component bitwise_AND is
        Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
               b_i : in STD_LOGIC_VECTOR (7 downto 4);
               output : out STD_LOGIC_VECTOR (4 downto 0)
             );
    end component;
    signal input_signal_first: std_logic_vector(3 downto 0) := (others => '0');
    signal input_signal_second: std_logic_vector(7 downto 4) := (others => '0');
    signal output_signal_1: std_logic_vector(4 downto 0) := (others => '0');
    signal output_signal_2: std_logic_vector(4 downto 0) := (others => '0');
    signal output_signal_3: std_logic_vector(4 downto 0) := (others => '0');
    signal output_signal_4: std_logic_vector(4 downto 0) := (others => '0');
    signal output_signal_5: std_logic_vector(4 downto 0) := (others => '0');
    signal output_signal_6: std_logic_vector(4 downto 0) := (others => '0');
    signal output_signal_7: std_logic_vector(4 downto 0) := (others => '0');
    signal output_signal_8: std_logic_vector(4 downto 0) := (others => '0');
begin
    input_signal_first <= input_1;
    input_signal_second <= input_2;


    -- Instantiating the 4-bit adder
    sel_1 : four_bit_adder
        port map (
           a_i => input_signal_first,
           b_i => input_signal_second,
           output => output_signal_1
        );
        
    sel_2 : subtraction_full_adder   
         port map ( 
            a_i => input_signal_first,
            b_i => input_signal_second,
            output => output_signal_2
        );        
     
     sel_3 : rotate   
         port map ( 
             a_i => input_signal_first,
             output => output_signal_3     
           );
     sel_4 : logical_left_shift   
         port map ( 
             a_i => input_signal_first,
             output => output_signal_4     
           );      
     sel_5 : ones_complement   
         port map ( 
             a_i => input_signal_first,
             output => output_signal_5     
           );
     sel_6 : bitwise_XOR   
         port map ( 
             a_i => input_signal_first,
             b_i => input_signal_second,
             output => output_signal_6     
           );
      sel_7 : bitwise_OR   
         port map ( 
             a_i => input_signal_first,
             b_i => input_signal_second,
             output => output_signal_7     
           );              
      sel_8 : bitwise_AND   
         port map ( 
             a_i => input_signal_first,
             b_i => input_signal_second,
             output => output_signal_8     
           );
process(selection,output_signal_1,output_signal_2,output_signal_3,output_signal_4,output_signal_5,output_signal_6,output_signal_7,output_signal_8)           

begin

    if selection = "000" then
       output <=  output_signal_1;
    elsif selection = "001" then
       output <= output_signal_2;
    elsif selection = "010" then
       output <= output_signal_3;
    elsif selection = "011" then
       output <= output_signal_4;         
    elsif selection = "100" then
       output <= output_signal_5;
    elsif selection = "101" then
       output <= output_signal_6;
    elsif selection = "110" then
       output <= output_signal_7;
    elsif selection = "111" then
       output <= output_signal_8;
    else
       output <= "00000";
    end if;
   end process;              
end Behavioral;
