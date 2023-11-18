LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor2 IS
  PORT (x0, x1: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateXor2;

ARCHITECTURE logicFunction OF gateXor2 IS
BEGIN
  y <= x0 XOR x1;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor7 IS
  PORT (x: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
        y:      OUT STD_LOGIC);
END gateXor7;

ARCHITECTURE structure OF gateXor7 IS
	SIGNAL iSig: STD_LOGIC_VECTOR (4 DOWNTO 0);
	COMPONENT gateXor2
    PORT (x0, x1: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
	END COMPONENT;
BEGIN
  xor0: gateXor2 PORT MAP (x(0), 	x(1), iSig(0));
  xor1: gateXor2 PORT MAP (iSig(0), x(2), iSig(1));
  xor2: gateXor2 PORT MAP (iSig(1), x(3), iSig(2));
  xor3: gateXor2 PORT MAP (iSig(2), x(4), iSig(3));
  xor4: gateXor2 PORT MAP (iSig(3), x(5), iSig(4));
  xor5: gateXor2 PORT MAP (iSig(4), x(6), y);
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor8 IS
  PORT (x: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        y:      OUT STD_LOGIC);
END gateXor8;

ARCHITECTURE structure OF gateXor8 IS
	SIGNAL iSig: STD_LOGIC;
	COMPONENT gateXor7
    PORT (x: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
			 y:      OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT gateXor2
    PORT (x0, x1: IN STD_LOGIC;
			 y:      OUT STD_LOGIC);
	END COMPONENT;
BEGIN
  xor0: gateXor7 PORT MAP (x(6 DOWNTO 0), iSig);
  xor1: gateXor2 PORT MAP (iSig, x(7), y);
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor9 IS
  PORT (x: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
        y:      OUT STD_LOGIC);
END gateXor9;

ARCHITECTURE structure OF gateXor9 IS
	SIGNAL iSig: STD_LOGIC;
	COMPONENT gateXor8
    PORT (x: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			 y:      OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT gateXor2
    PORT (x0, x1: IN STD_LOGIC;
			 y:      OUT STD_LOGIC);
	END COMPONENT;
BEGIN
  xor0: gateXor8 PORT MAP (x(7 DOWNTO 0), iSig);
  xor1: gateXor2 PORT MAP (iSig, x(8), y);
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor10 IS
  PORT (x: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
        y:      OUT STD_LOGIC);
END gateXor10;

ARCHITECTURE structure OF gateXor10 IS
	SIGNAL iSig: STD_LOGIC;
	COMPONENT gateXor9
    PORT (x: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
			 y:      OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT gateXor2
    PORT (x0, x1: IN STD_LOGIC;
			 y:      OUT STD_LOGIC);
	END COMPONENT;
BEGIN
  xor0: gateXor9 PORT MAP (x(8 DOWNTO 0), iSig);
  xor1: gateXor2 PORT MAP (iSig, x(9), y);
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor11 IS
  PORT (x: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
        y:      OUT STD_LOGIC);
END gateXor11;

ARCHITECTURE structure OF gateXor11 IS
	SIGNAL iSig: STD_LOGIC;
	COMPONENT gateXor10
    PORT (x: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			 y:      OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT gateXor2
    PORT (x0, x1: IN STD_LOGIC;
			 y:      OUT STD_LOGIC);
	END COMPONENT;
BEGIN
  xor0: gateXor10 PORT MAP (x(9 DOWNTO 0), iSig);
  xor1: gateXor2 PORT MAP (iSig, x(10), y);
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateInv IS
  PORT (x: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateInv;

ARCHITECTURE logicFunction OF gateInv IS
BEGIN
  y <= not x;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateAnd2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateAnd2;

ARCHITECTURE logicFunction OF gateAnd2 IS
BEGIN
  y <= x1 AND x2;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateNand2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateNand2;

ARCHITECTURE logicFunction OF gateNand2 IS
BEGIN
  y <= NOT (x1 AND x2);
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateNor2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateNor2;

ARCHITECTURE logicFunction OF gateNor2 IS
BEGIN
  y <= NOT (x1 OR x2);
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateOr2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateOr2;

ARCHITECTURE logicFunction OF gateOr2 IS
BEGIN
  y <= x1 OR x2;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateOr8 IS
  PORT (x: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        y: OUT STD_LOGIC);
END gateOr8;

ARCHITECTURE structure OF gateOr8 IS
	SIGNAL iSig: STD_LOGIC_VECTOR (5 DOWNTO 0);
	COMPONENT gateOr2
    PORT (x1, x2: IN STD_LOGIC;
			 y:      OUT STD_LOGIC);
	END COMPONENT;
BEGIN
  and0: gateOr2 PORT MAP (x(0), x(1), 	iSig(0));
  and1: gateOr2 PORT MAP (x(2), iSig(0), iSig(1));
  and2: gateOr2 PORT MAP (x(3), iSig(1), iSig(2));
  and3: gateOr2 PORT MAP (x(4), iSig(2), iSig(3));
  and4: gateOr2 PORT MAP (x(5), iSig(3), iSig(4));
  and5: gateOr2 PORT MAP (x(6), iSig(4), iSig(5));
  and6: gateOr2 PORT MAP (x(7), iSig(5), y);
END structure;