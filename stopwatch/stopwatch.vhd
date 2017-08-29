----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:09:36 08/20/2017 
-- Design Name: 
-- Module Name:    stopwatch - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stopwatch is
	Port(	clk : in  STD_LOGIC;
			startStop : in STD_LOGIC;
			reset : in STD_LOGIC;
			systemReset : in STD_LOGIC;
			watchRunning : out STD_LOGIC;
			watchReset : out STD_LOGIC);	
end stopwatch;

architecture Behavioral of stopwatch is

constant stateZero : std_logic_vector(2 downto 0) := "000";
constant stateStart : std_logic_vector(2 downto 0) := "001";
constant stateRunning : std_logic_vector(2 downto 0) := "010";
constant stateStop : std_logic_vector(2 downto 0) := "011";
constant stateStopped : std_logic_vector(2 downto 0) := "100";
constant stateReset : std_logic_vector(2 downto 0) := "101";

signal state : std_logic_vector(2 downto 0) := stateZero;

begin
	
	

	output: process (clk, state)
	begin
	 IF rising_edge(clk) THEN
		case state is			
			when stateZero =>
				watchRunning <= '0';
				watchReset <= '0';

			when stateStart =>
				watchRunning <= '1';
				watchReset <= '0';
				
			when stateRunning =>
				watchRunning <= '1';
				watchReset <= '0';
				
			when stateStop =>
				watchRunning <= '0';
				watchReset <= '0';
				
			when stateStopped =>
				watchRunning <= '0';
				watchReset <= '0';

			when stateReset =>
				watchRunning <= '0';
				watchReset <= '1';				

			when others =>
				watchRunning <= '0';
				watchReset <= '0';
			
		end case;
		end if;
	end process;
	
	stateAndTransition: process (clk, state, startStop, reset, systemReset)
	VARIABLE newState: std_logic_vector(2 downto 0) ;
	begin
	 IF(clk'EVENT AND clk = '1') THEN
		case state is			
			when stateZero =>
				if startStop = '1' then
					newState := stateStart;
				end if;	
				
			when stateStart =>
				if startStop = '0' and reset = '0' then
					newState := stateRunning;
				end if;
				
			when stateRunning =>
				if startStop = '1' then
					newState := stateStop;
				end if;	
				
			when stateStop =>
				if startStop = '0' and reset = '0' then
					newState := stateStopped;
				end if;		
				
			when stateStopped =>
				if startStop = '0' and reset = '1' then
					newState := stateReset;
				elsif startStop = '1' then
					newState := stateStart;
				end if;		

			when stateReset =>
				if startStop = '0' and reset = '0' then
					newState := stateZero;
				end if;

			when others => newState := stateZero;
		end case;
		if(systemReset = '1') then
			newState := stateZero;
		end if;
		state <= newState;
		end if;
	end process;


end Behavioral;

