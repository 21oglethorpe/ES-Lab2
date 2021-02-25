--
-- filename:    blinker_tb.vhd
-- written by:  steve dinicolantonio
-- description: testbench for blinker.vhd
-- notes:       
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity debounce_tb is
end debounce_tb;

architecture testbench of debounce_tb is

    signal tb_clk : std_logic := '0';
    signal tb_output  : std_logic := '0';
        signal tb_button  : std_logic := '0';

    component debounce is
        port(clk, btn : in std_logic;
         dbnc : out std_logic := '0');
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
    btn_gen_proc: process
        begin
        
            wait for 100 ms;
            tb_button <= '1';
            
            wait for 100 ms;
            tb_button <= '0';
        
        end process btn_gen_proc;

    
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------

    dut : debounce
    port map (
    
        clk  => tb_clk,
        dbnc => tb_output,
        btn => tb_button
    );

    
end testbench; 
