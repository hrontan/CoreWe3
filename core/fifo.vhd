--FIFO コンポーネント
--when clk rises, if igo is active, enqueue idata to fifo,
--and if ogo if active, dequeue to odata.
--if quque is empty, empty bit rises.
--if queue is full, full bit rises.
--when queue is empty and try to deq,
--the value of odata is undef but queue is consistent
--when queue is full and try to enque, enque fails
--but queue is consistent.
--SIZE must be 2^(WIDTH) and WIDTH > 1.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FIFO is
  generic (
    SIZE : integer := 256;
    WIDTH : integer := 8);
  port (
    clk : in std_logic;
    idata : in std_logic_vector(31 downto 0);
    odata : out std_logic_vector(31 downto 0);
    igo : in std_logic;
    ogo : in std_logic;
    empty : out std_logic;
    full : out std_logic);
end FIFO;

architecture arch_fifo of FIFO is
  type ram_t is array(0 to SIZE-1) of std_logic_vector(31 downto 0);
  signal QUE : ram_t;
  signal enq_addr : std_logic_vector(WIDTH-1 downto 0)
    := (others => '0'); --enque addr
  signal deq_addr : std_logic_vector(WIDTH-1 downto 0)
    := (others => '0'); --deque addr
  
  
begin
  
  process(clk)
  begin
    if rising_edge(clk) then
      if igo = '1' and ogo = '1' and
        enq_addr = deq_addr then --when queue is empty
        odata <= idata;
      elsif igo = '1' then
        if enq_addr+1 /= deq_addr then
          --when queue is not full
          enq_addr <= enq_addr+1;
          QUE(conv_integer(enq_addr)) <= idata;
        end if;
      elsif ogo = '1' then
        if enq_addr /= deq_addr then
          -- when queue is not empty
          deq_addr <= deq_addr+1;
          odata <= QUE(conv_integer(deq_addr));
        end if;
      end if;
    end if;
  end process;
  
  empty <= '1' when enq_addr = deq_addr else
           '0';
  full <= '1' when enq_addr+1 = deq_addr else
          '0';
end arch_fifo;
    
    
