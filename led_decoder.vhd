library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_DECODER is
    Port ( D_IN : in  std_logic_vector(4 downto 0);
           D_OUT : out std_logic_vector(7 downto 0));
end LED_DECODER;

architecture DATAFLOW of LED_DECODER is

begin
  process ( D_IN ) begin
    case D_IN is
      when "10000" => D_OUT <= "11000000";
      when "10001" => D_OUT <= "11111001";
      when "10010" => D_OUT <= "10100100";
      when "10011" => D_OUT <= "10110000";
      when "10100" => D_OUT <= "10011001";
      when "10101" => D_OUT <= "10010010";
      when "10110" => D_OUT <= "10000010";
      when "10111" => D_OUT <= "11111000";
      when "11000" => D_OUT <= "10000000";
      when "11001" => D_OUT <= "10010000";
      when "00000" => D_OUT <= "01000000";
      when "00001" => D_OUT <= "01111001";
      when "00010" => D_OUT <= "00100100";
      when "00011" => D_OUT <= "00110000";
      when "00100" => D_OUT <= "00011001";
      when "00101" => D_OUT <= "00010010";
      when "00110" => D_OUT <= "00000010";
      when "00111" => D_OUT <= "01111000";
      when "01000" => D_OUT <= "00000000";
      when "01001" => D_OUT <= "00010000";
      when others  => null ;
    end case;
  end process;
end DATAFLOW;
