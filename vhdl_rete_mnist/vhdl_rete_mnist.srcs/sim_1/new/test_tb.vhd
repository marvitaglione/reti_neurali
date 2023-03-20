----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2022 14:37:20
-- Design Name: 
-- Module Name: test_tb - Behavioral
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

entity test_tb is
--  Port ( );
end test_tb;

architecture Behavioral of test_tb is

    Component LUT6 
    Generic(
        INIT : bit_vector
    );
    Port (
        O : out STD_LOGIC;
        I0 : in STD_LOGIC; 
        I1 : in STD_LOGIC;
        I2 : in STD_LOGIC;
        I3 : in STD_LOGIC;
        I4 : in STD_LOGIC;
        I5 : in STD_LOGIC
    );
    end component;

    
    -- Inputs
    signal I0, I1, I2, I3, I4, I5 : STD_LOGIC := '0';
    
    -- Outputs
    signal O : STD_LOGIC := '0';
    
   -- Clock period definitions
   constant clk_period : time := 10 ns;
   
begin

    test_cmp : LUT6
        generic map(
            INIT => X"FFFFFFFFFFFFFFFD" 
        )
        port map( 
            O => O,
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            I4 => I5,
            I5 => I5
        );

 -- Process di simulazione
    sim_proc : process
        begin
            
            wait for clk_period;
            I0 <= '1';
            I1 <= '0';
            I2 <= '0';
            I3 <= '0';
            I4 <= '0';
            I5 <= '0';
         
            wait;
        
    end process;

end Behavioral;
