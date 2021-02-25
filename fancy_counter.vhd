LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity fancy_counter is
port(clk, clk_en,  en, ld, rst, updn : in std_logic;
     dir : in std_logic;
     val: in std_logic_vector(3 downto 0);
     cnt: out std_logic_vector(3 downto 0));
end fancy_counter;
architecture circuit of fancy_counter is

signal value: std_logic_vector(3 downto 0) := "1010";
signal count: std_logic_vector(3 downto 0):= "0000";
signal realDir: std_logic := '1';

begin
cnt <= count;
    process(clk)
    begin
    if (rising_edge(clk)) then
    
        if(en = '1') then
            if (rst ='1') then 
                count <= "0000";
            end if;
            if(clk_en = '1') then
                if(ld = '1') then
                    value <= val;
                end if;
                if(updn = '1') then
                    realDir <= dir;
                end if;
                if(realDir = '1') then
                    if(count >= value) then
                        count <= "0000";
                    else
                        count <=   std_logic_vector(unsigned(count) + 1);
                    end if;
                else
                    if (count = "0000") then
                        count <= value;
                    else
                        count <=   std_logic_vector(unsigned(count) - 1);
                    end if;
                end if;
                
            
            end if;
        end if;
    end if;
    end process;
end circuit;
