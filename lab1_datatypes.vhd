library ieee;
use ieee.std_logic_1164.all;

entity E1 is
end E1;

architecture behavior of E1 is
    constant BUS_WIDTH: integer := 8;
    signal CLOCK: std_logic := '0';
    signal DATA: std_logic_vector(7 downto 0);
    type car_state is (STOP, SLOW, MEDIUM, FAST);
    signal current_state: car_state := STOP;
begin
end behavior;