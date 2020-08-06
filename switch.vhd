library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SWITCH is
    Port ( S_IN  : in  std_logic;
           START : in  std_logic;
           STOP  : in  std_logic;
           S_OUT : out std_logic);
end SWITCH;

architecture BEHAVIOR of SWITCH is

signal SS : std_logic_vector(1 downto 0);
signal MASK : std_logic;

begin

  S_OUT <= MASK and S_IN;

  SS <= START & STOP ;
  process ( SS ) begin
    if ( SS = "10" ) then
      MASK <= '1';
    elsif ( SS = "01" ) then
      MASK <= '0';
    end if;
  end process;

end BEHAVIOR;
