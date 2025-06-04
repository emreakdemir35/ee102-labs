--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Sun Apr  6 21:39:29 2025
--Host        : DESKTOP-291N13N running 64-bit major release  (build 9200)
--Command     : generate_target clock_wrapper.bd
--Design      : clock_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_wrapper is
  port (
    clk_in1_0 : in STD_LOGIC;
    clk_out1_0 : out STD_LOGIC;
    locked_0 : out STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
end clock_wrapper;

architecture STRUCTURE of clock_wrapper is
  component clock is
  port (
    clk_in1_0 : in STD_LOGIC;
    reset_0 : in STD_LOGIC;
    clk_out1_0 : out STD_LOGIC;
    locked_0 : out STD_LOGIC
  );
  end component clock;
begin
clock_i: component clock
     port map (
      clk_in1_0 => clk_in1_0,
      clk_out1_0 => clk_out1_0,
      locked_0 => locked_0,
      reset_0 => reset_0
    );
end STRUCTURE;
