----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.12.2022 12:52:03
-- Design Name: 
-- Module Name: rete_mnist_ip_tb - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rete_mnist_ip_tb is
        generic (
            -- Users to add parameters here
            INFERENCE_COUNT_CLK : integer := 1; 
            -- User parameters ends
            -- Do not modify the parameters beyond this line
    
    
            -- Parameters of Axi Slave Bus Interface S_mnist_lite_AXI
            C_S_mnist_lite_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_mnist_lite_AXI_ADDR_WIDTH	: integer	:= 4;
    
            -- Parameters of Axi Slave Bus Interface S_mnist_full_AXI
            C_S_mnist_full_AXI_ID_WIDTH	: integer	:= 1;
            C_S_mnist_full_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_mnist_full_AXI_ADDR_WIDTH	: integer	:= 7;
            C_S_mnist_full_AXI_AWUSER_WIDTH	: integer	:= 0;
            C_S_mnist_full_AXI_ARUSER_WIDTH	: integer	:= 0;
            C_S_mnist_full_AXI_WUSER_WIDTH	: integer	:= 0;
            C_S_mnist_full_AXI_RUSER_WIDTH	: integer	:= 0;
            C_S_mnist_full_AXI_BUSER_WIDTH	: integer	:= 0
        );
end rete_mnist_ip_tb;

architecture Behavioral of rete_mnist_ip_tb is

    component rete_mnist_ip_v1_0
        generic (
            -- Users to add parameters here
            INFERENCE_COUNT_CLK : integer := 1; 
            -- User parameters ends
            -- Do not modify the parameters beyond this line
    
    
            -- Parameters of Axi Slave Bus Interface S_mnist_lite_AXI
            C_S_mnist_lite_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_mnist_lite_AXI_ADDR_WIDTH	: integer	:= 4;
    
            -- Parameters of Axi Slave Bus Interface S_mnist_full_AXI
            C_S_mnist_full_AXI_ID_WIDTH	: integer	:= 1;
            C_S_mnist_full_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_mnist_full_AXI_ADDR_WIDTH	: integer	:= 7;
            C_S_mnist_full_AXI_AWUSER_WIDTH	: integer	:= 0;
            C_S_mnist_full_AXI_ARUSER_WIDTH	: integer	:= 0;
            C_S_mnist_full_AXI_WUSER_WIDTH	: integer	:= 0;
            C_S_mnist_full_AXI_RUSER_WIDTH	: integer	:= 0;
            C_S_mnist_full_AXI_BUSER_WIDTH	: integer	:= 0
        );
        port (
            -- Users to add ports here
    
            -- User ports ends
            -- Do not modify the ports beyond this line
    
    
            -- Ports of Axi Slave Bus Interface S_mnist_lite_AXI
            s_mnist_lite_axi_aclk	: in std_logic;
            s_mnist_lite_axi_aresetn	: in std_logic;
            s_mnist_lite_axi_awaddr	: in std_logic_vector(C_S_mnist_lite_AXI_ADDR_WIDTH-1 downto 0);
            s_mnist_lite_axi_awprot	: in std_logic_vector(2 downto 0);
            s_mnist_lite_axi_awvalid	: in std_logic;
            s_mnist_lite_axi_awready	: out std_logic;
            s_mnist_lite_axi_wdata	: in std_logic_vector(C_S_mnist_lite_AXI_DATA_WIDTH-1 downto 0);
            s_mnist_lite_axi_wstrb	: in std_logic_vector((C_S_mnist_lite_AXI_DATA_WIDTH/8)-1 downto 0);
            s_mnist_lite_axi_wvalid	: in std_logic;
            s_mnist_lite_axi_wready	: out std_logic;
            s_mnist_lite_axi_bresp	: out std_logic_vector(1 downto 0);
            s_mnist_lite_axi_bvalid	: out std_logic;
            s_mnist_lite_axi_bready	: in std_logic;
            s_mnist_lite_axi_araddr	: in std_logic_vector(C_S_mnist_lite_AXI_ADDR_WIDTH-1 downto 0);
            s_mnist_lite_axi_arprot	: in std_logic_vector(2 downto 0);
            s_mnist_lite_axi_arvalid	: in std_logic;
            s_mnist_lite_axi_arready	: out std_logic;
            s_mnist_lite_axi_rdata	: out std_logic_vector(C_S_mnist_lite_AXI_DATA_WIDTH-1 downto 0);
            s_mnist_lite_axi_rresp	: out std_logic_vector(1 downto 0);
            s_mnist_lite_axi_rvalid	: out std_logic;
            s_mnist_lite_axi_rready	: in std_logic;
    
            -- Ports of Axi Slave Bus Interface S_mnist_full_AXI
            s_mnist_full_axi_aclk	: in std_logic;
            s_mnist_full_axi_aresetn	: in std_logic;
            s_mnist_full_axi_awid	: in std_logic_vector(C_S_mnist_full_AXI_ID_WIDTH-1 downto 0);
            s_mnist_full_axi_awaddr	: in std_logic_vector(C_S_mnist_full_AXI_ADDR_WIDTH-1 downto 0);
            s_mnist_full_axi_awlen	: in std_logic_vector(7 downto 0);
            s_mnist_full_axi_awsize	: in std_logic_vector(2 downto 0);
            s_mnist_full_axi_awburst	: in std_logic_vector(1 downto 0);
            s_mnist_full_axi_awlock	: in std_logic;
            s_mnist_full_axi_awcache	: in std_logic_vector(3 downto 0);
            s_mnist_full_axi_awprot	: in std_logic_vector(2 downto 0);
            s_mnist_full_axi_awqos	: in std_logic_vector(3 downto 0);
            s_mnist_full_axi_awregion	: in std_logic_vector(3 downto 0);
            s_mnist_full_axi_awuser	: in std_logic_vector(C_S_mnist_full_AXI_AWUSER_WIDTH-1 downto 0);
            s_mnist_full_axi_awvalid	: in std_logic;
            s_mnist_full_axi_awready	: out std_logic;
            s_mnist_full_axi_wdata	: in std_logic_vector(C_S_mnist_full_AXI_DATA_WIDTH-1 downto 0);
            s_mnist_full_axi_wstrb	: in std_logic_vector((C_S_mnist_full_AXI_DATA_WIDTH/8)-1 downto 0);
            s_mnist_full_axi_wlast	: in std_logic;
            s_mnist_full_axi_wuser	: in std_logic_vector(C_S_mnist_full_AXI_WUSER_WIDTH-1 downto 0);
            s_mnist_full_axi_wvalid	: in std_logic;
            s_mnist_full_axi_wready	: out std_logic;
            s_mnist_full_axi_bid	: out std_logic_vector(C_S_mnist_full_AXI_ID_WIDTH-1 downto 0);
            s_mnist_full_axi_bresp	: out std_logic_vector(1 downto 0);
            s_mnist_full_axi_buser	: out std_logic_vector(C_S_mnist_full_AXI_BUSER_WIDTH-1 downto 0);
            s_mnist_full_axi_bvalid	: out std_logic;
            s_mnist_full_axi_bready	: in std_logic;
            s_mnist_full_axi_arid	: in std_logic_vector(C_S_mnist_full_AXI_ID_WIDTH-1 downto 0);
            s_mnist_full_axi_araddr	: in std_logic_vector(C_S_mnist_full_AXI_ADDR_WIDTH-1 downto 0);
            s_mnist_full_axi_arlen	: in std_logic_vector(7 downto 0);
            s_mnist_full_axi_arsize	: in std_logic_vector(2 downto 0);
            s_mnist_full_axi_arburst	: in std_logic_vector(1 downto 0);
            s_mnist_full_axi_arlock	: in std_logic;
            s_mnist_full_axi_arcache	: in std_logic_vector(3 downto 0);
            s_mnist_full_axi_arprot	: in std_logic_vector(2 downto 0);
            s_mnist_full_axi_arqos	: in std_logic_vector(3 downto 0);
            s_mnist_full_axi_arregion	: in std_logic_vector(3 downto 0);
            s_mnist_full_axi_aruser	: in std_logic_vector(C_S_mnist_full_AXI_ARUSER_WIDTH-1 downto 0);
            s_mnist_full_axi_arvalid	: in std_logic;
            s_mnist_full_axi_arready	: out std_logic;
            s_mnist_full_axi_rid	: out std_logic_vector(C_S_mnist_full_AXI_ID_WIDTH-1 downto 0);
            s_mnist_full_axi_rdata	: out std_logic_vector(C_S_mnist_full_AXI_DATA_WIDTH-1 downto 0);
            s_mnist_full_axi_rresp	: out std_logic_vector(1 downto 0);
            s_mnist_full_axi_rlast	: out std_logic;
            s_mnist_full_axi_ruser	: out std_logic_vector(C_S_mnist_full_AXI_RUSER_WIDTH-1 downto 0);
            s_mnist_full_axi_rvalid	: out std_logic;
            s_mnist_full_axi_rready	: in std_logic
        );
    end component;
    
   -- Clock period definitions
   constant clk_period : time := 10 ns;
   
   signal clk : std_logic := '0';
   
   -- axi signals
   signal s_axi_aresetn : STD_LOGIC := '1';   
   
   -- axi signals lite
   signal s_mnist_lite_axi_awaddr	: std_logic_vector(C_S_mnist_lite_AXI_ADDR_WIDTH-1 downto 0) := (others => '0'); -- address scrittura
   signal s_mnist_lite_axi_awprot	: std_logic_vector(2 downto 0) := (others => '0');
   signal s_mnist_lite_axi_awvalid	: std_logic := '0'; -- handshake
   signal s_mnist_lite_axi_awready	: std_logic := '0'; -- handshake
   signal s_mnist_lite_axi_wdata	: std_logic_vector(C_S_mnist_lite_AXI_DATA_WIDTH-1 downto 0) := (others => '0'); -- dati scrittura
   signal s_mnist_lite_axi_wstrb	: std_logic_vector((C_S_mnist_lite_AXI_DATA_WIDTH/8)-1 downto 0) := (others => '1');
   signal s_mnist_lite_axi_wvalid	: std_logic := '0';
   signal s_mnist_lite_axi_wready	: std_logic := '0';
   signal s_mnist_lite_axi_bresp	: std_logic_vector(1 downto 0) := (others => '0'); -- status del burs
   signal s_mnist_lite_axi_bvalid	: std_logic := '0'; -- response write channel (out)
   signal s_mnist_lite_axi_bready	: std_logic := '0'; -- response write channel (in)
   signal s_mnist_lite_axi_araddr	: std_logic_vector(C_S_mnist_lite_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_lite_axi_arprot	: std_logic_vector(2 downto 0) := (others => '0'); -- normal access
   signal s_mnist_lite_axi_arvalid	: std_logic := '0';
   signal s_mnist_lite_axi_arready	: std_logic := '0';
   signal s_mnist_lite_axi_rdata	: std_logic_vector(C_S_mnist_lite_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_lite_axi_rresp	: std_logic_vector(1 downto 0) := (others => '0');
   signal s_mnist_lite_axi_rvalid	: std_logic := '0';
   signal s_mnist_lite_axi_rready	: std_logic := '0';
   
   -- axi signal full
   signal s_mnist_full_axi_awid	: std_logic_vector(C_S_mnist_full_AXI_ID_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_awaddr	: std_logic_vector(C_S_mnist_full_AXI_ADDR_WIDTH-1 downto 0) := (others => '0'); -- address scrittura;
   signal s_mnist_full_axi_awlen	: std_logic_vector(7 downto 0) := (others => '0');
   signal s_mnist_full_axi_awsize	: std_logic_vector(2 downto 0) := (others => '0');
   signal s_mnist_full_axi_awburst	: std_logic_vector(1 downto 0) := (others => '0');
   signal s_mnist_full_axi_awcache	: std_logic_vector(3 downto 0) := (others => '0');
   signal s_mnist_full_axi_awprot	: std_logic_vector(2 downto 0) := (others => '0');
   signal s_mnist_full_axi_awqos	: std_logic_vector(3 downto 0) := (others => '0');
   signal s_mnist_full_axi_awregion	: std_logic_vector(3 downto 0) := (others => '0');
   signal s_mnist_full_axi_awuser	: std_logic_vector(C_S_mnist_full_AXI_AWUSER_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_awvalid	: std_logic := '0';
   signal s_mnist_full_axi_awready	: std_logic := '0';
   signal s_mnist_full_axi_wdata	: std_logic_vector(C_S_mnist_full_AXI_DATA_WIDTH-1 downto 0);
   signal s_mnist_full_axi_wstrb	: std_logic_vector((C_S_mnist_full_AXI_DATA_WIDTH/8)-1 downto 0) := (others => '1');
   signal s_mnist_full_axi_wlast	: std_logic := '0';
   signal s_mnist_full_axi_wuser	: std_logic_vector(C_S_mnist_full_AXI_WUSER_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_wvalid	: std_logic := '0';
   signal s_mnist_full_axi_wready	: std_logic := '0';
   signal s_mnist_full_axi_bid	: std_logic_vector(C_S_mnist_full_AXI_ID_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_bresp	: std_logic_vector(1 downto 0) := (others => '0');
   signal s_mnist_full_axi_buser	: std_logic_vector(C_S_mnist_full_AXI_BUSER_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_bvalid	: std_logic := '0';
   signal s_mnist_full_axi_bready	: std_logic := '0';
   signal s_mnist_full_axi_arid	: std_logic_vector(C_S_mnist_full_AXI_ID_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_araddr	: std_logic_vector(C_S_mnist_full_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_arlen	: std_logic_vector(7 downto 0) := (others => '0');
   signal s_mnist_full_axi_arsize	: std_logic_vector(2 downto 0) := (others => '0');
   signal s_mnist_full_axi_arburst	: std_logic_vector(1 downto 0) := (others => '0');
   signal s_mnist_full_axi_arlock	: std_logic := '0';
   signal s_mnist_full_axi_arcache	: std_logic_vector(3 downto 0) := (others => '0');
   signal s_mnist_full_axi_arprot	: std_logic_vector(2 downto 0) := (others => '0');
   signal s_mnist_full_axi_arqos	: std_logic_vector(3 downto 0) := (others => '0');
   signal s_mnist_full_axi_arregion	: std_logic_vector(3 downto 0) := (others => '0');
   signal s_mnist_full_axi_aruser	: std_logic_vector(C_S_mnist_full_AXI_ARUSER_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_arvalid	: std_logic := '0';
   signal s_mnist_full_axi_arready	: std_logic := '0';
   signal s_mnist_full_axi_rid	: std_logic_vector(C_S_mnist_full_AXI_ID_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_rdata	: std_logic_vector(C_S_mnist_full_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_rresp	: std_logic_vector(1 downto 0) := (others => '0');
   signal s_mnist_full_axi_rlast	: std_logic := '0';
   signal s_mnist_full_axi_ruser	: std_logic_vector(C_S_mnist_full_AXI_RUSER_WIDTH-1 downto 0) := (others => '0');
   signal s_mnist_full_axi_rvalid	: std_logic := '0';
   signal s_mnist_full_axi_rready	: std_logic := '0';

begin

    -- Component to test
    rm_ip : rete_mnist_ip_v1_0
        port map (
            s_mnist_lite_axi_aclk	=> clk,
            s_mnist_lite_axi_aresetn => s_axi_aresetn,
            s_mnist_lite_axi_awaddr	=> s_mnist_lite_axi_awaddr, 
            s_mnist_lite_axi_awprot	=> s_mnist_lite_axi_awprot, -- accesso sicuro
            s_mnist_lite_axi_awvalid => s_mnist_lite_axi_awvalid, 
            s_mnist_lite_axi_awready => s_mnist_lite_axi_awready,
            s_mnist_lite_axi_wdata	=> s_mnist_lite_axi_wdata, 
            s_mnist_lite_axi_wstrb	=> s_mnist_lite_axi_wstrb, 
            s_mnist_lite_axi_wvalid	=> s_mnist_lite_axi_wvalid,
            s_mnist_lite_axi_wready	=> s_mnist_lite_axi_wready,
            s_mnist_lite_axi_bresp	=> s_mnist_lite_axi_bresp, 
            s_mnist_lite_axi_bvalid	=> s_mnist_lite_axi_bvalid,
            s_mnist_lite_axi_bready	=> s_mnist_lite_axi_bready,
            s_mnist_lite_axi_araddr	=> s_mnist_lite_axi_araddr, 
            s_mnist_lite_axi_arprot	=> s_mnist_lite_axi_arprot,
            s_mnist_lite_axi_arvalid => s_mnist_lite_axi_arvalid,
            s_mnist_lite_axi_arready=> s_mnist_lite_axi_arready,
            s_mnist_lite_axi_rdata	=> s_mnist_lite_axi_rdata, 
            s_mnist_lite_axi_rresp	=> s_mnist_lite_axi_rresp, 
            s_mnist_lite_axi_rvalid	=> s_mnist_lite_axi_rvalid,
            s_mnist_lite_axi_rready	=> s_mnist_lite_axi_rready,
    
            -- Ports of Axi Slave Bus Interface S_mnist_full_AXI
            s_mnist_full_axi_aclk	=> clk,
            s_mnist_full_axi_aresetn => s_axi_aresetn,
            s_mnist_full_axi_awid	=> s_mnist_full_axi_awid, 
            s_mnist_full_axi_awaddr	=> s_mnist_full_axi_awaddr,
            s_mnist_full_axi_awlen	=> s_mnist_full_axi_awlen, 
            s_mnist_full_axi_awsize	=> s_mnist_full_axi_awsize, 
            s_mnist_full_axi_awburst => s_mnist_full_axi_awburst,
            s_mnist_full_axi_awlock	=> '0',
            s_mnist_full_axi_awcache	=> s_mnist_full_axi_awcache, -- in
            s_mnist_full_axi_awprot	=> s_mnist_full_axi_awprot, -- accesso sicuro
            s_mnist_full_axi_awqos	=> s_mnist_full_axi_awqos, -- in
            s_mnist_full_axi_awregion	=> s_mnist_full_axi_awregion, -- in
            s_mnist_full_axi_awuser	=> s_mnist_full_axi_awuser, -- in
            s_mnist_full_axi_awvalid => s_mnist_full_axi_awvalid, -- in
            s_mnist_full_axi_awready => s_mnist_full_axi_awready, -- out
            s_mnist_full_axi_wdata	=> s_mnist_full_axi_wdata, -- in
            s_mnist_full_axi_wstrb	=> s_mnist_full_axi_wstrb, -- in
            s_mnist_full_axi_wlast	=> s_mnist_full_axi_wlast, -- in
            s_mnist_full_axi_wuser	=> s_mnist_full_axi_wuser, -- in
            s_mnist_full_axi_wvalid	=> s_mnist_full_axi_wvalid, -- in
            s_mnist_full_axi_wready	=> s_mnist_full_axi_wready, -- out
            s_mnist_full_axi_bid	=> s_mnist_full_axi_bid, -- out
            s_mnist_full_axi_bresp	=> s_mnist_full_axi_bresp, -- out
            s_mnist_full_axi_buser	=> s_mnist_full_axi_buser, -- out
            s_mnist_full_axi_bvalid	=> s_mnist_full_axi_bvalid, -- out
            s_mnist_full_axi_bready	=> s_mnist_full_axi_bready, -- in
            s_mnist_full_axi_arid	=> s_mnist_full_axi_arid, -- in
            s_mnist_full_axi_araddr	=> s_mnist_full_axi_araddr, -- in
            s_mnist_full_axi_arlen	=> s_mnist_full_axi_arlen, -- in
            s_mnist_full_axi_arsize	=> s_mnist_full_axi_arsize, -- in
            s_mnist_full_axi_arburst => s_mnist_full_axi_arburst, -- in
            s_mnist_full_axi_arlock	=> '0', -- in
            s_mnist_full_axi_arcache => s_mnist_full_axi_arcache, -- in
            s_mnist_full_axi_arprot	=> s_mnist_full_axi_arprot, -- in
            s_mnist_full_axi_arqos	=> s_mnist_full_axi_arqos, -- in
            s_mnist_full_axi_arregion	=> s_mnist_full_axi_arregion, -- in
            s_mnist_full_axi_aruser	=> s_mnist_full_axi_aruser, -- in
            s_mnist_full_axi_arvalid	=> s_mnist_full_axi_arvalid, -- in;
            s_mnist_full_axi_arready	=> s_mnist_full_axi_arready, -- out
            s_mnist_full_axi_rid	=> s_mnist_full_axi_rid, -- out
            s_mnist_full_axi_rdata	=> s_mnist_full_axi_rdata, -- out
            s_mnist_full_axi_rresp	=> s_mnist_full_axi_rresp, -- out
            s_mnist_full_axi_rlast	=> s_mnist_full_axi_rlast, -- out
            s_mnist_full_axi_ruser	=> s_mnist_full_axi_ruser, -- out
            s_mnist_full_axi_rvalid	=> s_mnist_full_axi_rvalid, -- out
            s_mnist_full_axi_rready	=> s_mnist_full_axi_rready -- in
               
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
   -- Stimulus process
   stim_proc: process
   begin		

    wait for 10ns;
    s_axi_aresetn <= '0';
    wait for 10ns;
    s_axi_aresetn <= '1';
    s_mnist_full_axi_awaddr <= "0000000";
    s_mnist_full_axi_awburst <= "01"; -- increment
    s_mnist_full_axi_awsize <= "010";
    s_mnist_full_axi_awlen <= x"19";
    s_mnist_full_axi_awvalid <= '1';
    
--    wait until s_mnist_full_axi_awready = '1';
--    wait for clk_period;
--    s_mnist_full_axi_awvalid <= '0';
--    s_mnist_full_axi_wdata <= x"FFFF0000";
--    s_mnist_full_axi_wvalid <= '1';
    
--    wait until s_mnist_full_axi_wready = '1';
--    wait for clk_period;
--    s_mnist_full_axi_wdata <= x"0000FFFF";
    
--    wait for clk_period;
--    s_mnist_full_axi_wdata <= x"33311111";
    
--    wait for clk_period;
--    s_mnist_full_axi_wdata <= x"BBAAAAAA";
--    s_mnist_full_axi_wlast <= '1';
    
--    wait for clk_period;
--    s_mnist_full_axi_wvalid <= '0';
--    s_mnist_full_axi_wlast <= '0';

    wait until s_mnist_full_axi_awready = '1';
    wait for clk_period;
    s_mnist_full_axi_awvalid <= '0';
    
    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000000000000";
    s_mnist_full_axi_wvalid <= '1';

    wait until s_mnist_full_axi_wready = '1';
    wait for 2*clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000111000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000011111111111111100000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000011111111111100000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000110000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000001100000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00110000000000000000000000000111";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000001100000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000111000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000001100000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000011000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000001100000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00111000000000000000000000000111";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000001100000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000110000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000011100000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000111000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000001110000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00011000000000000000000000000000";

    wait for clk_period;
    s_mnist_full_axi_wdata <= "00000000000000000000000000000000";
    s_mnist_full_axi_wlast <= '1'; 
    
    wait for clk_period;
    s_mnist_full_axi_wvalid <= '0';
    s_mnist_full_axi_wlast <= '0';
    
    -- Inizio predizione
    s_mnist_lite_axi_awaddr <= x"0";
    s_mnist_lite_axi_awvalid <= '1';
    s_mnist_lite_axi_wdata <= x"00000001"; -- start
    s_mnist_lite_axi_wvalid <= '1';
    
    wait until s_mnist_lite_axi_wready = '1';
    wait for clk_period;
    s_mnist_lite_axi_awvalid <= '0';
    s_mnist_lite_axi_wvalid <= '0';
    
    
    
    
    wait;
   end process;


end Behavioral;
