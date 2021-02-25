LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity reg is
    port (inp : in std_logic;
    CLK,LD         : in std_logic;
    result          : out std_logic);
end reg;
-- architecture
architecture mux1 of reg is
begin
    reg: process(CLK)
    begin
        if (rising_edge(CLK)) then
            if (LD = '1') then
                result <= inp;
            end if;
        end if;
    end process;
end mux1;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity circuit is
    port (clk: in std_logic;
          led0: inout std_logic);
end circuit;
architecture struct of circuit is

component counter 
port (
  clk : in std_logic;
  div : out std_logic
);
end component;

component reg
port (inp : in std_logic;
    CLK,LD         : in std_logic;
    result          : out std_logic);
    end component;
    
signal realCount : std_logic;
signal notLED0 : std_logic;
begin
notLED0 <= NOT led0;
count: counter
port map(clk => clk,
         div => realCount);
rg: reg
port map(clk => clk,
         LD => realCount,
         inp =>  notLED0,
         result => led0);
end struct;
