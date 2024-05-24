library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity addroundkey is
port(
key_in : in std_logic_vector (127 downto 0);
data_in : in  std_logic_vector (127 downto 0);
add_out : out std_logic_vector (127 downto 0));
end addroundkey;

architecture Behavioral of addroundkey is
begin
add_out <= key_in xor data_in;
end Behavioral;