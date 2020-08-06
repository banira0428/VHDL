library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MULTIPLEXER is
    Port ( D3 : in std_logic_vector(3 downto 0);
           D2 : in std_logic_vector(3 downto 0);
           D1 : in std_logic_vector(3 downto 0);
           D0 : in std_logic_vector(3 downto 0);
           SEL : in std_logic_vector(1 downto 0);
           D_OUT : out std_logic_vector(4 downto 0));
end MULTIPLEXER;

architecture DATAFLOW of MULTIPLEXER is

begin
  process ( SEL,D0,D1,D2,D3 ) begin
    case SEL is
      when "00" => D_OUT <= '1' & D0;
      when "01" => D_OUT <= '1' & D1;
      when "10" => D_OUT <= '0' & D2;
      when "11" => D_OUT <= '1' & D3;
      when others => null;
    end case;
  end process;
end DATAFLOW;
