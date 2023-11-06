LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

LIBRARY storeDev;
USE storeDev.all;


ENTITY encoder_bit_serial IS
  PORT (nGRst: IN STD_LOGIC;
        clk:   IN STD_LOGIC;
        dIn:   IN STD_LOGIC;
		  tmp:	IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		  tmp1:  OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		  tmp2:	OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        cnt:   OUT STD_LOGIC_VECTOR (8 DOWNTO 0));
END encoder_bit_serial;

ARCHITECTURE structure OF encoder_bit_serial IS

	SIGNAL iAn: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL iRn: STD_LOGIC_VECTOR (7 DOWNTO 0);

	COMPONENT parReg_9bit
    PORT (nSet: IN STD_LOGIC;
			 clk: IN STD_LOGIC;
			 D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			 Q: OUT STD_LOGIC_VECTOR (8 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT parShiftReg_16bit
	PORT (nSet: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        dIn: IN STD_LOGIC;
        Q: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT divider_block
	PORT (a:		IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        rOut:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
BEGIN

	reg0: parReg_9bit  PORT MAP (nGRst, clk, iRn, cnt);
	reg1: parShiftReg_16bit PORT MAP (nGRst, clk, dIn, iAn);
	div0: divider_block PORT MAP (iAn, iRn);
	
	tmp1 <= iAn;
	tmp2 <= iRn;
	
END structure;
