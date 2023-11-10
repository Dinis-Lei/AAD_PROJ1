LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

LIBRARY storeDev;
USE storeDev.all;

LIBRARY control;
USE control.all;


ENTITY encoder_bit_serial IS
  PORT (nGRst: IN STD_LOGIC;
        clk:   IN STD_LOGIC;
        dIn:   IN STD_LOGIC;
		  tmp4:	IN STD_LOGIC;
		  tmp:	IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		  tmp1:  OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		  tmp2:	OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		  tmp3: 	OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
		  tSet: OUT STD_LOGIC;
		  tRst: OUT STD_LOGIC;
		  tClk: OUT STD_LOGIC;
        cnt:   OUT STD_LOGIC_VECTOR (8 DOWNTO 0));
END encoder_bit_serial;

ARCHITECTURE structure OF encoder_bit_serial IS

	SIGNAL iAn: 	STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL iRn: 	STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL iCnt:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL iSet, iRst, iClk: STD_LOGIC;

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
	
	COMPONENT binCounter_5bit
    PORT (nRst: IN STD_LOGIC;
          clk:  IN STD_LOGIC;
          c:    OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT control
    PORT (nGRst: IN STD_LOGIC;
          clk:   IN STD_LOGIC;
          add:   IN STD_LOGIC_VECTOR (4 DOWNTO 0);
          nRst:  OUT STD_LOGIC;
          nSetO: OUT STD_LOGIC;
          clkO:  OUT STD_LOGIC);
  END COMPONENT;
BEGIN

	reg0: parReg_9bit  		PORT MAP (iSet, iClk, iRn, cnt);
	reg1: parShiftReg_16bit PORT MAP (iRst, clk, dIn, iAn);
	div0: divider_block 		PORT MAP (iAn, iRn);
	ctr0: binCounter_5bit	PORT MAP (iRst, clk, iCnt);
	con0: control  			PORT MAP (nGRst, clk, iCnt, iRst, iSet, iClk);
	
	tmp1 <= iAn;
	tmp2 <= iRn;
	tmp3 <= iCnt;
	
	tSet <= iSet;
	tRst <= iRst;
	tClk <= iClk;
	
END structure;
