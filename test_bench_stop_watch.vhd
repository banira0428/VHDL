library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TEST_BENCH_STOP_WATCH is
end TEST_BENCH_STOP_WATCH;

architecture SIMULATION of TEST_BENCH_STOP_WATCH is

component STOP_WATCH 
    Port ( CK    : in  std_logic;
           START : in  std_logic;
           STOP  : in  std_logic;
           RESET : in  std_logic;
           S     : out std_logic_vector(3 downto 0);
           Y     : out std_logic_vector(7 downto 0);
           N3    : out std_logic_vector(3 downto 0);
           N2    : out std_logic_vector(3 downto 0);
           N1    : out std_logic_vector(3 downto 0);
           N0    : out std_logic_vector(3 downto 0));
end component;

signal SCK, SSTART, SSTOP, SRESET: STD_LOGIC ; 
signal SS, SN3, SN2, SN1, SN0: STD_LOGIC_VECTOR (3 downto 0); 
signal SY: STD_LOGIC_VECTOR (7 downto 0); 

begin
    M1: STOP_WATCH port map ( CK => SCK, START => SSTART, STOP => SSTOP, RESET => SRESET, S => SS, Y => SY, N3 => SN3, N2 => SN2, N1 => SN1, N0 => SN0 );

    P1: process begin
        SCK <= '0';
        wait for 5 ns; 
        SCK <= '1';
        wait for 5 ns; 
        if SN1 = "0001" and SN0 = "0011" then
            wait;
        end if;
    end process;        

    P2: process begin
        SSTART <= '0'; SSTOP <= '0';SRESET <= '1'; wait for 10 ns; 
        SRESET <= '0';                             wait for 10 ns; 
        SSTART <= '1';                             wait for 10 ns; 
        SSTART <= '0';
        wait for 20 ms; 
        SSTOP <= '1';                              wait for 10 ns; 
        SSTOP <= '0';
        wait for 20 ms; 
        SRESET <= '1';                             wait for 10 ns; 
        SRESET <= '0'; 
        wait for 10 ms; 
        SSTART <= '1';                             wait for 10 ns; 
        SSTART <= '0';
        wait;
    end process;        
end SIMULATION;

configuration CONFIGURATION_STOP_WATCH of TEST_BENCH_STOP_WATCH is
    for SIMULATION
    end for;
end CONFIGURATION_STOP_WATCH; 