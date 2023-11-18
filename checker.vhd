LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

LIBRARY dividing_blocks;
USE dividing_blocks.all;


ENTITY checker IS
  PORT (dIn:   IN STD_LOGIC_VECTOR (23 DOWNTO 0);
        cnt:   OUT STD_LOGIC);
END checker;

ARCHITECTURE structure OF checker IS
	
	SIGNAL iSig: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	COMPONENT divider_remainder
	  PORT (a:		IN STD_LOGIC_VECTOR (23 DOWNTO 0);
			 rOut:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT gateOr8
	  PORT (x:		IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			  y:		OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
	div0: divider_remainder	PORT MAP (dIn, iSig);
	or0: gateOr8 				PORT MAP (iSIg, cnt);
END structure;