----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/17/2022 04:50:13 PM
-- Design Name: 
-- Module Name: iobuffer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity iobuffer is
    Port ( buf_in : in STD_LOGIC;
           buf_out : out STD_LOGIC;
           buf_en : in STD_LOGIC;
           buf_inout : inout STD_LOGIC);
end iobuffer;

architecture Behavioral of iobuffer is
begin

	buf_inout <= buf_in when (buf_en = '1') else 'Z';
	buf_out <= buf_inout;

end Behavioral;
