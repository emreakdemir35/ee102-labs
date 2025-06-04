# Clock
set_property PACKAGE_PIN W5 [get_ports {clk}]      
    set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# Reset (if using CPU_RESET)
set_property PACKAGE_PIN U18 [get_ports {reset}]
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

# Onboard USB-UART
# B18 is the line from FTDI -> FPGA
set_property PACKAGE_PIN B18 [get_ports {uart_rx}]
    set_property IOSTANDARD LVCMOS33 [get_ports {uart_rx}]

# Servo outputs
# Example: JA1 and JA2 (just an example).
set_property PACKAGE_PIN J1 [get_ports {servo1}]
    set_property IOSTANDARD LVCMOS33 [get_ports {servo1}]

set_property PACKAGE_PIN L2  [get_ports {servo2}]
    set_property IOSTANDARD LVCMOS33 [get_ports {servo2}]
