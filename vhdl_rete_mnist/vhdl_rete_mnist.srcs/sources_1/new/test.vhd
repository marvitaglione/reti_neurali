----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2022 13:12:41
-- Design Name: 
-- Module Name: test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity test is
    Generic(
        INIT : bit_vector(3 downto 0)
    );
    Port (
        O : out STD_LOGIC;
        I0 : in STD_LOGIC; 
        I1 : in STD_LOGIC
    );
end test;

architecture Behavioral of test is

    Component LUT2 
    Generic (
        INIT : bit_vector(3 downto 0)
    );
    Port (
        O : out STD_LOGIC;
        I0 : in STD_LOGIC; 
        I1 : in STD_LOGIC
    );
    end component;


begin

    LUT2_inst : LUT2
    generic map (
       INIT => INIT 
    ) -- Specify LUT Contents
    port map (
       O => O,  -- 6/5-LUT output (1-bit)
       I0 => I0,   -- LUT input (1-bit)
       I1 => I1
    );

end Behavioral;
