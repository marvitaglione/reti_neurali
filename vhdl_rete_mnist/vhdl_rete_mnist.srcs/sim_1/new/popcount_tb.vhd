----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.11.2022 11:17:11
-- Design Name: 
-- Module Name: popcount_tb - Behavioral
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
use work.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity popcount_tb is
end popcount_tb;

architecture Behavioral of popcount_tb is

    -- Componente da testare
    COMPONENT popcount
    Port ( 
        x : in STD_LOGIC_VECTOR;
        y : out STD_LOGIC_VECTOR
    );  
    END COMPONENT;
    
    -- Inputs
    signal x : STD_LOGIC_VECTOR(0 to 35) := (others => '0');
    
    -- Outputs
    signal y : STD_LOGIC_VECTOR(0 to 6) := (others => '0');
    
   -- Clock period definitions
   constant clk_period : time := 10 ns;

begin

    -- Instanza del componente da testare
    pp : popcount PORT MAP (
        x => x,
        y => y
    );

    -- Process di simulazione
    sim_proc : process
    begin
        
        wait for clk_period;
        x <= "111111111111111111111111111111111111";

        wait;
        
    end process;

end Behavioral;
