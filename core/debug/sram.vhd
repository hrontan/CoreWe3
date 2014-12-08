library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SRAM is
  generic (
    WIDTH : integer := 16);
  port (
    clk : in std_logic;
    ZD : inout std_logic_vector(31 downto 0);
    ZA : in std_logic_vector(19 downto 0);
    XWA : in std_logic);
end SRAM;

architecture arch_sram of SRAM is
  constant SIZE :integer := 2 ** WIDTH;
  
  type RAM_t is array (0 to SIZE -1) of std_logic_vector(31 downto 0);
  signal RAM : RAM_t;

  signal xwa1 : std_logic := '1';
  signal xwa2 : std_logic := '1';
  signal addr1: std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal addr2: std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin

  process(clk)
  begin
    if rising_edge(clk) then
      xwa1 <= XWA;
      xwa2 <= xwa1;
      addr1 <= ZA(WIDTH-1 downto 0);
      addr2 <= addr1;
      if xwa1 = '0' then
        ZD <= (others => 'Z');
      else
        ZD <= RAM(conv_integer(addr1));
      end if;
      if xwa2 = '0' then
        RAM(conv_integer(addr2)) <= ZD;
      end if;
    end if;
  end process;

end arch_sram;
