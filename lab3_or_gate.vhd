-- note:  port map
---------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity OR_Gate is
    port(A, B: in std_logic; C: out std_logic);
end OR_Gate;

architecture OR2_arch of OR_Gate is
begin
    C <= A or B;
end OR2_arch;
---------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity TB is
end TB;

architecture test of TB is
    signal A_tb, B_tb, C_tb: std_logic;
    component OR_Gate
        port(A, B: in std_logic; C: out std_logic);
    end component;
begin
    UUT: OR_Gate port map(A_tb, B_tb, C_tb);
    stim_proc: process
    begin
        A_tb <= '0'; B_tb <= '0'; 
		wait for 10 ns;
        A_tb <= '0'; B_tb <= '1'; 
		wait for 10 ns;
        A_tb <= '1'; B_tb <= '0'; 
		wait for 10 ns;
        A_tb <= '1'; B_tb <= '1'; 
		wait for 10 ns;
		wait; 
    end process;
end test;
