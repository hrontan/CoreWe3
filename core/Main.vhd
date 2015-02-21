library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Util.all;

entity Main is
  generic (
    wtime : std_logic_vector(15 downto 0) := x"023D");
  port (
    clk   : in    std_logic;
    RS_TX : out   std_logic;
    RS_RX : in    std_logic;
    ZD    : inout std_logic_vector(31 downto 0);
    ZA    : out   std_logic_vector(19 downto 0);
    XWA   : out   std_logic);
end Main;

architecture Main_arch of Main is

  component Memory is
    generic (
      wtime : std_logic_vector(15 downto 0) := wtime);
    port (
      clk   : in    std_logic;
      RS_RX : in    std_logic;
      RS_TX : out   std_logic;
      ZD    : inout std_logic_vector(31 downto 0);
      ZA    : out   std_logic_vector(19 downto 0);
      XWA   : out   std_logic;
      mem_i  : in  mem_in_t;
      mem_o  : out mem_out_t);
  end component;

  component Control is
    port(
      clk   : in  std_logic;
      mem_o  : in  mem_out_t;
      mem_i  : out mem_in_t);
  end component;

  signal dmem_i : mem_in_t;
  signal dmem_o : mem_out_t;

begin

  ram_unit : Memory port map (
    clk   => clk,
    RS_RX => RS_RX,
    RS_TX => RS_TX,
    ZD    => ZD,
    ZA    => ZA,
    XWA   => XWA,
    mem_i => dmem_i,
    mem_o => dmem_o);

  contol_unit : Control port map (
    clk   => clk,
    mem_o => dmem_o,
    mem_i => dmem_i);

end Main_arch;
