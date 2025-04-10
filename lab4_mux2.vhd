library ieee;
use ieee.std_logic_1164.all;

entity E1 is
    port(X1, X2, S: in std_logic; Y: out std_logic);
end E1;

architecture arch of E1 is
begin
    Y <= X1 when S = '1' else X2;
end arch;