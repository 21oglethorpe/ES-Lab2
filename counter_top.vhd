
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_top is
port(btn: in std_logic_vector(3 downto 0);
     sw : in std_logic_vector(3 downto 0);
     clk : in std_logic;
     led: out std_logic_vector(3 downto 0));
end counter_top;

architecture Behavioral of counter_top is
component clock_div
port (
  clk : in std_logic;
  div : out std_logic
);
end component;
component debounce
port(clk, btn : in std_logic;
     dbnc : out std_logic := '0');
     end component;
component fancy_counter
port(clk, clk_en,  en, ld, rst, updn : in std_logic;
     dir : in std_logic;
     val: in std_logic_vector(3 downto 0);
     cnt: out std_logic_vector(3 downto 0));
     end component;
     signal  inp_clk_en, inp_en, inp_ld, inp_rst, inp_updn : std_logic;
begin
u1: debounce
port map (btn => btn(0), clk => clk, dbnc => inp_rst);
u2: debounce
port map (btn => btn(1), clk => clk, dbnc => inp_en);
u3: debounce
port map (btn => btn(2), clk => clk, dbnc => inp_updn);
u4: debounce
port map (btn => btn(3), clk => clk, dbnc => inp_ld);
u5: clock_div
port map (clk => clk, div => inp_clk_en);
u6: fancy_counter
port map (clk => clk, clk_en => inp_clk_en, dir => sw(0), en => inp_en, ld => inp_ld, rst => inp_rst, updn => inp_updn, val => sw, cnt => led);
end Behavioral;
