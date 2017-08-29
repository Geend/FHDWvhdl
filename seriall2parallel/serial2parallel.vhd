----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:01 08/27/2017 
-- Design Name: 
-- Module Name:    serial2parallel - Behavioral 
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
use ieee.numeric_std.ALL;

entity serial2parallel is
	port( clk: in STD_LOGIC;
			reset: in STD_LOGIC;
			seriallIn: in STD_LOGIC;
			ens: in STD_LOGIC;
			parallelOut: out STD_LOGIC_VECTOR(7 downto 0));
			
			
end serial2parallel;

architecture Behavioral of serial2parallel is

	signal bitCounter : ieee.numeric_std.unsigned(2 downto 0) := "000";
	shared variable inputBuffer: STD_LOGIC_VECTOR(7 downto 0) := "00000000";

	begin	
		process(clk, reset, ens, seriallIn)		
		begin
			if(rising_edge(clk)) then
				if(reset= '1') then			
					inputBuffer := "00000000";
					parallelOut <= "00000000";
					bitCounter <= "000";
				else					
					if(ens = '1') then
						inputBuffer(7 downto 1) := inputBuffer(6 downto 0);
						inputBuffer(0) := seriallIn;
						
						if(bitCounter = "111") then
							parallelOut <= inputBuffer;
							bitCounter <= "000";
							
						else
							bitCounter <= bitCounter + 1;
						end if;						
					else
						inputBuffer := "00000000";
						bitCounter <= "000";		
					end if;
				end if;
			end if;
		end process;


end Behavioral;

