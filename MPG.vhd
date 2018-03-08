----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:08 03/01/2018 
-- Design Name: 
-- Module Name:    MPG - Behavioral 
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

entity MPG is
    Port ( clk : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           enable : out  STD_LOGIC);
end MPG;

architecture Behavioral of MPG is

signal count : STD_LOGIC_VECTOR (15 downto 0);
signal en, Q1, Q2, Q3 : STD_LOGIC;

begin

process(clk) 
begin
   if rising_edge(clk) then
      count <= count + 1;
   end if;
end process;

process(count)
begin
 if(count = x"FFFF") then
  en <= '1';
 else 
  en <= '0';
 end if;
end process;

process(clk,en)
begin
	if rising_edge(clk) then
		if en = '1' then
			Q1 <= btn;
		end if;
	end if;
end process;

process(clk)
begin
	if rising_edge(clk) then
		Q2 <= Q1;
	end if;
end process;

process(clk)
begin
	if rising_edge(clk) then
		Q3 <= Q2;
	end if;
end process;

enable <= Q2 and not(Q3);

end Behavioral;

