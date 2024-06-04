library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AES is
    Port ( 
        clk : in  STD_LOGIC;
        start : in  STD_LOGIC;  -- Señal de entrada para iniciar el proceso
        finalout : out  STD_LOGIC_VECTOR (7 downto 0);
        endFlag : out  STD_LOGIC  -- Señal de salida para indicar que el proceso ha terminado
    );
end AES;

architecture Behavioral of AES is

component rounds is
    Port (
        roundin : in  STD_LOGIC_VECTOR (127 downto 0);
        keyin : in  STD_LOGIC_VECTOR (127 downto 0);
        keyout : inout  STD_LOGIC_VECTOR (127 downto 0);
        garbage: in std_logic_vector (7 downto 0);
        roundout : out  STD_LOGIC_VECTOR (127 downto 0)
    );
end component;

component lastRound is
    Port (
        roundlastin : in  STD_LOGIC_VECTOR (127 downto 0);
        keylastin : in  STD_LOGIC_VECTOR (127 downto 0);
        garbage: in std_logic_vector (7 downto 0);
        roundlastout : out  STD_LOGIC_VECTOR (127 downto 0)
    );
end component;

signal preround : std_logic_vector (127 downto 0);
signal key1,key2,key3,key4,key5,key6,key7,key8,key9 : std_logic_vector (127 downto 0);
signal r1,r2,r3,r4,r5,r6,r7,r8,r9 : std_logic_vector (127 downto 0);
signal fout : STD_LOGIC_VECTOR (127 downto 0);

signal textin : std_logic_vector (127 downto 0) := x"3243f6a8885a308d313198a2e0370734";
signal key : std_logic_vector (127 downto 0) := x"2b7e151628aed2a6abf7158809cf4f3c";
signal processing : std_logic := '0';  -- Señal interna para el control del procesamiento

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if start = '1' and processing = '0' then
                -- Inicia el procesamiento
                preround <= textin xor key;
                processing <= '1';
                endFlag <= '0';
            elsif processing = '1' then
                -- Realiza las rondas del algoritmo AES
                o1: rounds port map(preround,key,key1,x"01",r1);
                o2: rounds port map(r1,key1,key2,x"02",r2);
                o3: rounds port map(r2,key2,key3,x"04",r3);
                o4: rounds port map(r3,key3,key4,x"08",r4);
                o5: rounds port map(r4,key4,key5,x"10",r5);
                o6: rounds port map(r5,key5,key6,x"20",r6);
                o7: rounds port map(r6,key6,key7,x"40",r7);
                o8: rounds port map(r7,key7,key8,x"80",r8);
                o9: rounds port map(r8,key8,key9,x"1b",r9);
                o10: roundlast port map(r9,key9,x"36",fout);

                finalout <= fout (127 downto 120);

                -- Termina el procesamiento
                processing <= '0';
                endFlag <= '1';
            end if;
        end if;
    end process;

end Behavioral;
