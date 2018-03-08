----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:11 03/01/2018 
-- Design Name: 
-- Module Name:    test_new - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_new is
    Port ( clk : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (3 downto 0);
           --sw : in  STD_LOGIC_VECTOR (7 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
           --an : out  STD_LOGIC_VECTOR (3 downto 0);
           --cat : out  STD_LOGIC_VECTOR (6 downto 0);
           --dp : out  STD_LOGIC);
end test_new;

architecture Behavioral of test_new is

component MPG2
      port(clk : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR(3 downto 0);
           enable : out  STD_LOGIC);
end component MPG2;

signal count : STD_LOGIC_VECTOR (2 downto 0);
signal myCLK : STD_LOGIC;

begin

M2: MPG2 port map(clk, btn, myCLK);

process (myCLK) 
begin
   if myCLK'event and myCLK = '1' then
      count <= count + 1;
   end if;
end process;

process (count)
begin
 case count is
  when "000" => led <= "00000001";
  when "001" => led <= "00000010";
  when "010" => led <= "00000100";
  when "011" => led <= "00001000";
  when "100" => led <= "00010000";
  when "101" => led <= "00100000";
  when "110" => led <= "01000000";
  when others => led <= "10000000";
 end case;
end process;
end Behavioral;

