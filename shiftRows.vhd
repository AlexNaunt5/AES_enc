library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity shiftrows is
Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end shiftrows;

architecture Behavioral of shiftrows is
signal p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15:std_logic_vector(7 downto 0);
begin
 p15<=data_in(7 downto 0);	 
 p11<=data_in(39 downto 32);		 
 p7<=data_in(71 downto 64);		 
 p3<=data_in(103 downto 96);	
	 
 p14<=data_in(15 downto 8);
 p10<=data_in(47 downto 40);
 p6<=data_in(79 downto 72);	
 p2<=data_in(111 downto 104);
	
 p13<=data_in(23 downto 16);	
 p9<=data_in(55 downto 48);	
 p5<=data_in(87 downto 80);	
 p1<=data_in(119 downto 112);	

 p12<=data_in(31 downto 24);	
 p8<=data_in(63 downto 56);	
 p4<=data_in(95 downto 88);	
 p0<=data_in(127 downto 120);	

data_out <= p0&p5&p10&p15&p4&p9&p14&p3&p8&p13&p2&p7&p12&p1&p6&p11;	

end Behavioral;