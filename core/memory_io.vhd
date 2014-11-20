library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memory_io is
  generic(
    wtime : std_logic_vector(15 downto 0) := x"1ADB";
    debug : boolean := false);
  port (
    clk        : in    std_logic;
    RS_RX      : in    std_logic;
    RS_TX      : out   std_logic;
    ZD         : inout std_logic_vector(31 downto 0);
    ZA         : out   std_logic_vector(19 downto 0);
    XWA        : out   std_logic;
    store_data : in    std_logic_vector(31 downto 0);
    load_data  : out   std_logic_vector(31 downto 0);
    addr       : in    std_logic_vector(19 downto 0);
    we         : in    std_logic;
    go         : in    std_logic;
    busy       : out   std_logic);
end memory_io;

architecture arch_memory_io of memory_io is

  component IO_buffer is
    generic (
      wtime : std_logic_vector(15 downto 0) := wtime;
      debug : boolean := debug);
    port (
      clk           : in  std_logic;
      RS_RX         : in  std_logic;
      RS_TX         : out std_logic;
      we            : in  std_logic;
      go            : in  std_logic;
      transmit_data : in  std_logic_vector(7 downto 0);
      receive_data  : out std_logic_vector(7 downto 0);
      busy : out std_logic);
  end component;

  component ram_controller is
    port (
      clk    : in    std_logic;
      ZD     : inout std_logic_vector(31 downto 0);
      ZA     : out   std_logic_vector(19 downto 0);
      XWA    : out   std_logic;
      input  : in    std_logic_vector(31 downto 0);
      output : out   std_logic_vector(31 downto 0);
      addr   : in    std_logic_vector(19 downto 0);
      we     : in    std_logic;
      go     : in    std_logic;
      busy   : out   std_logic);
  end component;

  signal state : std_logic_vector(3 downto 0) := (others => '0');

  signal iogo : std_logic := '0';
  signal iowe : std_logic := '0';
  signal ioload_data : std_logic_vector(7 downto 0);
  signal iobusy : std_logic;
  signal transmit : std_logic_vector(7 downto 0);
  signal receive : std_logic_vector(7 downto 0);
  
  signal ramgo : std_logic := '0';
  signal ramwe : std_logic := '0';
  signal ramload_data : std_logic_vector(31 downto 0);
  signal rambusy : std_logic;
  signal load : std_logic_vector(31 downto 0);
  signal store : std_logic_vector(31 downto 0);
  signal addr_buf : std_logic_vector(19 downto 0);
    
begin

  IO : IO_buffer port map (
    clk           => clk,
    RS_RX         => RS_RX,
    RS_TX         => RS_TX,
    we            => iowe,
    go            => iogo,
    transmit_data => transmit,
    receive_data  => receive,
    busy          => iobusy);

  ram : ram_controller port map (
    clk    => clk,
    ZD     => ZD,
    ZA     => ZA,
    XWA    => XWA,
    input  => store,
    output => load,
    addr   => addr_buf,
    we     => ramwe,
    go     => ramgo,
    busy   => rambusy);

  busy <= '0' when state = x"0" else
          '1';

  --iogo <= go when addr = x"FFFFF" else
  --        '0';
  --ramgo <= go when addr /= x"FFFFF" else
  --         '0';
  --load_data <= x"000000" & ioload_data when state = '0' else
  --             ramload_data;
  --busy <= iobusy or rambusy;

  --process(memclk)
  --begin
  --  if rising_edge(memclk) then
  --    if we = '0' and go = '1' then
  --      if addr = x"FFFFF" then --io
  --        state <= '0';
  --      else --ram
  --        state <= '1';
  --      end if;
  --    end if;
  --  end if;
  --end process;

  process(clk)
  begin
    if rising_edge(clk) then
      case state is
        when x"0" =>
          if go = '1' then
            if addr = x"FFFFF" then
              iogo <= '1';
              iowe <= we;
              if we = '1' then
                transmit <= store_data(7 downto 0);
                state <= x"1";
              else
                state <= x"2";
              end if;
            else
              ramgo <= '1';
              ramwe <= we;
              addr_buf <= addr;
              if we = '1' then
                store <= store_data;
                state <= x"3";
              else
                state <= x"4";
              end if;
            end if;
          end if;
        when x"1" => --transmit
          iogo <= '0';
          if iogo = '0' and iobusy = '0' then
            state <= x"0";
          end if;
        when x"2" => --receive
          iogo <= '0';
          if iogo = '0' and iobusy = '0' then
            state <= x"0";
            load_data <= x"000000" & receive;
          end if;
        when x"3" => --store
          ramgo <= '0';
          if ramgo = '0' and rambusy = '0' then
            state <= x"0";
          end if;
        when x"4" => --load
          ramgo <= '0';
          if ramgo = '0' and rambusy = '0' then
            state <= x"0";
            load_data <= load;
          end if;
        when others =>
          if iobusy = '0' and rambusy = '0' then
            state <= x"0";
            iogo <= '0';
            ramgo <= '0';
          end if;
      end case;
    end if;
  end process;
  
end arch_memory_io;
