--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:11:14 08/20/2017
-- Design Name:   
-- Module Name:   /home/torben/sync/FHDW/BES2-U2/vhdl/stopwatch/stopwatch_tb.vhd
-- Project Name:  stopwatch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stopwatch
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
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY stopwatch_tb IS
END stopwatch_tb;
 
ARCHITECTURE test_bench OF stopwatch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT stopwatch	 	 
   	Port( clk : in STD_LOGIC;
			startStop : in STD_LOGIC;
			reset : in STD_LOGIC;
			systemReset : in STD_LOGIC;
			watchRunning : out STD_LOGIC;
			watchReset : out STD_LOGIC);
    END COMPONENT;
	 
	 
	--Clock
	SIGNAL clk: STD_LOGIC:='0';
	constant clk_period : time := 50 ns;
	
	
	--Inputs
	SIGNAL startStop: STD_LOGIC:='0';
	SIGNAL reset: STD_LOGIC:='0';
	SIGNAL systemReset: STD_LOGIC:='0';

	--Outputs
	SIGNAL watchRunning: STD_LOGIC;
   SIGNAL watchReset: STD_LOGIC;


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


 
 shared variable expectedWatchRunning : CHARACTER;
 shared variable expectedwatchReset : CHARACTER;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stopwatch PORT MAP (
						clk => clk,
						startStop=>startStop,
						reset=>reset,
						systemReset=>systemReset,
						watchRunning=>watchRunning,
						watchReset=>watchReset
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
  VARIABLE varStartStop: CHARACTER;
  VARIABLE varReset: CHARACTER;
  VARIABLE varSystemReset: CHARACTER;

BEGIN
  IF(clk'EVENT AND clk = '1') THEN
    IF(NOT endfile(testpattern)) THEN
      readline(testpattern, zeile);
      read(zeile, varStartStop);
      startStop <= char2std_logic(varStartStop);
		-- erspringen des Leerzeichens
      read(zeile, leerzeichen);
      read(zeile, varReset);
      reset <= char2std_logic(varReset);
		-- erspringen des Leerzeichens
		read(zeile, leerzeichen);
      read(zeile, varSystemReset);
      systemReset <= char2std_logic(varSystemReset);
    ELSE
      startStop <= '0';
      reset <= '0';
		systemReset <= '0';
    END IF;
  END IF;
END PROCESS STIMULI;

RESPONSE: PROCESS(clk)
  FILE vergleichspattern: TEXT OPEN READ_MODE IS "expected.txt";
  VARIABLE zeile: LINE;
  VARIABLE leerzeichen: CHARACTER;
  VARIABLE varWatchRunning: CHARACTER;
  VARIABLE varWatchReset: CHARACTER;

BEGIN
  IF(clk'EVENT AND clk = '1') THEN
    IF(NOW > 100 ns) THEN
      IF(NOT endfile(vergleichspattern)) THEN
        readline(vergleichspattern, zeile);
        read(zeile, varWatchRunning);
		  expectedWatchRunning := varWatchRunning;
		  -- erspringen des Leerzeichens
			read(zeile, leerzeichen);
			read(zeile, varWatchReset);
			expectedWatchReset := varWatchReset;
		  
		  
        ASSERT char2std_logic(expectedWatchRunning) = watchRunning
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & expectedWatchRunning & "  Ergebnis: " & std_logic2char(watchRunning)
          SEVERITY WARNING;
			 
			  
        ASSERT char2std_logic(expectedWatchReset) = watchReset
          REPORT "Vergleich fehlerhaft!" & "  Erwartungswert: " & expectedWatchReset & "  Ergebnis: " & std_logic2char(watchReset)
          SEVERITY WARNING;
			 
		ELSE expectedWatchRunning := 'X'; expectedWatchReset := 'X';
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
      write(zeile, "startStop: " & std_logic2char(startStop));
      write(zeile, leerzeichen);
		write(zeile, "reset: " & std_logic2char(reset));
      write(zeile, leerzeichen);
		write(zeile, "systemReset: " & std_logic2char(systemReset));
      write(zeile, leerzeichen);
		write(zeile, "wRunning: e" & expectedWatchRunning & " a"& std_logic2char(watchRunning) );
      write(zeile, leerzeichen);
		write(zeile, "wReset: e" & expectedWatchReset & " a"& std_logic2char(watchReset) );
      write(zeile, leerzeichen);
      write(zeile, "t: ");
		write(zeile, simulationszeit);
      writeline(protokoll, zeile);
    END IF;
  END IF;	 
END PROCESS MONITOR;

END;
