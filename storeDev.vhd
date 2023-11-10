LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopDPET IS
  PORT (clk, D:     IN STD_LOGIC;
        nSet, nRst: IN STD_LOGIC;
        Q, nQ:      OUT STD_LOGIC);
END flipFlopDPET;

ARCHITECTURE behavior OF flipFlopDPET IS
BEGIN
  PROCESS (clk, nSet, nRst)
  BEGIN
    IF (nRst = '0')
	    THEN Q <= '0';
		      nQ <= '1';
		 ELSIF (nSet = '0')
		       THEN Q <= '1';
		            nQ <= '0';
	          ELSIF (clk = '1') AND (clk'EVENT)
	                THEN Q <= D;
		                  nQ <= NOT D;

	 END IF;
  END PROCESS;
END behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY binCounter_5bit IS
  PORT (nRst: IN STD_LOGIC;
        clk:  IN STD_LOGIC;
        c:    OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
END binCounter_5bit;

ARCHITECTURE structure OF binCounter_5bit IS
  SIGNAL pD1, pD2, pD3, pD4: STD_LOGIC;
  SIGNAL iD1, iD2, iD3, iD4, iD5: STD_LOGIC;
  SIGNAL iQ0, iQ1, iQ2, iQ3, iQ4, iQ5: STD_LOGIC;
  SIGNAL inQ0: STD_LOGIC;
  COMPONENT gateAnd2
    PORT (x1, x2: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT gateXor2
    PORT (x0, x1: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT flipFlopDPET
    PORT (clk, D:     IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ:      OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ad1: gateAnd2 PORT MAP (iQ0, iQ1, pD1);
  ad2: gateAnd2 PORT MAP (pD1, iQ2, pD2);
  ad3: gateAnd2 PORT MAP (pD2, iQ3, pD3);
  xr1: gateXor2 PORT MAP (iQ0, iQ1, iD1);
  xr2: gateXor2 PORT MAP (pD1, iQ2, iD2);
  xr3: gateXor2 PORT MAP (pD2, iQ3, iD3);
  xr4: gateXor2 PORT MAP (pD3, iQ4, iD4);
  ff0: flipFlopDPET PORT MAP (clk, inQ0, '1', nRst, iQ0, inQ0);
  ff1: flipFlopDPET PORT MAP (clk, iD1,  '1', nRst, iQ1);
  ff2: flipFlopDPET PORT MAP (clk, iD2,  '1', nRst, iQ2);
  ff3: flipFlopDPET PORT MAP (clk, iD3,  '1', nRst, iQ3);
  ff4: flipFlopDPET PORT MAP (clk, iD4,  '1', nRst, iQ4);
  c(0) <= iQ0;
  c(1) <= iQ1;
  c(2) <= iQ2;
  c(3) <= iQ3;
  c(4) <= iQ4;
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY parReg_9bit IS
  PORT (nSet: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        Q: OUT STD_LOGIC_VECTOR (8 DOWNTO 0));
END parReg_9bit;

ARCHITECTURE structure OF parReg_9bit IS
  
  	SIGNAL iSig: STD_LOGIC;
	
  COMPONENT flipFlopDPET
    PORT (clk, D: IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ: OUT STD_LOGIC);
  END COMPONENT;
  
  COMPONENT gateInv
    PORT (x: IN STD_LOGIC;
          y: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ff0: flipFlopDPET PORT MAP (clk, D(0), nSet, '1', Q(0));
  ff1: flipFlopDPET PORT MAP (clk, D(1), nSet, '1', Q(1));
  ff2: flipFlopDPET PORT MAP (clk, D(2), nSet, '1', Q(2));
  ff3: flipFlopDPET PORT MAP (clk, D(3), nSet, '1', Q(3));
  ff4: flipFlopDPET PORT MAP (clk, D(4), nSet, '1', Q(4));
  ff5: flipFlopDPET PORT MAP (clk, D(5), nSet, '1', Q(5));
  ff6: flipFlopDPET PORT MAP (clk, D(6), nSet, '1', Q(6));
  ff7: flipFlopDPET PORT MAP (clk, D(7), nSet, '1', Q(7));
  inv: gateInv PORT MAP (nSet, iSig);
  ff8: flipFlopDPET PORT MAP (clk, iSig, nSet, '1', Q(8));
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parShiftReg_16bit IS
  PORT (nSet: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        dIn: IN STD_LOGIC;
        Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END parShiftReg_16bit;

ARCHITECTURE structure OF parShiftReg_16bit IS

	SIGNAL iQ: STD_LOGIC_VECTOR (15 DOWNTO 0);

  COMPONENT flipFlopDPET
    PORT (clk, D: IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ff0: 	flipFlopDPET PORT MAP (clk, dIn, 	'1',nSet, iQ(0));
  ff1: 	flipFlopDPET PORT MAP (clk, iQ(0), 	 '1',nSet, iQ(1));
  ff2: 	flipFlopDPET PORT MAP (clk, iQ(1), 	 '1',nSet, iQ(2));
  ff3: 	flipFlopDPET PORT MAP (clk, iQ(2), 	 '1',nSet, iQ(3));
  ff4: 	flipFlopDPET PORT MAP (clk, iQ(3), 	 '1',nSet, iQ(4));
  ff5: 	flipFlopDPET PORT MAP (clk, iQ(4), 	 '1',nSet, iQ(5));
  ff6: 	flipFlopDPET PORT MAP (clk, iQ(5), 	 '1',nSet, iQ(6));
  ff7: 	flipFlopDPET PORT MAP (clk, iQ(6), 	 '1',nSet, iQ(7));
  ff8: 	flipFlopDPET PORT MAP (clk, iQ(7), 	 '1',nSet, iQ(8));
  ff9: 	flipFlopDPET PORT MAP (clk, iQ(8), 	 '1',nSet, iQ(9));
  ff10: 	flipFlopDPET PORT MAP (clk, iQ(9), 	 '1',nSet, iQ(10));
  ff11: 	flipFlopDPET PORT MAP (clk, iQ(10), 	 '1',nSet, iQ(11));
  ff12: 	flipFlopDPET PORT MAP (clk, iQ(11), 	 '1',nSet, iQ(12));
  ff13: 	flipFlopDPET PORT MAP (clk, iQ(12), 	 '1',nSet, iQ(13));
  ff14: 	flipFlopDPET PORT MAP (clk, iQ(13), 	 '1',nSet, iQ(14));
  ff15: 	flipFlopDPET PORT MAP (clk, iQ(14), 	 '1',nSet, iQ(15));
  Q <= iQ;

END structure;