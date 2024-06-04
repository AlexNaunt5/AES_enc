library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity rounds is
    Port ( roundin : in  std_logic_vector (127 downto 0);
           keyin : in  std_logic_vector (127 downto 0);
           keyout : inout  std_logic_vector (127 downto 0);
		   garbage : in std_logic_vector (7 downto 0);
           roundout : out  std_logic_vector (127 downto 0)
			  );
end rounds;

architecture Behavioral of rounds is
component addroundkey is
    Port ( key_in : in std_logic_vector (127 downto 0);
           data_in : in  std_logic_vector (127 downto 0);
          add_out : out std_logic_vector (127 downto 0));
end component;

component subbytes is
    Port ( d_in : in  std_logic_vector (127 downto 0);
           d_out : out  std_logic_vector (127 downto 0));
end component;

component shiftrows is
    Port ( data_in : in  std_logic_vector (127 downto 0);
           data_out : out  std_logic_vector (127 downto 0));
end component;

component mixcolumns is
    Port ( d_in : in  std_logic_vector (127 downto 0);
           data_out : out  std_logic_vector (127 downto 0));
end component;

component KeyGenerator is
Port ( a  :in  std_logic_vector (127 downto 0);
           rcon  :  in  std_logic_vector (7 downto 0);
           b  :  out  std_logic_vector (127 downto 0));
end component;

signal subout, shiftout, mixcolout:std_logic_vector(127 downto 0);

begin

w1: KeyGenerator port map (keyin,garbage,keyout);

w2:subbytes port map(roundin,subout);

w3:shiftrows  port map(subout,shiftout);

w4:mixcolumns port map(shiftout,mixcolout);

w5:addroundkey  port map(keyout,mixcolout,roundout);

end Behavioral;
