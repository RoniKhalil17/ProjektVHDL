----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:34:44 01/27/2015 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity ZyboVIO_top is
  port (
      clk125 : in std_logic;
      pbtn : in std_logic_vector(3 downto 0);
      psw : in std_logic_vector(3 downto 0);
      pled : out std_logic_vector(2 downto 0);
      blinky : out std_logic
  );
end ZyboVIO_top;

architecture Behavioral of ZyboVIO_top is	
   COMPONENT ZyboVIO_S
	PORT(
		vsw : OUT std_logic_vector(7 downto 0);
		vbtn : OUT std_logic_vector(4 downto 0);          
		vled : IN std_logic_vector(7 downto 0);
      vsseg : IN std_logic_vector (7 downto 0);
      van : IN std_logic_vector (3 downto 0);
      useVHex47Seg : IN std_logic;
		vhex : IN std_logic_vector(15 downto 0);
      sink : IN std_logic;
      blinky : OUT std_logic
		);
	END COMPONENT;
   attribute box_type : string; 
   attribute box_type of ZyboVIO_S : component is "black_box"; 


   --attribute black_box : boolean;
   --attribute black_box of ZyboVIO_S: component is true;

   signal sw : std_logic_vector (7 downto 0);
	signal btn : std_logic_vector(4 downto 0);          
	signal led : std_logic_vector(7 downto 0);
   signal sseg : std_logic_vector(7 downto 0);
   signal an : std_logic_vector(3 downto 0);
	signal hex : std_logic_vector(15 downto 0);
   signal useHex47Seg : std_logic;
   signal psw_d : std_logic_vector(3 downto 0);
   signal pbtn_d : std_logic_vector(3 downto 0);
   signal sink : std_logic;
begin

   Inst_student_code: entity work.student_code 
   PORT MAP(
		btn => btn,
		sw => sw,
		led => led,
		sseg => sseg,
		an => an,
		hex => hex,
		useHex47Seg => useHex47Seg,
		pbtn => pbtn_d,
		psw => psw_d,
		pled => pled,
      sink => sink,
		clk125 => clk125
	);

	Inst_ZyboVIO_S: ZyboVIO_S 
   PORT MAP(
		vled => led,
		vsw => sw,
		vbtn => btn,
      vsseg => sseg,
      van => an,
      --Extras (not on Nexys3)
      useVHex47Seg => useHex47Seg,
		vhex => hex,
      sink => sink,
      blinky => blinky
	);
	
   --Here we debounce the physical buttons and switches
    my_debounce: for i in 0 to 3 generate
      --debounding the physical buttons
      Inst_debounce1: entity work.debounce 
      PORT MAP(
         clk => clk125,
         reset => '0',
         input => pbtn(i),
         output => pbtn_d(i)
      );
      --debouncing the physical switches
      Inst_debounce2: entity work.debounce 
      PORT MAP(
         clk => clk125,
         reset => '0',
         input => psw(i),
         output => psw_d(i)
      );
   end generate;
end Behavioral;
