library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package util is
  constant ADDR_WIDTH : integer := 4;

  constant ST   : std_logic_vector(5 downto 0) := "000001";
  constant ADD  : std_logic_vector(5 downto 0) := "000110";
  constant ADDI : std_logic_vector(5 downto 0) := "001001";
  constant BEQ  : std_logic_vector(5 downto 0) := "010001";

  type mem_out_t is record
    d : unsigned(31 downto 0);
    busy : std_logic;
  end record mem_out_t;

  type mem_in_t is record
    a : unsigned(19 downto 0);
    d : unsigned(31 downto 0);
    go : std_logic;
    we : std_logic;
  end record mem_in_t;

  constant default_mem_in : mem_in_t := (
    a => x"00000",
    d => x"00000000",
    go => '0',
    we => '0');

  type alu_in_t is record
    d1 : unsigned(31 downto 0);
    d2 : unsigned(31 downto 0);
    ctrl : unsigned(2 downto 0);
  end record alu_in_t;

  type alu_out_t is record
    d : unsigned(31 downto 0);
  end record alu_out_t;

  type reg_in_t is record
    we : std_logic;
    a1 : unsigned(5 downto 0);
    a2 : unsigned(5 downto 0);
    d  : unsigned(31 downto 0);
  end record reg_in_t;

  constant default_reg_in : reg_in_t := (
    we => '0',
    a1 => (others => '0'),
    a2 => (others => '0'),
    d => (others => '0'));

  type reg_out_t is record
    d1 : unsigned(31 downto 0);
    d2 : unsigned(31 downto 0);
  end record reg_out_t;


  type fetch_t is record
    pc    : unsigned(ADDR_WIDTH-1 downto 0);
  end record fetch_t;

  constant default_f :fetch_t :=
    (pc => (others => '0'));

  type decode_t is record
    pc    : unsigned(ADDR_WIDTH-1 downto 0);
    op    : std_logic_vector(5 downto 0);
    a1    : unsigned(5 downto 0);
    a2    : unsigned(5 downto 0);
    dest  : unsigned(5 downto 0);
    data   : unsigned(31 downto 0);
  end record decode_t;

  constant default_d : decode_t := (
    pc => (others => '0'),
    op => ADDI,
    a1 => (others => '0'),
    a2 => (others => '0'),
    dest => (others => '0'),
    data => (others => '0'));

  type execute_t is record
    op     : std_logic_vector(5 downto 0);
    dest   : unsigned(5 downto 0);
    data   : unsigned(31 downto 0);
    branch : std_logic;
    alu    : alu_in_t;
  end record execute_t;

  constant default_e : execute_t := (
    op => ADDI,
    dest => (others => '0'),
    data => (others => '0'),
    branch => '0',
    alu => (d1 => (others => '0'),
            d2 => (others => '0'),
            ctrl => (others => '0')));

  type memory_access_t is record
    op     : std_logic_vector(5 downto 0);
    dest   : unsigned(5 downto 0);
    data   : unsigned(31 downto 0);
  end record memory_access_t;

  constant default_m : memory_access_t := (
    op => ADDI,
    dest => (others => '0'),
    data => (others => '0'));

  type cpu_t is record
    state : std_logic;
    f : fetch_t;
    d : decode_t;
    e : execute_t;
    m : memory_access_t;
    reg: reg_in_t;
    mem: mem_in_t;
  end record cpu_t;

  constant init_r : cpu_t := (
    state => '0',
    f => default_f,
    d => default_d,
    e => default_e,
    m => default_m,
    reg => default_reg_in,
    mem => default_mem_in);

end package util;
