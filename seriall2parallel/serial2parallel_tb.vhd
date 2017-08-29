--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:20:42 08/27/2017
-- Design Name:   
-- Module Name:   /home/torben/sync/FHDW/BES2-U2/vhdl/Projekte/serial2parallel/serial2parallel_tb.vhd
-- Project Name:  serial2parallel
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: serial2parallel
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE STD.TEXTIO.ALL;
--USE ieee.numeric_std.ALL;
--use IEEE.std_logic_unsigned.all
 

 
ENTITY serial2parallel_tb IS
END serial2parallel_tb;
 
ARCHITECTURE behavior OF serial2parallel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT serial2parallel
    PORT(
         clk : IN  std_logic;
			reset: IN std_logic;
         seriallIn : IN  std_logic;
         ens : IN  std_logic;
         parallelOut : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	signal reset : std_logic := '0';
   signal seriallIn : std_logic := '0';
   signal ens : std_logic := '0';

 	--Outputs
   signal parallelOut : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
	 
	--Functions
	FUNCTION char2std_logic (ch: IN CHARACTER) RETURN STD_LOGIC IS
	BEGIN
	  CASE ch IS
		 WHEN 'U' | 'u' => RETURN 'U';
		 WHEN 'X' | 'x' => RETURN 'X';
		 WHEN '0' => RETURN '0';
		 WHEN '1'=> RETURN '1';
		 WHEN 'Z' | 'z' => RETURN 'Z';
		 WHEN 'W' | 'w' => RETURN 'W';
		 WHEN 'L' | 'l' => RETURN 'L';
		 WHEN 'H' | 'h' => RETURN 'H';
		 WHEN '-' => RETURN '-';
		 WHEN OTHERS =>
	  ASSERT FALSE
		 REPORT "Illegal Character found" & ch
		 SEVERITY ERROR;
	  RETURN 'U';
	  END CASE;
	END;

	FUNCTION string2std_logic (s: STRING) RETURN STD_LOGIC_VECTOR IS
	VARIABLE vector: STD_LOGIC_VECTOR(s'LEFT - 1 DOWNTO 0);
	BEGIN
	  FOR i IN s'RANGE LOOP
		 vector(i-1) := char2std_logic(s(i));
	  END LOOP;
	  RETURN vector;
	END;

	-- converts std_logic into a character
	FUNCTION std_logic2char(sl: std_logic) return character is
		 variable c: character;
		 begin
			case sl is
				when 'U' => c:= 'U';
				when 'X' => c:= 'X';
				when '0' => c:= '0';
				when '1' => c:= '1';
				when 'Z' => c:= 'Z';
				when 'W' => c:= 'W';
				when 'L' => c:= 'L';
				when 'H' => c:= 'H';
				when '-' => c:= '-';
			end case;
		 return c;
		end std_logic2char;

	FUNCTION std_logic_vector2string(slv: std_logic_vector) return string is
	  variable result : string (1 to slv'length);
	  variable r : integer;
	begin
	  r := 1;
	  for i in slv'range loop
		 result(r) := std_logic2char(slv(i));
		 r := r + 1;
	  end loop;
	  return result;
	end std_logic_vector2string;

	shared variable expectedParallelOut : STRING(8 downto 1);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: serial2parallel PORT MAP (
          clk => clk,
			 reset => reset,
          seriallIn => seriallIn,
          ens => ens,
          parallelOut => parallelOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 


	STIMULI: PROCESS(clk)
	  FILE testpattern: TEXT OPEN READ_MODE IS "stimuli.txt";
	  VARIABLE zeile: LINE;
	  VARIABLE leerzeichen: CHARACTER;
	  VARIABLE varSerialIn: CHARACTER;
	  VARIABLE varENS: CHARACTER;
	  VARIABLE varReset: CHARACTER;

	BEGIN
	  IF(clk'EVENT AND clk = '1') THEN
	  IF(NOW > 100 ns) THEN
		 IF(NOT endfile(testpattern)) THEN
			readline(testpattern, zeile);
			read(zeile, varSerialIn);
			seriallIn <= char2std_logic(varSerialIn);
			-- erspringen des Leerzeichens
			read(zeile, leerzeichen);
			read(zeile, varENS);
			ens <= char2std_logic(varENS);
			-- erspringen des Leerzeichens
			read(zeile, leerzeichen);
			read(zeile, varReset);
			reset <= char2std_logic(varReset);
		 ELSE
			seriallIn <= '0';
			ens <= '0';
			reset <= '0';
		 END IF;
		 END IF;
	  END IF;
	END PROCESS STIMULI;

	RESPONSE: PROCESS(clk)
	  FILE vergleichspattern: TEXT OPEN READ_MODE IS "expected.txt";
	  VARIABLE zeile: LINE;
	  VARIABLE leerzeichen: CHARACTER;
	  VARIABLE varWatchParallelOut: STRING ( 8 downto 1);

	BEGIN
	  IF(clk'EVENT AND clk = '1') THEN
		 IF(NOW > 100 ns) THEN
			IF(NOT endfile(vergleichspattern)) THEN
			  readline(vergleichspattern, zeile);
			  read(zeile, varWatchParallelOut);
			  expectedParallelOut := varWatchParallelOut;
			  
			  
			  ASSERT string2std_logic(expectedParallelOut) = parallelOut
				 REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & expectedParallelOut & "  Ergebnis: " & std_logic_vector2string(parallelOut)
				 SEVERITY WARNING;			 
			
				 
			ELSE expectedParallelOut := "XXXXXXXX";
			END IF;
		 END IF;
	  END IF;
	  --out2 <= in1 * in2;
	END PROCESS RESPONSE;

	MONITOR: PROCESS(clk)
	  FILE protokoll: TEXT OPEN WRITE_MODE IS "monitor.txt";
	  VARIABLE zeile: LINE;
	  VARIABLE leerzeichen: CHARACTER := ' ';
	  VARIABLE simulationszeit: TIME;
	BEGIN
	  IF(NOW > 100 ns) THEN
		 IF(clk'EVENT AND clk = '1') THEN  
			simulationszeit := NOW;
			write(zeile, "seriallIn: " & std_logic2char(seriallIn));
			write(zeile, leerzeichen);
			write(zeile, "ens: " & std_logic2char(ens));
			write(zeile, leerzeichen);
			write(zeile, "reset: " & std_logic2char(reset));
			write(zeile, leerzeichen);
			write(zeile, "wPOut: e" & expectedParallelOut & " a"& std_logic_vector2string(parallelOut) );
			write(zeile, leerzeichen);
			write(zeile, "t: ");
			write(zeile, simulationszeit);
			writeline(protokoll, zeile);
		 END IF;
	  END IF;	 
	END PROCESS MONITOR;

END;
