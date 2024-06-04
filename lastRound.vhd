library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity lastRound is
Port ( roundlastin : in  std_logic_vector (127 downto 0);
       keylastin : in  std_logic_vector (127 downto 0);
	   garbage: in std_logic_vector(7 downto 0);
       roundlastout : out  std_logic_vector (127 downto 0));
end lastRound;

architecture Behavioral of roundlast is

component subbytes is
    Port ( data_in : in  std_logic_vector (127 downto 0);
           data_out : out  std_logic_vector (127 downto 0));
end component;

component shiftrows is
    Port ( data_in : in  std_logic_vector (127 downto 0);
            data_out : out  std_logic_vector (127 downto 0));
end component;

component KeyGenerator is
Port ( a  :in  std_logic_vector (127 downto 0);
           rcon  :  in  std_logic_vector (7 downto 0);
           b  :  out  std_logic_vector (127 downto 0));
end component;

signal subout,shiftout,keyout:std_logic_vector(127 downto 0);
begin

q1: KeyGenerator port map (keylastin,garbage,keyout);

q2:subbytes port map(roundlastin,subout);
	
q3:shiftrows  port map(subout,shiftout);

roundlastout <= shiftout xor keyout;


end Behavioral;
