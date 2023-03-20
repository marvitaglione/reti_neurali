----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2022 17:19:54
-- Design Name: 
-- Module Name: batchNorm_tb - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity batchNorm_tb is
--  Port ( );
end batchNorm_tb;

architecture Behavioral of batchNorm_tb is

    -- Componente da testare
    COMPONENT batchNorm
    Generic (
        SHIFT : Integer;     -- number of shift (left + or right -)
        B : Integer          -- bias of batch norm   
    );
    Port ( 
        x : in STD_LOGIC_VECTOR;
        y : out STD_LOGIC_VECTOR
    );
    END COMPONENT;
    
    -- Inputs
    signal x : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    
    -- Outputs
    signal y : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    
   -- Clock period definitions
   constant clk_period : time := 10 ns;

begin

    -- Instanza del componente da testare
    test : entity work.batchNorm(negativeBatchNorm)         -- change entity to test
    Generic map (
        SHIFT => -1,
        B => 5
    )
    Port map (
        x => x,
        y => y
    );
    
    -- Process di simulazione
    sim_proc : process
    begin
        
        wait for clk_period;
        x <= "0001000";
        
        wait for clk_period;
        x <= "0000111";
    
        wait for clk_period;
        x <= "1111100";
        
        wait;
        
    end process;

end Behavioral;
