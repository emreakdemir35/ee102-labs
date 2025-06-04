--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Mon Apr  7 20:38:03 2025
--Host        : DESKTOP-291N13N running 64-bit major release  (build 9200)
--Command     : generate_target clk_wiz_0_wrapper.bd
--Design      : clk_wiz_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_0_wrapper is
  port (
    clk_in : in STD_LOGIC
  );
end clk_wiz_0_wrapper;

architecture STRUCTURE of clk_wiz_0_wrapper is
  component clk_wiz_0 is
  port (
    clk_in : in STD_LOGIC
  );
  end component clk_wiz_0;
begin
clk_wiz_0_i: component clk_wiz_0
     port map (
      clk_in => clk_in
    );
end STRUCTURE;
