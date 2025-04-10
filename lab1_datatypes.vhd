--------  note ------------------------
-- from ref_langapp mod04
---------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity E1 is
end E1;

architecture ARCH of E1 is 
    signal sig1  : std_logic  := '0';
    signal sig1_u: std_ulogic := '1';

    signal bus1 : std_logic_vector(3 downto 0);
    signal bus2 : std_logic_vector(3 downto 0);
    signal bus3 : std_logic_vector(0 to 3);
    signal bus_8bits: std_logic_vector(7 downto 0);

    type t_state is (RESET, IDLE, DMA_CYCLE, INT_CYCLE);
    signal state : t_state;

    -- 2d array
    type t_4rows_8cols is array (0 to 3) of std_logic_vector(0 to 7);
    signal mem_4x8: t_4rows_8cols;

    -- simple record
    type t_r1 is record
        sig_bool: boolean; --true false
        sig_nat: natural; -- 0,1,2,3 ...
        sig_pos: positive; -- 1,2,3...
        sig_bit_vec: bit_vector(3 downto 0);
    end record;
    signal r1: t_r1;

    -- nested record
    type t_nr1 is record
        rec_r1: t_r1;
        sig_logic: std_logic;
    end record;
    signal nr1: t_nr1;

begin
-- start from timepoint 20ns, sig1 is driven by both 0 and 1, so result in X
    sig1 <= '1' after 20 ns;
    sig1 <= '0' after 20 ns;

--    sig1_u <= '1' after 40ns;  --error, cannot multi drivers
    sig1_u <= '0' after 40 ns;

    bus1 <= bus2;
    bus1 <= bus3;
    bus1 <= "1011";
--    bus1 <= "10_11"; --error, illegal character _ in string
    bus1 <= X"B"; --hex
--    bus1 <= O"23"; --oct, warning, xmsim: *E,TRASMM: array shape mismatch
    bus1 <=(sig1, sig1, sig1, sig1);

    bus_8bits <= (7 => '1',
                  5 downto 1 => '1',
                  6 => sig1,
                  others => '0');

    state <= RESET;

    mem_4x8(0) <= "11110000"; --binary
    mem_4x8(1) <= 8D"100"; --8 bits decimal 100
    mem_4x8(2) <= 8X"7B"; --8 bits hex
    mem_4x8(3) <= X"FF"; --hex
--    mem_4x8(4) <= X"FF"; --hex --error, index constraint violation

    r1.sig_bool <= true;
    nr1.rec_r1.sig_bool <= false;

end ARCH;