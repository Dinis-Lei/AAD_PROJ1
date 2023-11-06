LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY type1 IS
  PORT (rIn:	IN STD_LOGIC_VECTOR (8 DOWNTO 0);
        rOut:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END type1;

ARCHITECTURE structure OF type1 IS
  COMPONENT gateXor2
    PORT (x0, x1: IN STD_LOGIC;
          y: 		OUT STD_LOGIC);
  END COMPONENT;
BEGIN
	r7:	gateXor2 PORT MAP (rIn(8), rIn(7), rOut(7));
	rOut(6) <= rIn(6);
	r5:	gateXor2 PORT MAP (rIn(8), rIn(5), rOut(5));
	rOut(4) <= rIn(4);
	rOut(3) <= rIn(3);
	r2:	gateXor2 PORT MAP (rIn(8), rIn(2), rOut(2));
	r1:	gateXor2 PORT MAP (rIn(8), rIn(1), rOut(1));
	r0:	gateXor2 PORT MAP (rIn(8), rIn(0), rOut(0));
END structure;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY type2 IS
  PORT (rIn:	IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        rOut:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END type2;

ARCHITECTURE structure OF type2 IS
  COMPONENT gateXor2
    PORT (x0, x1: IN STD_LOGIC;
          y: 		OUT STD_LOGIC);
  END COMPONENT;
BEGIN
	r7:	gateXor2 PORT MAP (rIn(7), rIn(6), rOut(7));
	rOut(6) <= rIn(5);
	r5:	gateXor2 PORT MAP (rIn(7), rIn(4), rOut(5));
	rOut(4) <= rIn(3);
	rOut(3) <= rIn(2);
	r2:	gateXor2 PORT MAP (rIn(7), rIn(1), rOut(2));
	r1:	gateXor2 PORT MAP (rIn(7), rIn(0), rOut(1));
	rOut(0) <= rIn(7);
END structure;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY divider_block IS
  PORT (a:		IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        rOut:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END divider_block;

ARCHITECTURE structure OF divider_block IS
  SIGNAL iR15: STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR14: STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR13: STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR12: STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR11: STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR10: STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR9:	STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR8:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR7:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR6:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR5:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR4:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR3:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR2:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR1:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL iR0:  STD_LOGIC_VECTOR (7 DOWNTO 0);
  
  COMPONENT type1
    PORT (rIn:		IN STD_LOGIC_VECTOR (8 DOWNTO 0);
			 rOut:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT type2
    PORT (rIn:		IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			 rOut:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
BEGIN
	r15: 	type1 PORT MAP (a(15 DOWNTO 7), iR15);
	r14: 	type1 PORT MAP (iR15 & a(6), iR14);
	r13: 	type1 PORT MAP (iR14 & a(5), iR13);
	r12: 	type1 PORT MAP (iR13 & a(4), iR12);
	r11: 	type1 PORT MAP (iR12 & a(3), iR11);
	r10: 	type1 PORT MAP (iR11 & a(2), iR10);
	r9:	type1 PORT MAP (iR10 & a(1), iR9);
	r8: 	type1 PORT MAP (iR9  & a(0), iR8);
	r7: 	type2 PORT MAP (iR8,	iR7);
	r6: 	type2 PORT MAP (iR7,	iR6);
	r5: 	type2 PORT MAP (iR6, iR5);
	r4: 	type2 PORT MAP (iR5, iR4);
	r3: 	type2 PORT MAP (iR4, iR3);
	r2: 	type2 PORT MAP (iR3, iR2);
	r1: 	type2 PORT MAP (iR2, iR1);
	r0: 	type2 PORT MAP (iR1,	rOut);
END structure;




