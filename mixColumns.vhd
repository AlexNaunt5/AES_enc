library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity mixcolumns is
    Port ( d_in : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
    end mixcolumns;
    
        architecture Behavioral of mixcolumns is
    signal p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15:std_logic_vector(7 downto 0);
    
    component mixcolumnE is
        Port ( i1,i2,i3,i4: in STD_LOGIC_VECTOR (7 downto 0);
               data_out : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;
     
    begin
    
    d1:mixcolumnE port map(d_in(127 downto 120),d_in(119 downto 112),d_in(111 downto 104),d_in(103 downto 96),p0);
    d2:mixcolumnE port map(d_in(119 downto 112),d_in(111 downto 104),d_in(103 downto 96),d_in(127 downto 120),p1);
    d3:mixcolumnE port map(d_in(111 downto 104),d_in(103 downto 96),d_in(127 downto 120),d_in(119 downto 112),p2);
    d4:mixcolumnE port map(d_in(103 downto 96),d_in(127 downto 120),d_in(119 downto 112),d_in(111 downto 104),p3);
    
    d5:mixcolumnE port map(d_in(95 downto 88),d_in(87 downto 80),d_in(79 downto 72),d_in(71 downto 64),p4);
    d6:mixcolumnE port map(d_in(87 downto 80),d_in(79 downto 72),d_in(71 downto 64),d_in(95 downto 88),p5);
    d7:mixcolumnE port map(d_in(79 downto 72),d_in(71 downto 64),d_in(95 downto 88),d_in(87 downto 80),p6);
    d8:mixcolumnE port map(d_in(71 downto 64),d_in(95 downto 88),d_in(87 downto 80),d_in(79 downto 72),p7);
    
    d9:mixcolumnE port map(d_in(63 downto 56),d_in(55 downto 48),d_in(47 downto 40),d_in(39 downto 32),p8);
    d10:mixcolumnE port map(d_in(55 downto 48),d_in(47 downto 40),d_in(39 downto 32),d_in(63 downto 56),p9);
    d11:mixcolumnE port map(d_in(47 downto 40),d_in(39 downto 32),d_in(63 downto 56),d_in(55 downto 48),p10);
    d12:mixcolumnE port map(d_in(39 downto 32),d_in(63 downto 56),d_in(55 downto 48),d_in(47 downto 40),p11);
    
    d13:mixcolumnE port map(d_in(31 downto 24),d_in(23 downto 16),d_in(15 downto 8),d_in(7 downto 0),p12);
    d14:mixcolumnE port map(d_in(23 downto 16),d_in(15 downto 8),d_in(7 downto 0),d_in(31 downto 24),p13);
    d15:mixcolumnE port map(d_in(15 downto 8),d_in(7 downto 0),d_in(31 downto 24),d_in(23 downto 16),p14);
    d16:mixcolumnE port map(d_in(7 downto 0),d_in(31 downto 24),d_in(23 downto 16),d_in(15 downto 8),p15);
    
    data_out <=p0&p1&p2&p3&p4&p5&p6&p7&p8&p9&p10&p11&p12&p13&p14&p15;
    
    
    end Behavioral;