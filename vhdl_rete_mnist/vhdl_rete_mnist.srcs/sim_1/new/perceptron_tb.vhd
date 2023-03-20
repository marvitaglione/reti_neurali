----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.11.2022 12:29:13
-- Design Name: 
-- Module Name: entity work.perceptron(LUT6_2)_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity entity work.perceptron(LUT6_2)_tb is
--  Port ( );
end entity work.perceptron(LUT6_2)_tb;

architecture Behavioral of entity work.perceptron(LUT6_2)_tb is

    -- Componente da testare
    COMPONENT entity work.perceptron(LUT6_2)
    GENERIC (
        INPUT_SIZE : Integer := 784;
        WEIGHTS : STD_LOGIC_VECTOR := (others => '0')
    );
    PORT ( 
        x : in STD_LOGIC_VECTOR(INPUT_SIZE - 1 downto 0);
        y : out STD_LOGIC_VECTOR(integer(ceil(log2(real(2*INPUT_SIZE + 1)))) - 1 downto 0)
   );
    END COMPONENT;
    
    -- Inputs
    signal x : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
    -- Outputs
    signal y : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    
   -- Clock period definitions
   constant clk_period : time := 10 ns;

begin

    -- Instanza del componente da testare
    pp : entity work.perceptron(LUT6_2) 
    Generic map (
        INPUT_SIZE => 8,
        WEIGHTS => "11110000"
    )
    Port map (
        x => x,
        y => y
    );


    -- Process di simulazione
    sim_proc : process
    begin
        
        wait for clk_period;
        x <= "00000000";
        assert y = "00000" report "Output 1 errato";
        
        wait for clk_period;
        x <= "10001110";
        assert y = "00100" report "Output 2 errato";
    
        wait;
        
    end process;

end Behavioral;
