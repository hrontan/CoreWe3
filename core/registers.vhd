library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity registers is
  port (
    clk : in std_logic;
    we : in std_logic;
    addr1 : in std_logic_vector(3 downto 0);
    addr2 : in std_logic_vector(3 downto 0);
    in_word : in std_logic_vector(31 downto 0);
    out_word1 : out std_logic_vector(31 downto 0);
    out_word2 : out std_logic_vector(31 downto 0));
  
end registers;

architecture arch_registers of registers is
  type ram_t is array(15 downto 0) of std_logic_vector(31 downto 0);
  signal RAM : ram_t := (
    x"00000000", x"00000000", x"00000000", x"00000000", 
    x"00000000", x"00000000", x"00000000", x"00000000", 
    X"00000000", x"00000000", x"00000000", x"00000000", 
    x"00000000", x"00000000", x"00000000", x"00000000");
       
begin
  
  process(clk)
  begin
    if rising_edge(clk) then
      if we = '1' and addr1 /= "0000" then
        RAM(conv_integer(addr1)) <= in_word;
      end if;
    end if;
  end process;

  out_word1 <= RAM(conv_integer(addr1));

  out_word2 <= RAM(conv_integer(addr2));

end arch_registers;
  
