library ieee;
use ieee.std_logic_1164.all;

entity E1 is
    port(A, B, C, D: in std_logic; Z: out std_logic);
end E1;

architecture behavior of E1 is
begin
    process(A, B, C, D)
        variable temp1, temp2: std_logic;
    begin
        temp1 := A and B;
        temp2 := C and D;
        Z <= temp1 or temp2;
    end process;
end behavior;