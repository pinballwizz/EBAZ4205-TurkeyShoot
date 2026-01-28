---------------------------------------------------------------------------------
--                         Turkey Shoot - EBAZ4205
--                           Code from DarFPGA
--
--                         Modified for EBAZ4205 
--                            by pinballwiz.org 
--                               28/01/2026
---------------------------------------------------------------------------------
-- Keyboard inputs :
--   5 : Add coin
--   2 : Start 2 players
--   1 : Start 1 player
--   LEFT Ctrl   : Fire
--   X   	     : Grenade
--  Space        : Gobble
--   RIGHT arrow : Move Right
--   LEFT arrow  : Move Left
--   UP arrow    : Move Up
--   DOWN arrow  : Move Down
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;
---------------------------------------------------------------------------------
entity turkeyshoot_ebaz4205 is
port(
	clock_50    : in std_logic;
   	I_RESET     : in std_logic;
	O_VIDEO_R	: out std_logic_vector(2 downto 0); 
	O_VIDEO_G	: out std_logic_vector(2 downto 0);
	O_VIDEO_B	: out std_logic_vector(1 downto 0);
	O_HSYNC		: out std_logic;
	O_VSYNC		: out std_logic;
	O_AUDIO_L 	: out std_logic;
	O_AUDIO_R 	: out std_logic;
	greenLED 	: out std_logic;
	redLED 	    : out std_logic;
   	ps2_clk     : in std_logic;
	ps2_dat     : inout std_logic;
	led         : out std_logic_vector(7 downto 0)
);
end turkeyshoot_ebaz4205;
------------------------------------------------------------------------------
architecture struct of turkeyshoot_ebaz4205 is
 
 signal clock_24 : std_logic;
 signal clock_18  : std_logic;
 signal clock_12 : std_logic;
 signal clock_9  : std_logic;

 --
 signal video_r  : std_logic_vector(2 downto 0);
 signal video_g  : std_logic_vector(2 downto 0);
 signal video_b  : std_logic_vector(1 downto 0);
 --
 signal h_sync   : std_logic;
 signal v_sync	 : std_logic;
 --
 signal reset    : std_logic;
 --
 signal kbd_intr        : std_logic;
 signal kbd_scancode    : std_logic_vector(7 downto 0);
 signal joy_BBBBFRLDU   : std_logic_vector(9 downto 0);
 --
 constant CLOCK_FREQ    : integer := 27E6;
 signal counter_clk     : std_logic_vector(25 downto 0);
 signal clock_4hz       : std_logic;
 signal AD              : std_logic_vector(15 downto 0);
---------------------------------------------------------------------------
component turkeyshoot_clocks
port(
  clk_out1          : out    std_logic;
  clk_out2          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;
---------------------------------------------------------------------------
begin

 reset <= not I_RESET;
 greenLED <= '1'; -- turn off leds
 redLED   <= '1';

---------------------------------------------------------------------------
Clocks: turkeyshoot_clocks
    port map (
        clk_in1   => clock_50,
        clk_out1  => clock_24,
        clk_out2  => clock_18

    );
---------------------------------------------------------------------------
-- Clocks Divide

process (Clock_24)
begin
 if rising_edge(Clock_24) then
	clock_12  <= not clock_12;
 end if;
end process;
--
process (Clock_18)
begin
 if rising_edge(Clock_18) then
	clock_9  <= not clock_9;
 end if;
end process;
---------------------------------------------------------------------------
-- Main
pm : entity work.williams2
port map (
	reset		=> reset,
	clock_24	=> clock_24,
	clock_18	=> clock_18,
    clock_12	=> clock_12,
    vga_r		=> video_r,
    vga_g		=> video_g,
    vga_b    	=> video_b,
    video_hs_out => h_sync,
    video_vs_out => v_sync,
	audio_l		=> O_AUDIO_L,
	audio_r		=> O_AUDIO_R,
	btn_gobble  => joy_BBBBFRLDU(9),
    btn_grenade => joy_BBBBFRLDU(8),
 	btn_up		=> joy_BBBBFRLDU(0),
 	btn_down	=> joy_BBBBFRLDU(1),
	btn_left	=> joy_BBBBFRLDU(2),
	btn_right	=> joy_BBBBFRLDU(3),
	btn_trigger	=> joy_BBBBFRLDU(4),
    btn_coin    => joy_BBBBFRLDU(7),
    btn_start_1 => joy_BBBBFRLDU(5),
    btn_start_2 => joy_BBBBFRLDU(6),
    AD          => AD
); 
-------------------------------------------------------------------------
-- vga output

	O_VIDEO_R 	<= video_r;
	O_VIDEO_G 	<= video_g;
	O_VIDEO_B 	<= video_b;
	O_HSYNC     <= h_sync;
	O_VSYNC     <= v_sync;
------------------------------------------------------------------------------
-- get scancode from keyboard

keyboard : entity work.io_ps2_keyboard
port map (
  clk       => clock_9,
  kbd_clk   => ps2_clk,
  kbd_dat   => ps2_dat,
  interrupt => kbd_intr,
  scancode  => kbd_scancode
);
------------------------------------------------------------------------------
-- translate scancode to joystick

joystick : entity work.kbd_joystick
port map (
  clk         => clock_9,
  kbdint      => kbd_intr,
  kbdscancode => std_logic_vector(kbd_scancode), 
  joy_BBBBFRLDU  => joy_BBBBFRLDU 
);
------------------------------------------------------------------------------
-- debug

process(reset, clock_24)
begin
  if reset = '1' then
   clock_4hz <= '0';
   counter_clk <= (others => '0');
  else
    if rising_edge(clock_24) then
      if counter_clk = CLOCK_FREQ/8 then
        counter_clk <= (others => '0');
        clock_4hz <= not clock_4hz;
        led(7 downto 0) <= not AD(14 downto 7);
      else
        counter_clk <= counter_clk + 1;
      end if;
    end if;
  end if;
end process;
------------------------------------------------------------------------------
end struct;