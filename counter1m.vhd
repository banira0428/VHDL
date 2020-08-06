library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity COUNTER1M is
    Port ( CK : in std_logic;
           Y : out std_logic;
           M : out std_logic_vector(1 downto 0));
end COUNTER1M;

architecture BEHAVIOR of COUNTER1M is

signal COUNT: std_logic_vector(3 downto 0) := "11110100001001000000";

begin

    M <= COUNT(1 downto 0)
            
    process ( CK ) begin
        if(CK'event and CK = '0') then
            if(COUNT = "11110100001000111111") then
                COUNT <= "00000000000000000000";
                Y <= '1';
            else
                COUNT <= COUNT + 1;
                Y <= '0';
            end if;
        end if;
    end process;
end BEHAVIOR;
