-- takeaway:  clk gen clk_process
-- takeaway:  stop_clk
---------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB is
end TB;

architecture behavior of TB is
    signal Qin: std_logic := '0';
    signal clk: std_logic := '0';
    signal Qout: std_logic;
    signal stop_clk: boolean := false;  -- Control signal to stop the clock

    component D_FF
        port(
            Qin: in std_logic;
            clk: in std_logic;
            Qout: out std_logic
        );
    end component;

begin
    uut: D_FF port map (
        Qin => Qin,
        clk => clk,
        Qout => Qout
    );

    -- Clock process
    clk_gen : process   
    begin
        while not stop_clk loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;  -- Stop the process
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Initial state
        Qin <= '0';
        wait for 10 ns;
        assert (Qout = '0') report "Test case 1 failed" severity error;

        -- Test case 2: Set Qin to '1'
        Qin <= '1';
        wait for 10 ns;
        assert (Qout = '1') report "Test case 2 failed" severity error;

        -- Test case 3: Set Qin to '0'
        Qin <= '0';
        wait for 10 ns;
        assert (Qout = '0') report "Test case 3 failed" severity error;

        -- Test case 4: Set Qin to '1' again
        Qin <= '1';
        wait for 10 ns;
        assert (Qout = '1') report "Test case 4 failed" severity error;
        
        wait for 10 ns;
        stop_clk <= true;  -- Stop the clk_gen

        wait;
    end process;
end behavior;
---------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
    port(Qin, clk: in std_logic; 
	     Qout: out std_logic);
end D_FF;

architecture behavior of D_FF is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            Qout <= Qin;
        end if;
    end process;
end behavior;